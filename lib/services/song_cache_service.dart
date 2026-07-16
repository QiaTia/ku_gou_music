import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/audio_quality.dart';
import '../models/cached_song.dart';

/// 歌曲缓存服务
/// 管理音频文件的本地缓存，使用 SQLite 存储元数据，文件系统存储音频数据
/// 支持 LRU 淘汰、多音质缓存、后台下载
class SongCacheService extends GetxService {
  Database? _db;
  late Directory _cacheDir;

  /// 缓存总大小上限：2GB
  static const int _maxCacheSizeBytes = 2 * 1024 * 1024 * 1024;

  /// 单个文件大小上限：200MB（无损音频可能很大）
  static const int _maxFileSizeBytes = 200 * 1024 * 1024;

  /// 数据库版本
  static const int _dbVersion = 1;

  /// 数据库名
  static const String _dbName = 'song_cache.db';

  /// 缓存目录名
  static const String _cacheDirName = 'song_cache';

  /// 当前缓存总大小（响应式，供UI绑定）
  final RxInt totalCacheSize = 0.obs;

  /// 当前缓存歌曲数量（响应式，供UI绑定）
  final RxInt cachedSongCount = 0.obs;

  /// 用于文件下载的独立Dio实例（不走请求加密逻辑）
  final _downloadDio = Dio();

  // ========== 初始化 ==========

  /// 初始化缓存服务（在 MusicBinding 中调用）
  Future<SongCacheService> init() async {
    // 1. 获取缓存目录
    final appDir = await getApplicationDocumentsDirectory();
    _cacheDir = Directory('${appDir.path}/$_cacheDirName');
    if (!_cacheDir.existsSync()) {
      _cacheDir.createSync(recursive: true);
    }

    // 2. 打开数据库
    _db = await openDatabase(
      '${appDir.path}/$_dbName',
      version: _dbVersion,
      onCreate: _onCreateDb,
    );

    // 3. 启动时清理孤立文件和临时文件
    await _cleanOrphanedEntries();
    await _cleanTempFiles();

    // 4. 统计当前缓存大小
    await _refreshCacheStats();

    return this;
  }

  Future<void> _onCreateDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cached_songs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        hash TEXT NOT NULL,
        quality TEXT NOT NULL,
        relative_path TEXT NOT NULL,
        file_size INTEGER NOT NULL,
        actual_bitrate INTEGER NOT NULL DEFAULT 0,
        ext_name TEXT NOT NULL DEFAULT 'mp3',
        song_name TEXT NOT NULL DEFAULT '',
        author TEXT NOT NULL DEFAULT '',
        last_access_time INTEGER NOT NULL,
        cached_time INTEGER NOT NULL,
        url_fetch_time INTEGER NOT NULL,
        source_url TEXT,
        UNIQUE(hash, quality)
      )
    ''');
    await db.execute(
      'CREATE INDEX idx_cached_songs_hash ON cached_songs(hash)',
    );
    await db.execute(
      'CREATE INDEX idx_cached_songs_last_access ON cached_songs(last_access_time)',
    );
    await db.execute(
      'CREATE INDEX idx_cached_songs_hash_quality_bitrate ON cached_songs(hash, quality, actual_bitrate)',
    );
  }

  // ========== 核心查询方法 ==========

  /// 检查某首歌是否有缓存（任意音质）
  Future<bool> hasCache(String hash) async {
    if (hash.isEmpty || _db == null) return false;
    final result = await _db!.query(
      'cached_songs',
      where: 'hash = ?',
      whereArgs: [hash],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  /// 获取某首歌的最佳缓存（最高音质）
  /// 返回最高音质的缓存记录，如果没有缓存则返回 null
  Future<CachedSong?> getBestCached(String hash) async {
    if (hash.isEmpty || _db == null) return null;
    final results = await _db!.query(
      'cached_songs',
      where: 'hash = ?',
      whereArgs: [hash],
      orderBy: 'actual_bitrate DESC',
      limit: 1,
    );
    if (results.isEmpty) return null;
    final cached = CachedSong.fromMap(results.first);
    // 验证文件是否确实存在
    if (!await _cacheFileExists(cached.relativePath)) {
      await _deleteEntry(cached);
      return null;
    }
    // 更新最后访问时间（LRU）
    await _updateLastAccessTime(cached.id!);
    return cached;
  }

  /// 获取某首歌指定音质的缓存
  Future<CachedSong?> getCachedByQuality(
      String hash, AudioQuality quality) async {
    if (hash.isEmpty || _db == null) return null;
    final results = await _db!.query(
      'cached_songs',
      where: 'hash = ? AND quality = ?',
      whereArgs: [hash, quality.apiValue],
      limit: 1,
    );
    if (results.isEmpty) return null;
    final cached = CachedSong.fromMap(results.first);
    if (!await _cacheFileExists(cached.relativePath)) {
      await _deleteEntry(cached);
      return null;
    }
    await _updateLastAccessTime(cached.id!);
    return cached;
  }

  /// 获取缓存文件的完整本地路径（用于 AudioSource.uri）
  /// 优先使用指定音质，若未指定或未命中则取最高音质
  Future<String?> getLocalFilePath(String hash,
      {AudioQuality? preferredQuality}) async {
    CachedSong? cached;
    if (preferredQuality != null) {
      // 先尝试指定音质
      cached = await getCachedByQuality(hash, preferredQuality);
    }
    // 如果指定音质没有缓存，或者未指定音质，尝试最高音质
    cached ??= await getBestCached(hash);
    if (cached == null) return null;
    return '${_cacheDir.path}/${cached.relativePath}';
  }

  /// 获取缓存文件的 file:// URI（直接传给 just_audio 的 AudioSource.uri）
  Future<Uri?> getLocalFileUri(String hash,
      {AudioQuality? preferredQuality}) async {
    final path =
        await getLocalFilePath(hash, preferredQuality: preferredQuality);
    if (path == null) return null;
    return Uri.file(path);
  }

  // ========== 缓存写入方法 ==========

  /// 从CDN URL下载并缓存音频文件
  ///
  /// [cdnUrl] 从 getMusicUrls() 获取的CDN地址
  /// [quality] 该URL对应的音质
  /// [songName], [author] 用于元数据记录
  /// [actualBitrate] 实际码率（可选，默认使用音质枚举的标称码率）
  ///
  /// 返回缓存后的本地文件路径，失败返回 null
  Future<String?> cacheFromUrl({
    required String hash,
    required String cdnUrl,
    required AudioQuality quality,
    required String songName,
    required String author,
    int actualBitrate = 0,
  }) async {
    if (hash.isEmpty || cdnUrl.isEmpty || _db == null) return null;

    // 1. 如果已有同hash+quality的缓存，直接返回
    final existing = await getCachedByQuality(hash, quality);
    if (existing != null) {
      final path = '${_cacheDir.path}/${existing.relativePath}';
      if (File(path).existsSync()) {
        return path; // 已缓存，无需重复下载
      }
    }

    // 2. 构造目标文件路径
    final relativePath = _buildRelativePath(hash, quality);
    final fullPath = '${_cacheDir.path}/$relativePath';

    // 3. 确保分桶目录存在
    final bucketDir = Directory(fullPath).parent;
    if (!bucketDir.existsSync()) {
      bucketDir.createSync(recursive: true);
    }

    // 4. 下载文件到临时路径（避免下载中断导致半成品文件）
    final tempPath = '$fullPath.tmp';
    try {
      await _downloadDio.download(
        cdnUrl,
        tempPath,
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
        ),
      );

      // 5. 验证下载文件
      final tempFile = File(tempPath);
      if (!tempFile.existsSync()) {
        throw Exception('下载文件不存在');
      }
      final fileSize = tempFile.lengthSync();
      if (fileSize < 1024) {
        throw Exception('文件过小(${fileSize}B)，可能下载失败');
      }
      if (fileSize > _maxFileSizeBytes) {
        throw Exception('文件过大(${fileSize}B)，超过上限');
      }

      // 6. 原子重命名：.tmp -> 正式文件
      final targetFile = File(fullPath);
      if (targetFile.existsSync()) {
        targetFile.deleteSync();
      }
      tempFile.renameSync(fullPath);

      // 7. 写入数据库元数据
      final now = DateTime.now();
      final cachedSong = CachedSong(
        hash: hash,
        quality: quality,
        relativePath: relativePath,
        fileSize: fileSize,
        actualBitrate: actualBitrate > 0 ? actualBitrate : quality.bitrate,
        extName: quality.extName,
        songName: songName,
        author: author,
        lastAccessTime: now,
        cachedTime: now,
        urlFetchTime: now,
        sourceUrl: cdnUrl,
      );

      await _db!.insert(
        'cached_songs',
        cachedSong.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // 8. 更新统计
      await _refreshCacheStats();

      // 9. 检查是否需要淘汰
      await _evictIfNeeded();

      return fullPath;
    } catch (e) {
      // 清理临时文件
      final tempFile = File(tempPath);
      if (tempFile.existsSync()) {
        tempFile.deleteSync();
      }
      print('⚠️ 缓存下载失败: $hash $quality - $e');
      return null;
    }
  }

  // ========== 缓存删除方法 ==========

  /// 删除某首歌的所有音质缓存
  Future<void> deleteCache(String hash) async {
    if (_db == null) return;
    final results = await _db!.query(
      'cached_songs',
      where: 'hash = ?',
      whereArgs: [hash],
    );
    for (final row in results) {
      final cached = CachedSong.fromMap(row);
      await _deleteEntry(cached);
    }
    await _refreshCacheStats();
  }

  /// 删除某首歌指定音质的缓存
  Future<void> deleteCacheByQuality(
      String hash, AudioQuality quality) async {
    final cached = await getCachedByQuality(hash, quality);
    if (cached != null) {
      await _deleteEntry(cached);
      await _refreshCacheStats();
    }
  }

  /// 清空所有缓存
  Future<void> clearAll() async {
    if (_db == null) return;
    // 删除所有缓存文件
    if (_cacheDir.existsSync()) {
      await _cacheDir.delete(recursive: true);
      _cacheDir.createSync(recursive: true);
    }
    // 清空数据库
    await _db!.delete('cached_songs');
    await _refreshCacheStats();
  }

  // ========== 缓存管理方法 ==========

  /// 获取所有缓存条目（用于UI展示缓存列表）
  Future<List<CachedSong>> getAllCached() async {
    if (_db == null) return [];
    final results = await _db!.query(
      'cached_songs',
      orderBy: 'last_access_time DESC',
    );
    return results.map(CachedSong.fromMap).toList();
  }

  /// 获取某首歌的所有已缓存音质
  Future<List<CachedSong>> getCachedQualities(String hash) async {
    if (_db == null) return [];
    final results = await _db!.query(
      'cached_songs',
      where: 'hash = ?',
      whereArgs: [hash],
      orderBy: 'actual_bitrate DESC',
    );
    return results.map(CachedSong.fromMap).toList();
  }

  // ========== 内部方法 ==========

  /// 计算缓存总大小
  Future<int> _calculateTotalSize() async {
    if (_db == null) return 0;
    final result = await _db!.rawQuery(
      'SELECT SUM(file_size) as total FROM cached_songs',
    );
    return (result.first['total'] as int?) ?? 0;
  }

  /// 刷新缓存统计（响应式变量）
  Future<void> _refreshCacheStats() async {
    if (_db == null) return;
    totalCacheSize.value = await _calculateTotalSize();
    cachedSongCount.value = Sqflite.firstIntValue(
          await _db!.rawQuery('SELECT COUNT(*) FROM cached_songs'),
        ) ??
        0;
  }

  /// 淘汰缓存直到总大小低于上限
  /// 按最后访问时间从早到晚删除，直到空间足够
  Future<void> _evictIfNeeded() async {
    if (_db == null) return;
    while (totalCacheSize.value > _maxCacheSizeBytes) {
      // 找到最久未访问的记录
      final results = await _db!.query(
        'cached_songs',
        orderBy: 'last_access_time ASC',
        limit: 1,
      );
      if (results.isEmpty) break;
      final oldest = CachedSong.fromMap(results.first);
      await _deleteEntry(oldest);
      await _refreshCacheStats();
    }
  }

  /// 构造相对路径: {hash前2字符}/{hash}_{quality}.{ext}
  String _buildRelativePath(String hash, AudioQuality quality) {
    final bucket = hash.length >= 2 ? hash.substring(0, 2).toLowerCase() : '00';
    return '$bucket/${hash}_${quality.apiValue}.${quality.extName}';
  }

  /// 检查缓存文件是否存在
  Future<bool> _cacheFileExists(String relativePath) async {
    return File('${_cacheDir.path}/$relativePath').exists();
  }

  /// 删除单条缓存（文件 + 数据库记录）
  Future<void> _deleteEntry(CachedSong cached) async {
    final file = File('${_cacheDir.path}/${cached.relativePath}');
    if (file.existsSync()) {
      file.deleteSync();
    }
    if (cached.id != null && _db != null) {
      await _db!.delete(
        'cached_songs',
        where: 'id = ?',
        whereArgs: [cached.id],
      );
    }
  }

  /// 更新最后访问时间
  Future<void> _updateLastAccessTime(int id) async {
    if (_db == null) return;
    await _db!.update(
      'cached_songs',
      {'last_access_time': DateTime.now().millisecondsSinceEpoch},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 清理孤立条目（数据库有记录但文件不存在）
  Future<void> _cleanOrphanedEntries() async {
    if (_db == null) return;
    final results = await _db!.query('cached_songs');
    for (final row in results) {
      final cached = CachedSong.fromMap(row);
      if (!await _cacheFileExists(cached.relativePath)) {
        await _deleteEntry(cached);
      }
    }
  }

  /// 清理临时下载文件（.tmp 后缀）
  Future<void> _cleanTempFiles() async {
    if (!_cacheDir.existsSync()) return;
    await for (final entity in _cacheDir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('.tmp')) {
        try {
          await entity.delete();
        } catch (_) {
          // 静默处理
        }
      }
    }
  }

  @override
  void onClose() {
    _db?.close();
    _downloadDio.close();
    super.onClose();
  }
}

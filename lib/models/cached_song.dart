import 'audio_quality.dart';

/// 缓存歌曲的元数据记录
/// 存储在 SQLite 中，每条记录对应一个已缓存的音频文件
class CachedSong {
  /// 主键：自增ID
  final int? id;

  /// 歌曲hash（来自 SongItemStruct.hash / SearchSongInfo.fileHash）
  final String hash;

  /// 音质等级（缓存key = hash + quality，同一首歌可有多个音质的缓存）
  final AudioQuality quality;

  /// 本地文件路径（相对于缓存根目录）
  /// 例如: "ab/cdef1234567890_320.mp3"
  final String relativePath;

  /// 文件大小（字节）
  final int fileSize;

  /// 码率（实际码率，从API或文件头获取，可能与 AudioQuality.bitrate 不同）
  final int actualBitrate;

  /// 文件扩展名
  final String extName;

  /// 歌曲名（冗余存储，用于UI展示缓存列表）
  final String songName;

  /// 歌手名
  final String author;

  /// 最后访问时间（用于LRU淘汰）
  final DateTime lastAccessTime;

  /// 缓存时间（文件下载完成的时间）
  final DateTime cachedTime;

  /// CDN URL 的获取时间（用于判断URL是否可能过期）
  final DateTime urlFetchTime;

  /// 原始CDN URL（可选，用于调试/验证）
  final String? sourceUrl;

  CachedSong({
    this.id,
    required this.hash,
    required this.quality,
    required this.relativePath,
    required this.fileSize,
    required this.actualBitrate,
    required this.extName,
    required this.songName,
    required this.author,
    required this.lastAccessTime,
    required this.cachedTime,
    required this.urlFetchTime,
    this.sourceUrl,
  });

  /// 缓存唯一标识 = hash + quality
  String get cacheKey => '${hash}_${quality.apiValue}';

  /// 从数据库行构造
  factory CachedSong.fromMap(Map<String, dynamic> map) => CachedSong(
        id: map['id'] as int?,
        hash: map['hash'] as String,
        quality:
            AudioQuality.fromApiValue(map['quality'] as String) ??
                AudioQuality.standard,
        relativePath: map['relative_path'] as String,
        fileSize: map['file_size'] as int,
        actualBitrate: map['actual_bitrate'] as int,
        extName: map['ext_name'] as String,
        songName: map['song_name'] as String,
        author: map['author'] as String,
        lastAccessTime: DateTime.fromMillisecondsSinceEpoch(
            map['last_access_time'] as int),
        cachedTime:
            DateTime.fromMillisecondsSinceEpoch(map['cached_time'] as int),
        urlFetchTime:
            DateTime.fromMillisecondsSinceEpoch(map['url_fetch_time'] as int),
        sourceUrl: map['source_url'] as String?,
      );

  /// 转为数据库行
  Map<String, dynamic> toMap() => {
        'hash': hash,
        'quality': quality.apiValue,
        'relative_path': relativePath,
        'file_size': fileSize,
        'actual_bitrate': actualBitrate,
        'ext_name': extName,
        'song_name': songName,
        'author': author,
        'last_access_time': lastAccessTime.millisecondsSinceEpoch,
        'cached_time': cachedTime.millisecondsSinceEpoch,
        'url_fetch_time': urlFetchTime.millisecondsSinceEpoch,
        'source_url': sourceUrl,
      };

  /// 创建副本并修改指定字段
  CachedSong copyWith({
    int? id,
    String? hash,
    AudioQuality? quality,
    String? relativePath,
    int? fileSize,
    int? actualBitrate,
    String? extName,
    String? songName,
    String? author,
    DateTime? lastAccessTime,
    DateTime? cachedTime,
    DateTime? urlFetchTime,
    String? sourceUrl,
  }) =>
      CachedSong(
        id: id ?? this.id,
        hash: hash ?? this.hash,
        quality: quality ?? this.quality,
        relativePath: relativePath ?? this.relativePath,
        fileSize: fileSize ?? this.fileSize,
        actualBitrate: actualBitrate ?? this.actualBitrate,
        extName: extName ?? this.extName,
        songName: songName ?? this.songName,
        author: author ?? this.author,
        lastAccessTime: lastAccessTime ?? this.lastAccessTime,
        cachedTime: cachedTime ?? this.cachedTime,
        urlFetchTime: urlFetchTime ?? this.urlFetchTime,
        sourceUrl: sourceUrl ?? this.sourceUrl,
      );
}

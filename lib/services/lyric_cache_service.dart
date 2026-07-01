import 'package:get_storage/get_storage.dart';

/// 歌词缓存服务
/// 使用 GetStorage 以歌曲 hash 为 key 缓存歌词内容
class LyricCacheService {
  static final LyricCacheService _instance = LyricCacheService._internal();
  factory LyricCacheService() => _instance;
  LyricCacheService._internal();

  final _box = GetStorage('lyric_cache');

  /// 缓存键前缀
  static const String _lyricKeyPrefix = 'lyric_';

  /// 生成缓存 key
  String _cacheKey(String hash) => '$_lyricKeyPrefix$hash';

  /// 获取缓存的歌词
  /// 返回歌词内容，如果没有缓存则返回 null
  String? getLyric(String hash) {
    if (hash.isEmpty) return null;
    try {
      final cached = _box.read<String>(_cacheKey(hash));
      return cached;
    } catch (e) {
      return null;
    }
  }

  /// 保存歌词到缓存
  Future<void> saveLyric(String hash, String lyricContent) async {
    if (hash.isEmpty || lyricContent.isEmpty) return;
    await _box.write(_cacheKey(hash), lyricContent);
  }

  /// 检查是否有缓存
  bool hasLyric(String hash) {
    if (hash.isEmpty) return false;
    return _box.read<String>(_cacheKey(hash)) != null;
  }

  /// 清除所有歌词缓存
  Future<void> clearAll() async {
    await _box.erase();
  }

  /// 获取缓存大小（字节数，近似值）
  int getCacheSize() {
    var size = 0;
    final keys = _box.getKeys();
    for (final key in keys) {
      final value = _box.read<String>(key);
      if (value != null) {
        size += value.length;
      }
    }
    return size;
  }
}

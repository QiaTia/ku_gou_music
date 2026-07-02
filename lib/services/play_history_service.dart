import 'package:get_storage/get_storage.dart';
import 'dart:convert';

/// 播放记录项基类
abstract class PlayHistoryItem {
  /// 唯一标识
  String get id;
  /// 名称
  String get name;
  /// 封面图
  String get cover;
  /// 播放时间戳
  int get playTime;
  /// 类型
  PlayHistoryType get type;

  Map<String, dynamic> toJson();
}

/// 播放记录类型
enum PlayHistoryType {
  song,     // 歌曲
  playlist, // 歌单
  album,    // 专辑
}

/// 歌曲播放记录
class SongPlayHistory implements PlayHistoryItem {
  @override
  final String id;
  @override
  final String name;
  @override
  final String cover;
  @override
  final int playTime;
  @override
  final PlayHistoryType type = PlayHistoryType.song;
  /// 歌曲hash
  final String hash;
  /// 歌手名
  final String author;
  /// 歌曲时长(秒)
  final int timelen;
  /// 音质特权
  final int privilege;
  /// 是否SQ
  final bool isSq;
  /// 是否HQ
  final bool isHq;
  /// MV hash
  final String mvhash;

  SongPlayHistory({
    required this.id,
    required this.name,
    required this.cover,
    required this.playTime,
    required this.hash,
    required this.author,
    this.timelen = 0,
    this.privilege = 0,
    this.isSq = false,
    this.isHq = false,
    this.mvhash = '',
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cover': cover,
    'playTime': playTime,
    'type': 'song',
    'hash': hash,
    'author': author,
    'timelen': timelen,
    'privilege': privilege,
    'isSq': isSq,
    'isHq': isHq,
    'mvhash': mvhash,
  };

  factory SongPlayHistory.fromJson(Map<String, dynamic> json) => SongPlayHistory(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    cover: json['cover'] ?? '',
    playTime: json['playTime'] ?? 0,
    hash: json['hash'] ?? '',
    author: json['author'] ?? '',
    timelen: json['timelen'] ?? 0,
    privilege: json['privilege'] ?? 0,
    isSq: json['isSq'] ?? false,
    isHq: json['isHq'] ?? false,
    mvhash: json['mvhash'] ?? '',
  );

  /// 创建副本并修改指定字段
  SongPlayHistory copyWith({
    String? id,
    String? name,
    String? cover,
    int? playTime,
    String? hash,
    String? author,
    int? timelen,
    int? privilege,
    bool? isSq,
    bool? isHq,
    String? mvhash,
  }) => SongPlayHistory(
    id: id ?? this.id,
    name: name ?? this.name,
    cover: cover ?? this.cover,
    playTime: playTime ?? this.playTime,
    hash: hash ?? this.hash,
    author: author ?? this.author,
    timelen: timelen ?? this.timelen,
    privilege: privilege ?? this.privilege,
    isSq: isSq ?? this.isSq,
    isHq: isHq ?? this.isHq,
    mvhash: mvhash ?? this.mvhash,
  );
}

/// 歌单播放记录
class PlaylistPlayHistory implements PlayHistoryItem {
  @override
  final String id;
  @override
  final String name;
  @override
  final String cover;
  @override
  final int playTime;
  @override
  final PlayHistoryType type = PlayHistoryType.playlist;
  /// 创建者昵称
  final String? nickname;
  /// 播放量
  final int? playCount;
  /// 歌曲数量
  final int? songCount;
  /// 简介
  final String? intro;

  PlaylistPlayHistory({
    required this.id,
    required this.name,
    required this.cover,
    required this.playTime,
    this.nickname,
    this.playCount,
    this.songCount,
    this.intro,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cover': cover,
    'playTime': playTime,
    'type': 'playlist',
    'nickname': nickname,
    'playCount': playCount,
    'songCount': songCount,
    'intro': intro,
  };

  factory PlaylistPlayHistory.fromJson(Map<String, dynamic> json) => PlaylistPlayHistory(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    cover: json['cover'] ?? '',
    playTime: json['playTime'] ?? 0,
    nickname: json['nickname'],
    playCount: json['playCount'],
    songCount: json['songCount'],
    intro: json['intro'],
  );

  /// 创建副本并修改指定字段
  PlaylistPlayHistory copyWith({
    String? id,
    String? name,
    String? cover,
    int? playTime,
    String? nickname,
    int? playCount,
    int? songCount,
    String? intro,
  }) => PlaylistPlayHistory(
    id: id ?? this.id,
    name: name ?? this.name,
    cover: cover ?? this.cover,
    playTime: playTime ?? this.playTime,
    nickname: nickname ?? this.nickname,
    playCount: playCount ?? this.playCount,
    songCount: songCount ?? this.songCount,
    intro: intro ?? this.intro,
  );
}

/// 专辑播放记录
class AlbumPlayHistory implements PlayHistoryItem {
  @override
  final String id;
  @override
  final String name;
  @override
  final String cover;
  @override
  final int playTime;
  @override
  final PlayHistoryType type = PlayHistoryType.album;
  /// 歌手名
  final String? singerName;
  /// 发行时间
  final String? publishTime;
  /// 歌曲数量
  final int? songCount;
  /// 简介
  final String? intro;

  AlbumPlayHistory({
    required this.id,
    required this.name,
    required this.cover,
    required this.playTime,
    this.singerName,
    this.publishTime,
    this.songCount,
    this.intro,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cover': cover,
    'playTime': playTime,
    'type': 'album',
    'singerName': singerName,
    'publishTime': publishTime,
    'songCount': songCount,
    'intro': intro,
  };

  factory AlbumPlayHistory.fromJson(Map<String, dynamic> json) => AlbumPlayHistory(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    cover: json['cover'] ?? '',
    playTime: json['playTime'] ?? 0,
    singerName: json['singerName'],
    publishTime: json['publishTime'],
    songCount: json['songCount'],
    intro: json['intro'],
  );
}

/// 播放记录服务 - 使用GetStorage本地缓存
class PlayHistoryService {
  static final PlayHistoryService _instance = PlayHistoryService._internal();
  factory PlayHistoryService() => _instance;
  PlayHistoryService._internal();

  final _storage = GetStorage();
  static const _songsKey = 'play_history_songs';
  static const _playlistsKey = 'play_history_playlists';
  static const _albumsKey = 'play_history_albums';

  /// 最大缓存数量
  static const int maxCacheCount = 200;

  // ========== 歌曲记录 ==========

  /// 添加歌曲播放记录
  Future<void> addSong(SongPlayHistory song) async {
    final list = _getSongs();
    // 移除重复项（如果存在则移到最前面）
    list.removeWhere((item) => item.id == song.id);
    list.insert(0, song);
    // 限制数量
    if (list.length > maxCacheCount) {
      list.removeRange(maxCacheCount, list.length);
    }
    await _saveSongs(list);
  }

  /// 获取所有歌曲记录
  List<SongPlayHistory> getSongs() => _getSongs();

  List<SongPlayHistory> _getSongs() {
    final raw = _storage.read<String>(_songsKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final List<dynamic> jsonList = jsonDecode(raw);
      return jsonList
          .map((e) => SongPlayHistory.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('读取歌曲播放记录失败: $e');
      return [];
    }
  }

  Future<void> _saveSongs(List<SongPlayHistory> list) async {
    final jsonList = list.map((e) => e.toJson()).toList();
    await _storage.write(_songsKey, jsonEncode(jsonList));
  }

  /// 删除歌曲记录
  Future<void> removeSongs(List<String> ids) async {
    final list = _getSongs();
    list.removeWhere((item) => ids.contains(item.id));
    await _saveSongs(list);
  }

  /// 清空歌曲记录
  Future<void> clearSongs() async {
    await _storage.remove(_songsKey);
  }

  // ========== 歌单记录 ==========

  /// 添加歌单播放记录
  Future<void> addPlaylist(PlaylistPlayHistory playlist) async {
    final list = _getPlaylists();
    list.removeWhere((item) => item.id == playlist.id);
    list.insert(0, playlist);
    if (list.length > maxCacheCount) {
      list.removeRange(maxCacheCount, list.length);
    }
    await _savePlaylists(list);
  }

  /// 获取所有歌单记录
  List<PlaylistPlayHistory> getPlaylists() => _getPlaylists();

  List<PlaylistPlayHistory> _getPlaylists() {
    final raw = _storage.read<String>(_playlistsKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final List<dynamic> jsonList = jsonDecode(raw);
      return jsonList
          .map((e) => PlaylistPlayHistory.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('读取歌单播放记录失败: $e');
      return [];
    }
  }

  Future<void> _savePlaylists(List<PlaylistPlayHistory> list) async {
    final jsonList = list.map((e) => e.toJson()).toList();
    await _storage.write(_playlistsKey, jsonEncode(jsonList));
  }

  /// 删除歌单记录
  Future<void> removePlaylists(List<String> ids) async {
    final list = _getPlaylists();
    list.removeWhere((item) => ids.contains(item.id));
    await _savePlaylists(list);
  }

  /// 清空歌单记录
  Future<void> clearPlaylists() async {
    await _storage.remove(_playlistsKey);
  }

  // ========== 专辑记录 ==========

  /// 添加专辑播放记录
  Future<void> addAlbum(AlbumPlayHistory album) async {
    final list = _getAlbums();
    list.removeWhere((item) => item.id == album.id);
    list.insert(0, album);
    if (list.length > maxCacheCount) {
      list.removeRange(maxCacheCount, list.length);
    }
    await _saveAlbums(list);
  }

  /// 获取所有专辑记录
  List<AlbumPlayHistory> getAlbums() => _getAlbums();

  List<AlbumPlayHistory> _getAlbums() {
    final raw = _storage.read<String>(_albumsKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final List<dynamic> jsonList = jsonDecode(raw);
      return jsonList
          .map((e) => AlbumPlayHistory.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('读取专辑播放记录失败: $e');
      return [];
    }
  }

  Future<void> _saveAlbums(List<AlbumPlayHistory> list) async {
    final jsonList = list.map((e) => e.toJson()).toList();
    await _storage.write(_albumsKey, jsonEncode(jsonList));
  }

  /// 删除专辑记录
  Future<void> removeAlbums(List<String> ids) async {
    final list = _getAlbums();
    list.removeWhere((item) => ids.contains(item.id));
    await _saveAlbums(list);
  }

  /// 清空专辑记录
  Future<void> clearAlbums() async {
    await _storage.remove(_albumsKey);
  }

  // ========== 通用方法 ==========

  /// 获取所有记录总数
  int get totalCount => getSongs().length + getPlaylists().length + getAlbums().length;

  /// 清空所有记录
  Future<void> clearAll() async {
    await Future.wait([
      clearSongs(),
      clearPlaylists(),
      clearAlbums(),
    ]);
  }
}

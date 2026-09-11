import 'package:ku_gou_music/api/request/request.dart';
import 'package:ku_gou_music/config/config.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/utils/utils.dart';

/// 发现页接口（对应 MoeKoeMusic Discover 页面所用接口）
///
/// - 歌单分类: POST /pubsongs/v1/get_tags_by_type
/// - 发现歌单: 复用 api/top/top.dart 的 getTopPlaylist（/v2/special_recommend）
/// - 榜单列表: GET /ocean/v6/rank/list
/// - 榜内歌曲: POST /openapi/kmr/v2/rank/audio
/// - 新碟上架: POST /musicadservice/v1/mobile_newalbum_sp
/// - 新歌速递: POST /musicadservice/container/v1/newsong_publish

String _s(dynamic v) => v?.toString() ?? '';

int _i(dynamic v) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  return int.tryParse(_s(v)) ?? 0;
}

Map<String, dynamic> _asMap(dynamic v) =>
    v is Map ? Map<String, dynamic>.from(v) : const {};

List<dynamic> _asList(dynamic v) => v is List ? v : [];

// ==================== 模型 ====================

/// 歌单分类标签（含子分类）
class DiscoverTag {
  final String tagName;
  final String tagId;
  final List<DiscoverTag> son;

  DiscoverTag({required this.tagName, required this.tagId, required this.son});

  factory DiscoverTag.fromJson(Map<String, dynamic> json) {
    return DiscoverTag(
      tagName: _s(json['tag_name']),
      tagId: _s(json['tag_id']),
      son: _asList(json['son'])
          .whereType<Map>()
          .map((e) => DiscoverTag.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}

/// 排行榜
class DiscoverRank {
  final int rankid;
  final String rankname;
  final String imgurl;
  final String intro;
  final String albumCoverColor;

  DiscoverRank({
    required this.rankid,
    required this.rankname,
    required this.imgurl,
    required this.intro,
    required this.albumCoverColor,
  });

  factory DiscoverRank.fromJson(Map<String, dynamic> json) {
    return DiscoverRank(
      rankid: _i(json['rankid']),
      rankname: _s(json['rankname']),
      imgurl: json['imgurl'] is String ? getImageUri(json['imgurl'], size: 640) : '',
      intro: _s(json['intro']),
      albumCoverColor: _s(json['album_cover_color']),
    );
  }
}

/// 榜内歌曲
class DiscoverRankSong {
  final String hash;
  final String songname;
  final String authorName;
  final String albumName;
  final int audioId;
  /// 时长（毫秒）
  final int duration;
  final String unionCover;
  /// 小尺寸封面（列表用，120）
  final String unionCoverSmall;
  final String videoHash;
  final String filename;

  DiscoverRankSong({
    required this.hash,
    required this.songname,
    required this.authorName,
    required this.albumName,
    required this.audioId,
    required this.duration,
    required this.unionCover,
    required this.unionCoverSmall,
    required this.videoHash,
    required this.filename,
  });

  factory DiscoverRankSong.fromJson(Map<String, dynamic> json) {
    final deprecated = _asMap(json['deprecated']);
    final videoInfo = _asMap(json['video_info']);
    final transParam = _asMap(json['trans_param']);
    final rawCover = _s(transParam['union_cover']);
    return DiscoverRankSong(
      hash: _s(deprecated['hash']),
      songname: _s(json['songname']),
      authorName: _s(json['author_name']),
      albumName: _s(json['album_name']),
      audioId: _i(json['audio_id']),
      duration: _i(deprecated['duration']),
      unionCover: rawCover.isEmpty ? '' : getImageUri(rawCover, size: 480),
      unionCoverSmall: rawCover.isEmpty ? '' : getImageUri(rawCover, size: 120),
      videoHash: _s(videoInfo['video_hash']),
      filename: _s(json['filename']),
    );
  }
}

/// 榜内歌曲分页结果
class DiscoverRankSongPage {
  final List<DiscoverRankSong> songs;
  final int total;

  DiscoverRankSongPage({required this.songs, required this.total});
}

/// 新碟（专辑）
class DiscoverAlbum {
  final int albumid;
  final String albumname;
  final String imgurl;
  final String singername;
  final String publishtime;
  final int songcount;

  DiscoverAlbum({
    required this.albumid,
    required this.albumname,
    required this.imgurl,
    required this.singername,
    required this.publishtime,
    required this.songcount,
  });

  factory DiscoverAlbum.fromJson(Map<String, dynamic> json) {
    return DiscoverAlbum(
      albumid: _i(json['albumid']),
      albumname: _s(json['albumname']),
      imgurl: json['imgurl'] is String ? getImageUri(json['imgurl'], size: 240) : '',
      singername: _s(json['singername']),
      publishtime: _s(json['publishtime']),
      songcount: _i(json['songcount']),
    );
  }
}

/// 新歌速递歌曲
class DiscoverNewSong {
  final String hash;
  final String songname;
  final String authorName;
  final String filename;
  /// 时长（毫秒）
  final int timelength;
  final int albumId;
  final String albumName;
  final String publishDate;
  final String cover;
  final String videoHash;

  DiscoverNewSong({
    required this.hash,
    required this.songname,
    required this.authorName,
    required this.filename,
    required this.timelength,
    required this.albumId,
    required this.albumName,
    required this.publishDate,
    required this.cover,
    required this.videoHash,
  });

  factory DiscoverNewSong.fromJson(Map<String, dynamic> json) {
    final transParam = _asMap(json['trans_param']);
    final authors = _asList(json['authors']).whereType<Map>().toList();
    String cover = _s(json['album_sizable_cover']);
    if (cover.isEmpty) cover = _s(transParam['union_cover']);
    if (cover.isEmpty && authors.isNotEmpty) {
      cover = _s(Map<String, dynamic>.from(authors.first)['sizable_avatar']);
    }
    String authorName = _s(json['author_name']);
    if (authorName.isEmpty) {
      authorName = authors
          .map((e) => _s(Map<String, dynamic>.from(e)['author_name']))
          .where((e) => e.isNotEmpty)
          .join(' / ');
    }
    return DiscoverNewSong(
      hash: _s(json['hash']),
      songname: _s(json['songname']),
      authorName: authorName,
      filename: _s(json['filename']),
      timelength: _i(json['timelength']),
      albumId: _i(json['album_id']),
      albumName: _s(json['album_name']),
      publishDate: _s(json['publish_date']),
      cover: cover.isEmpty ? '' : getImageUri(cover, size: 480),
      videoHash: _s(json['video_hash']),
    );
  }
}

/// 新歌分页结果
class DiscoverNewSongPage {
  final List<DiscoverNewSong> songs;
  final int total;

  DiscoverNewSongPage({required this.songs, required this.total});
}

// ==================== 接口 ====================

/// 歌单分类标签
Future<List<DiscoverTag>> getDiscoverPlaylistTags() async {
  final res = await createRequest(
    RequestOptions(
      url: '/pubsongs/v1/get_tags_by_type',
      method: 'POST',
      data: {
        'tag_type': 'collection',
        'tag_id': 0,
        'source': 3,
      },
      encryptType: 'android',
    ),
  );
  final body = res.body;
  if (body is Map && body['status'] == 1 && body['data'] is List) {
    return (body['data'] as List)
        .whereType<Map>()
        .map((e) => DiscoverTag.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
  return [];
}

/// 排行榜列表
Future<List<DiscoverRank>> getDiscoverRankList() async {
  final res = await createRequest(
    RequestOptions(
      url: '/ocean/v6/rank/list',
      method: 'GET',
      params: {
        'plat': 2,
        'withsong': 1,
        'parentid': 0,
      },
      encryptType: 'android',
    ),
  );
  final body = res.body;
  final data = body is Map ? _asMap(body['data']) : const <String, dynamic>{};
  if (body is Map && body['status'] == 1 && data['info'] is List) {
    return (data['info'] as List)
        .whereType<Map>()
        .map((e) => DiscoverRank.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
  return [];
}

/// 榜内歌曲（分页）
Future<DiscoverRankSongPage> getDiscoverRankAudio(
  int rankId, {
  int page = 1,
  int pagesize = 30,
}) async {
  final res = await createRequest(
    RequestOptions(
      url: '/openapi/kmr/v2/rank/audio',
      method: 'POST',
      data: {
        'show_portrait_mv': 1,
        'show_type_total': 1,
        'filter_original_remarks': 1,
        'area_code': 1,
        'pagesize': pagesize,
        'rank_cid': 0,
        'type': 1,
        'page': page,
        'rank_id': rankId.toString(),
      },
      headers: {'kg-tid': '369'},
      encryptType: 'android',
    ),
  );
  final body = res.body;
  final data = body is Map ? _asMap(body['data']) : const <String, dynamic>{};
  final songs = _asList(data['songlist'])
      .whereType<Map>()
      .map((e) => DiscoverRankSong.fromJson(Map<String, dynamic>.from(e)))
      .toList();
  return DiscoverRankSongPage(songs: songs, total: _i(data['total']));
}

/// 新碟上架
///
/// 返回按地区分组的专辑：chn / eur / jpn / kor
Future<Map<String, List<DiscoverAlbum>>> getDiscoverNewAlbums({
  int page = 1,
  int pagesize = 30,
}) async {
  final res = await createRequest(
    RequestOptions(
      url: '/musicadservice/v1/mobile_newalbum_sp',
      method: 'POST',
      data: {
        'apiver': apiver,
        'token': userInstance.token,
        'page': page,
        'pagesize': pagesize,
        'withpriv': 1,
      },
      encryptType: 'android',
    ),
  );
  final body = res.body;
  final data = body is Map ? _asMap(body['data']) : const <String, dynamic>{};
  final result = <String, List<DiscoverAlbum>>{};
  for (final key in ['chn', 'eur', 'jpn', 'kor']) {
    result[key] = _asList(data[key])
        .whereType<Map>()
        .map((e) => DiscoverAlbum.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
  return result;
}

/// 新歌速递（分页）
Future<DiscoverNewSongPage> getDiscoverNewSongs({
  int page = 1,
  int pagesize = 20,
}) async {
  final res = await createRequest(
    RequestOptions(
      url: '/musicadservice/container/v1/newsong_publish',
      method: 'POST',
      data: {
        'rank_id': 21608,
        'userid': userInstance.userid,
        'page': page,
        'pagesize': pagesize,
        'tags': <dynamic>[],
      },
      encryptType: 'android',
    ),
  );
  final body = res.body;
  final songs = body is Map && body['data'] is List
      ? (body['data'] as List)
          .whereType<Map>()
          .map((e) => DiscoverNewSong.fromJson(Map<String, dynamic>.from(e)))
          .toList()
      : <DiscoverNewSong>[];
  final total = body is Map ? _i(body['total']) : 0;
  return DiscoverNewSongPage(songs: songs, total: total);
}

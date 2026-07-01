import 'package:ku_gou_music/api/request/request.dart';
import 'package:ku_gou_music/store/user.dart';

/// 歌单歌曲资源信息
class PlaylistResource {
  final String name;
  final String hash;
  final int albumId;
  final int mixSongId;

  PlaylistResource({
    required this.name,
    required this.hash,
    required this.albumId,
    required this.mixSongId,
  });

  Map<String, dynamic> toJson() => {
        'number': 1,
        'name': name,
        'hash': hash,
        'size': 0,
        'sort': 0,
        'timelen': 0,
        'bitrate': 0,
        'album_id': albumId,
        'mixsongid': mixSongId,
      };
}

/// 从歌单删除歌曲
///
/// [fileIds] 要删除的歌曲 fileid 列表
/// [listId] 歌单ID
/// [userId] 用户ID（可选，默认从用户实例获取）
/// [token] 用户token（可选，默认从用户实例获取）
Future<ResponseOptions<Map<String, dynamic>>> removeFromPlaylist({
  required List<int> fileIds,
  required int listId,
  int? userId,
  String? token,
}) async {
  final userid = userId ?? userInstance.userid;
  final userToken = token ?? userInstance.token;

  final resource = fileIds.map((id) => {'fileid': id}).toList();

  final dataMap = {
    'listid': listId,
    'userid': userid,
    'data': resource,
    'type': 0,
    'token': userToken,
    'list_ver': 0,
  };

  return createRequest(RequestOptions(
    url: '/v4/delete_songs',
    method: 'POST',
    data: dataMap,
    encryptType: 'android',
    headers: {'x-router': 'cloudlist.service.kugou.com'},
  ));
}

///
/// [id] 歌单ID（global_collection_id）
/// [page] 页码，默认第1页
/// [pageSize] 每页数量，默认30
Future<ResponseOptions<Map<String, dynamic>>> getPlaylistSongs({
  required String id,
  int page = 1,
  int pageSize = 30,
}) async {
  final paramsMap = {
    'area_code': 1,
    'begin_idx': (page - 1) * pageSize,
    'plat': 1,
    'type': 1,
    'mode': 1,
    'personal_switch': 1,
    'extend_fields': 'abtags,hot_cmt,popularization',
    'pagesize': pageSize,
    'global_collection_id': id,
  };

  return createRequest(RequestOptions(
    url: '/pubsongs/v2/get_other_list_file_nofilt',
    method: 'GET',
    encryptType: 'android',
    params: paramsMap,
  ));
}

///
/// [songsData] 歌曲数据，格式为 "name|hash|albumId|mixSongId" 的字符串列表
/// 例如：[" songName|hash123|12345|67890"]
/// [listId] 歌单ID
/// [userId] 用户ID（可选，默认从用户实例获取）
/// [token] 用户token（可选，默认从用户实例获取）
Future<ResponseOptions<Map<String, dynamic>>> addToPlaylist({
  required List<String> songsData,
  required int listId,
  int? userId,
  String? token,
}) async {
  final userid = userId ?? userInstance.userid;
  final userToken = token ?? userInstance.token;
  final clientTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  final resource = songsData.map((s) {
    final data = s.split('|');
    return PlaylistResource(
      name: data.isNotEmpty ? data[0] : '',
      hash: data.length > 1 ? data[1] : '',
      albumId: data.length > 2 ? int.tryParse(data[2]) ?? 0 : 0,
      mixSongId: data.length > 3 ? int.tryParse(data[3]) ?? 0 : 0,
    ).toJson();
  }).toList();

  final dataMap = {
    'userid': userid,
    'token': userToken,
    'listid': listId,
    'list_ver': 0,
    'type': 0,
    'slow_upload': 1,
    'scene': 'false;null',
    'data': resource,
  };

  return createRequest(RequestOptions(
    url: '/cloudlist.service/v6/add_song',
    method: 'POST',
    data: dataMap,
    params: {
      'last_time': clientTime,
      'last_area': 'gztx',
      'userid': userid,
      'token': userToken,
    },
    encryptType: 'android',
  ));
}

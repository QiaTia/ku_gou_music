import 'package:ku_gou_music/models/tag.dart';

import '../request/request.dart';

/// 获取歌单所有歌曲
Future<dynamic> getPlaylist(String id, [int page = 1, int pagesize = 30]) async {
  final paramsMap = {
    'area_code': 1,
    'begin_idx': (page - 1) * pagesize,
    'plat': 1,
    'type': 1,
    // module: 'NONE',
    'mode': 1,
    'personal_switch': 1,
    'extend_fields': 'abtags,hot_cmt,popularization',
    // page: params?.page || 1,
    'pagesize': pagesize,
    'global_collection_id': id,
  };
  return createRequest(RequestOptions(
      url: '/pubsongs/v2/get_other_list_file_nofilt',
      method: 'GET',
      encryptType: 'android',
      params: paramsMap,
    )
  );
}

/// 获取歌单所有歌曲
Future<ResponseOptions<Map<String, dynamic>>> getPlaylistTrackAll(String id, [int page = 1, int pagesize = 30]) async {
  var paramsMap = {
    'area_code': 1,
    'begin_idx': (page - 1) * pagesize,
    'plat': 1,
    'type': 1,
    // module: 'NONE',
    'mode': 1,
    'personal_switch': 1,
    'extend_fields': 'abtags,hot_cmt,popularization',
    // page: params?.page || 1,
    'pagesize': pagesize,
    'global_collection_id': id,
  };
  return createRequest(RequestOptions(
    url: '/pubsongs/v2/get_other_list_file_nofilt',
    method: 'GET',
    encryptType: 'android',
    params: paramsMap,
    cookie: {},
  ));
}

///  获取歌单分类
Future<List<Tag>> getPlaylistTag() async {
  final res = await createRequest(RequestOptions(
    url: '/pubsongs/v1/get_tags_by_type',
    method: 'POST',
    encryptType: 'android',
    data: {
      'tag_type': 'collection',
      'tag_id': 0,
      'source': 3,
    }
  ));
  if (res.body['status'] == 1 && res.body['data'] is List) {
    return res.body['data'].map<Tag>((item) => Tag.fromJson(item)).toList();
  }
  else {
    throw Exception('获取歌单分类失败');
  }
}

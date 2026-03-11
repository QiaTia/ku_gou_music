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

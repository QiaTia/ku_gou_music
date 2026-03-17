import 'package:ku_gou_music/api/request/request.dart';
import 'package:ku_gou_music/store/user.dart';

/// 获取用户歌单

Future<ResponseOptions<Map<String, dynamic>>> getUserPlaylist({ int? page, int? pagesize }) async { 
  final userid = userInstance.userid;
  final token = userInstance.token;
  final dataMap = {
    'userid': userid,
    'token': token,
    'total_ver': 979,
    'type': 2,
    'page': page ?? 1,
    'pagesize': pagesize ?? 30,
  };
  return createRequest(RequestOptions(
    url: '/v7/get_all_list',
      encryptType: 'android',
      method: 'post',
      data: dataMap,
      params: { 'plat': 1, 'userid': userid, 'token': token },
      // cookie: params?.cookie,
      headers: { 'x-router': 'cloudlist.service.kugou.com' },
    ));
}

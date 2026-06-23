import 'package:ku_gou_music/api/request/request.dart';
import 'package:ku_gou_music/config/util.dart';
import 'package:ku_gou_music/models/user/user_info.dart';
import 'package:ku_gou_music/models/user/vip_info.dart';
import 'package:ku_gou_music/store/user.dart';

/// 获取用户歌单

Future<ResponseOptions<Map<String, dynamic>>> getUserPlaylist({
  int? page,
  int? pagesize,
}) async {
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
  return createRequest(
    RequestOptions(
      url: '/v7/get_all_list',
      encryptType: 'android',
      method: 'post',
      data: dataMap,
      params: {'plat': 1, 'userid': userid, 'token': token},
      // cookie: params?.cookie,
      headers: {'x-router': 'cloudlist.service.kugou.com'},
    ),
  );
}

/// 获取用户详情
Future<UserInfo> getUserDetail() async {
  final userid = userInstance.userid;
  final token = userInstance.token;
  final clienttime =  (DateTime.now().millisecondsSinceEpoch ~/ 1000);

  final pk = cryptoRSAEncrypt({ "token": token, "clienttime": clienttime });

  final dataMap = {
    "visit_time": clienttime, 
    "usertype": 1, 
    "p": pk, 
    "userid": userid
  };
  
  final res = await createRequest(
    RequestOptions(
      url: '/v3/get_my_info',
      method: 'POST',
      data: dataMap,
      params: { "plat": 1},
      encryptType: 'android',
      headers: {'x-router': 'usercenter.kugou.com'},
    ),
  );
  if (res.body['status'] == 1 && res.body['data'] is Object) {
    return UserInfo.fromJson(res.body['data']);
  } else {
    throw Exception('获取用户信息失败');
  }
}

/// 获取用户VIP信息
Future<VipInfo> getUserVipInfo() async {
  final res = await createRequest(
    RequestOptions(
      baseURL: 'https://kugouvip.kugou.com',
      url: '/v1/get_union_vip',
      method: 'GET',
      params: { "busi_type": 'concept' },
      encryptType: 'android',
    ),
  );
   if (res.body['status'] == 1 && res.body['data'] is Object) {
    return VipInfo.fromJson(res.body['data']);
  } else {
    throw Exception('获取用户信息失败');
  }
}

import 'package:ku_gou_music/api/request/request.dart';
import 'dart:convert';

import 'package:dio/dio.dart' show ResponseType;
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

/// 获取用户听歌历史（listenservice）
/// 对应 MoeKoe 的 /user/listen
Future<ResponseOptions<Map<String, dynamic>>> getUserListenHistory({int type = 1}) async {
  final userid = userInstance.userid;
  final token = userInstance.token;
  final clienttime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final pk = cryptoRSAEncrypt({ "clienttime": clienttime, "token": token });
  final dataMap = {
    't_userid': userid,
    'userid': userid,
    'list_type': type,
    'area_code': 1,
    'cover': 2,
    'p': pk,
  };
  return createRequest(
    RequestOptions(
      baseURL: 'https://listenservice.kugou.com',
      url: '/v2/get_list',
      method: 'POST',
      data: dataMap,
      params: { 'clienttime': clienttime, 'plat': 0 },
      encryptType: 'android',
    ),
  );
}

/// 获取用户关注列表（歌手/好友）
/// 对应 MoeKoe 的 /user/follow
Future<ResponseOptions<Map<String, dynamic>>> getUserFollowList() async {
  final userid = userInstance.userid;
  final token = userInstance.token;
  final clienttime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final pk = cryptoRSAEncrypt({ "clienttime": clienttime, "token": token });
  final dataMap = {
    'merge': 2,
    'need_iden_type': 1,
    'ext_params': 'k_pic,jumptype,singerid,score',
    'userid': userid,
    'type': 0,
    'id_type': 0,
    'p': pk,
  };
  return createRequest(
    RequestOptions(
      url: '/v4/follow_list',
      method: 'POST',
      data: dataMap,
      params: { 'plat': 1 },
      encryptType: 'android',
      headers: {'x-router': 'relationuser.kugou.com'},
    ),
  );
}

/// 创建歌单
/// 对应 MoeKoe 的 /playlist/add
Future<ResponseOptions<Map<String, dynamic>>> createUserPlaylist(String name) async {
  final userid = userInstance.userid;
  final token = userInstance.token;
  final dataMap = {
    'userid': userid,
    'token': token,
    'total_ver': 0,
    'name': name,
    'type': 0,
    'source': 1,
    'is_pri': 0,
    'list_create_userid': userid,
    'list_create_listid': '',
    'list_create_gid': '',
    'from_shupinmv': 0,
  };
  return createRequest(
    RequestOptions(
      url: '/cloudlist.service/v5/add_list',
      method: 'POST',
      data: dataMap,
      encryptType: 'android',
    ),
  );
}

/// 签到领取 VIP（广告播放上报）
/// 对应 MoeKoe 的 /youth/vip
Future<ResponseOptions<Map<String, dynamic>>> signInForVip() async {
  final time = DateTime.now().millisecondsSinceEpoch;
  return createRequest(
    RequestOptions(
      url: '/youth/v1/ad/play_report',
      method: 'POST',
      data: {
        'ad_id': 12307537187,
        'play_end': time,
        'play_start': time - 30000,
      },
      encryptType: 'android',
    ),
  );
}

/// 领取一天畅听 VIP
/// 对应 MoeKoe 的 /youth/day/vip
Future<ResponseOptions<Map<String, dynamic>>> receiveDayVip(String receiveDay) async {
  return createRequest(
    RequestOptions(
      url: '/youth/v1/recharge/receive_vip_listen_song',
      method: 'POST',
      params: {'source_id': 90139, 'receive_day': receiveDay},
      encryptType: 'android',
    ),
  );
}

/// 升级概念版 VIP
/// 对应 MoeKoe 的 /youth/day/vip/upgrade
Future<ResponseOptions<Map<String, dynamic>>> upgradeVipReward() async {
  return createRequest(
    RequestOptions(
      url: '/youth/v1/listen_song/upgrade_vip_reward',
      method: 'POST',
      params: {'kugouid': userInstance.userid, 'ad_type': 1},
      encryptType: 'android',
    ),
  );
}

/// 收藏歌单（对应 MoeKoe 的 /playlist/add，type: 1）
///
/// 返回 data.info.listid 为该收藏记录在"我收藏的歌单"里的 listid，
/// 取消收藏时需要用它调 [deletePlaylist]
Future<ResponseOptions<Map<String, dynamic>>> collectPlaylist({
  required String name,
  required String listCreateGid,
}) async {
  final dataMap = {
    'userid': userInstance.userid,
    'token': userInstance.token,
    'total_ver': 0,
    'name': name,
    'type': 1, // 0 创建歌单 / 1 收藏歌单
    'source': 1,
    'is_pri': 0,
    'list_create_userid': userInstance.userid,
    'list_create_listid': '',
    'list_create_gid': listCreateGid,
    'from_shupinmv': 0,
  };
  return createRequest(
    RequestOptions(
      url: '/cloudlist.service/v5/add_list',
      method: 'POST',
      data: dataMap,
      encryptType: 'android',
    ),
  );
}

/// 取消收藏歌单（对应 MoeKoe 的 /playlist/del，AES + RSA + 响应解密）
Future<Map<String, dynamic>> deletePlaylist({required int listid}) async {
  final clienttime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final aesEncrypt = playlistAesEncrypt({
    'listid': listid,
    'total_ver': 0,
    'type': 1,
  });
  final p = rsaEncrypt2({
    'aes': aesEncrypt['key'],
    'uid': userInstance.userid,
    'token': userInstance.token,
  }).toUpperCase();

  final response = await createRequest<Object>(
    RequestOptions(
      url: '/v2/delete_list',
      method: 'POST',
      data: aesEncrypt['str'],
      params: {
        'clienttime': clienttime,
        'key': signParamsKey(clienttime.toString()),
        'last_area': 'gztx',
        'last_time': clienttime,
        'p': p,
      },
      encryptType: 'android',
      headers: {'x-router': 'cloudlist.service.kugou.com'},
      responseType: ResponseType.bytes,
    ),
  );

  final body = playlistAesDecrypt({
    'str': base64Encode(response.body as List<int>),
    'key': aesEncrypt['key']!,
  });
  return body is Map<String, dynamic> ? body : <String, dynamic>{};
}

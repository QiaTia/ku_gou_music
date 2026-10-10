import 'package:ku_gou_music/api/request/request.dart';

/// 获取 MV 播放地址（对应 MoeKoe 的 /video/url）
///
/// 响应 data 为以 mvhash 为键的 Map，取 data[mvhash].backupdownurl（数组取首个）
/// 或 downurl 作为 mp4 直链
Future<ResponseOptions<Map<String, dynamic>>> getMvUrl({required String hash}) {
  return createRequest(
    RequestOptions(
      url: '/v2/interface/index',
      method: 'GET',
      params: {
        'backupdomain': 1,
        'cmd': 123,
        'ext': 'mp4',
        'ismp3': 0,
        'hash': hash,
        'pid': 1,
        'type': 1,
      },
      encryptType: 'android',
      // trackermv 的 /v2/interface/index 校验 params.key（缺省返回 errcode
      // 40003 "Empty key"），由请求层注入 signKey = md5(hash+secret+appid+mid+userid)
      encryptKey: true,
      headers: {'x-router': 'trackermv.kugou.com'},
    ),
  );
}

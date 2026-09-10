import 'package:ku_gou_music/config/util.dart';

import '../request/request.dart';

/// 检查二维码扫描状态
Future<ResponseOptions<Map<String, dynamic>>> checkQrStatus(String qrcode) async {
  // 必须与 request.dart 默认参数的 appid 保持一致（lite 模式用 liteAppid），
  // 否则返回的 token 与后续接口的 appid 不匹配，会被服务端判定登录失效
  final useAppid = isLite ? liteAppid : appid;
  print('[QR] checkQrStatus: qrcode=$qrcode appid=$useAppid');
  Map<String, dynamic> params = { 'plat': 4, 'appid': useAppid, 'srcappid': srcappid, 'qrcode': qrcode };
  final response = await createRequest<Map<String, dynamic>>(RequestOptions(
    params: params,
    baseURL: 'https://login-user.kugou.com',
    url: '/v2/get_userinfo_qrcode',
    encryptType: 'web',
  ));
  print('[QR] checkQrStatus 响应: status=${response.body?['status']} data=${response.body?['data']}');
  if (response.body!['data']?['status'] == 4) {
    final cookies = response.cookie;
    cookies.add('token=${response.body!['data']?['token']}');
    cookies.add('userid=${response.body?['data']?['userid']}');
    response.cookie = cookies;
  }
  return response;
}

Future<Map<String, String?>> createQrByLogin([String? type]) async {
  // 二维码内容中的 appid 需与状态检查接口一致（lite 模式用 liteAppid）
  final useAppid = isLite ? liteAppid : appid;
  print('[QR] createQrByLogin: type=$type qrcode_txt appid=$useAppid');
  Map<String, dynamic> params = {
    'appid': type == 'web' ? 1014 : 1001,
    'type': 1,
    'plat': 4,
    'qrcode_txt': 'https://h5.kugou.com/apps/loginQRCode/html/index.html?appid=$useAppid&',
    'srcappid': srcappid,
  };
  final response = await createRequest<Map<String, dynamic>>(RequestOptions(
    baseURL: 'https://login-user.kugou.com',
    url: '/v2/qrcode',
    method: 'GET',
    params: params,
    encryptType: 'web',
  ));
  String? qrCode = response.body!['data']?['qrcode'];
  String? qrImg = response.body!['data']?['qrcode_img'];

  if (qrCode != null) {
    // 创建二维码
    String url = 'https://h5.kugou.com/apps/loginQRCode/html/index.html?qrcode=${qrCode}';
    return { 'url': url, 'qrImg': qrImg, 'qrCode': qrCode };
  }
  return Future.error('创建二维码失败');
}

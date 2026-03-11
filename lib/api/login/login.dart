import '../../config/util.dart';
import '../request/request.dart';

/// 登录函数
Future<ResponseOptions<dynamic>> loginByPassword({ required String password, required String username }) async {
  final dateNow = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  
  // 加密密码
  final encryptResult = cryptoAesEncrypt({
    'pwd': password,
    'code': '',
    'clienttime_ms': dateNow.toString(),
  });
  
  // 构建请求数据
  final dataMap = <String, dynamic>{
    'plat': 1,
    'support_multi': 1,
    'clienttime_ms': dateNow,
    't1': '562a6f12a6e803453647d16a08f5f0c2ff7eee692cba2ab74cc4c8ab47fc467561a7c6b586ce7dc46a63613b246737c03a1dc8f8d162d8ce1d2c71893d19f1d4b797685a4c6d3d81341cbde65e488c4829a9b4d42ef2df470eb102979fa5adcdd9b4eecfea8b909ff7599abeb49867640f10c3c70fc444effca9d15db44a9a6c907731e2bb0f22cd9b3536380169995693e5f0e2424e3378097d3813186e3fe96bbe7023808a0981b4e2b6135a76faac',
    't2': '31c4daf4cf480169ccea1cb7d4a209295865a9d2b788510301694db229b87807469ea0d41b4d4b9173c2151da7294aeebfc9738df154bbdf11a4e117bb5dff6a3af8ce5ce333e681c1f29a44038f27567d58992eb81283e080778ac77db1400fdf49b7cf7e26be2e5af4da7830cc3be4',
    't3': 'MCwwLDAsMCwwLDAsMCwwLDA=',
    'username': username,
    'params': encryptResult['str'],
    'pk': cryptoRSAEncrypt({
      'clienttime_ms': dateNow,
      'key': encryptResult['key'],
    }).toUpperCase(),
  };
  
  try {
    // 发送请求
    final response = await createRequest(RequestOptions(
      params: {},
      url: '/v9/login_by_pwd',
      method: 'POST',
      data: dataMap,
      encryptType: 'android',
      // cookie: params['cookie'] ?? <String, dynamic>{},
      cookie: <String, dynamic>{},
      headers: {'x-router': 'login.user.kugou.com'},
    ));
    
    final body = response.body as Map<String, dynamic>? ?? {};
    
    if (body['status'] == 1) {
      final secuParams = body['data']?['secu_params'] as String?;
      if (secuParams != null && secuParams.isNotEmpty) {
        final getToken = cryptoAesDecrypt(secuParams, (encryptResult['key'] ?? ''));
        
        if (getToken is Map<String, dynamic>) {
          // 合并数据
          body['data'] = {
            ...body['data'] ?? {},
            ...getToken,
          };
          
          // 添加到cookie
          final cookies = response.cookie;
          for (final entry in getToken.entries) {
            cookies.add('${entry.key}=${entry.value}');
          }
          response.cookie = cookies;
        } else if (getToken is String) {
          body['data']?['token'] = getToken;
          final cookies = response.cookie;
          cookies.add('token=$getToken');
          response.cookie = cookies;
        }
        
        // 添加其他cookie
        final cookies = response.cookie;
        final userid = body['data']?['userid'] ?? 0;
        final vipType = body['data']?['vip_type'] ?? 0;
        final vipToken = body['data']?['vip_token'] ?? '';
        
        cookies.add('userid=$userid');
        cookies.add('vip_type=$vipType');
        cookies.add('vip_token=$vipToken');
        response.cookie = cookies;
      }
      
      response.body = body;
    }
    
    return response;
  } catch (e) {
    rethrow;
  }
}

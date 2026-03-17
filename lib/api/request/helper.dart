import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../../config/config.dart';

/// MD5 加密方法
String cryptoMd5(String input) {
  var bytes = utf8.encode(input);
  var digest = md5.convert(bytes);
  return digest.toString();
}


/// web版本 signature 加密
String signatureWebParams(Map<String, dynamic> params) {
  const String str = 'NVPh5oo715z5DIWAeQlhMDsWXXQV4hwt';
  List<String> list = params.keys
    .map((key) => '$key=${params[key]}')
    .toList()..sort();
  return cryptoMd5('$str${list.join('')}$str');
}
/// Android版本 signature 加密
String signatureAndroidParams (Map<String, dynamic> params, [String? data]) {
  const str = isLite ? 'LnT6xpN3khm36zse0QzvmgTZ3waWdRSA' : 'OIlwieks28dk2k092lksi2UIkp';
  final keys = params.keys.toList()..sort();
  final String paramsString = keys.map((key) {
    final value = params[key];
    final valueString = value is Map ? jsonEncode(value) : value;
    return '$key=$valueString';
  }).join('');
  return cryptoMd5('$str$paramsString${data ?? ''}$str');
}

/// Register版本 signature 加密
/// @param {HelperParams} params
/// @returns {string} 加密后的signature
String signatureRegisterParams (Map<String, dynamic> params) {
  final values = params.values.toList()..sort();
  return cryptoMd5('1014${values.join('')}1014');
}

/// sign 加密
/// @param {HelperParams} params
/// @param {string?} data
/// @returns {string} 加密后的sign
String signParams (Map<String, dynamic> params, [String? data]){
  const str = 'R6snCXJgbCaj9WFRJKefTMIFp0ey6Gza';
  final keys = params.keys.toList()..sort();
  final paramsString = keys.map((key) => '$key${params[key]}').join('');
  return cryptoMd5('$paramsString${data ?? ''}$str');
}

/// signKey 加密
/// @param {string} hash
/// @param {string} mid
/// @param {(string | number)?} userid
/// @param {(string | number)?} appid
/// @returns {string} 加密后的sign
String signKey (String hash, String mid, [dynamic userid, dynamic appid]) {
  final str = isLite ? '185672dd44712f60bb1736df5a377e82' : '57ae12eb6890223e355ccfcb74edf70d';
  return cryptoMd5('$hash$str$appid$mid${userid ?? 0}');
}

/// signKey 加密云盘key
/// @param {string} hash
/// @param {string} pid
/// @returns {string} 加密后的sign
String signCloudKey (String hash, String pid) {
  const str = 'ebd1ac3134c880bda6a2194537843caa0162e2e7';
  return cryptoMd5('musicclound$hash$pid$str');
}

/// signParams 加密
/// @param {string | number} data
/// @param {(string | number)?} appid
/// @param {(string | number)?} clientver
/// @returns {string} 加密后的signParams
String signParamsKey (String data, [String? aid, String? cli]) {
  final str = isLite ? 'LnT6xpN3khm36zse0QzvmgTZ3waWdRSA' : 'OIlwieks28dk2k092lksi2UIkp';

  return cryptoMd5('${aid ?? (isLite ? liteAppid : appid)}$str${cli ?? (isLite ? liteClientver : clientver)}$data');
}

/// 格式化cookie
/// 
/// [cookie] 输入cookie
String parseCookieString(String cookie) {
  // 移除 Domain、domain、path、expires 相关属性
  String result = cookie.replaceAll(RegExp(r'\s*(Domain|domain|path|expires)=[^(;|$)]+;*'), '');
  // 移除 ;HttpOnly
  result = result.replaceAll(';HttpOnly', '');
  return result;
}

import 'dart:math';
export 'config.dart';
export '../api/request/helper.dart';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:crypto/crypto.dart';
import 'package:archive/archive.dart';
import 'package:ku_gou_music/config/encrypt_ext.dart';
import 'dart:convert';
import 'package:basic_utils/basic_utils.dart' as StringUtils;
import 'package:pointycastle/export.dart';

const publicRasKey = '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIAG7QOELSYoIJvTFJhMpe1s/gbjDJX51HBNnEl5HXqTW6lQ7LC8jr9fWZTwusknp+sVGzwd40MwP6U5yDE27M/X1+UR4tvOGOqp94TJtQ1EPnWGWXngpeIW5GxoQGao1rmYWAu6oi1z9XkChrsUdC6DJE5E221wf/4WLFxwAtRQIDAQAB\n-----END PUBLIC KEY-----';
const publicLiteRasKey = '-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDECi0Np2UR87scwrvTr72L6oO01rBbbBPriSDFPxr3Z5syug0O24QyQO8bg27+0+4kBzTBTBOZ/WWU0WryL1JSXRTXLgFVxtzIY41Pe7lPOgsfTCn5kZcvKhYKJesKnnJDNr5/abvTGf+rHG3YRwsCHcQ08/q6ifSioBszvb3QiwIDAQAB\n-----END PUBLIC KEY-----';


/// 随机字符串
String randomString([int len = 16]) {
  const keyString = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final keyStringArr = keyString.split('');
  final _key = <String>[];
  
  for (int i = 0; i < len; i += 1) {
    final ceil = ((keyStringArr.length - 1) * Random().nextDouble()).ceil();
    final _tmp = keyStringArr[ceil];
    _key.add(_tmp);
  }
  
  return _key.join('');
}

/// MD5 加密
/// 
/// [data] 支持 String、Map、List 或其他可转换为字符串的类型
/// 
/// 返回 MD5 哈希值的十六进制字符串
String cryptoMd5(dynamic data) {
  final buffer = data is Map || data is List ? jsonEncode(data) : data.toString();
  return md5.convert(utf8.encode(buffer)).toString();
}
/// Sha1 加密
/// 
/// [data] 支持 String、Map、List 或其他可转换为字符串的类型
/// 
/// 返回 Sha1 哈希值的十六进制字符串
String cryptoSha1(dynamic data) {
  final buffer = data is Map || data is List ? jsonEncode(data) : data.toString();
  return sha1.convert(utf8.encode(buffer)).toString();
}

/// 随机数字
String randomNumber([int len = 16]) {
  const keyString = '1234567890';
  final keyStringArr = keyString.split('');
  final result = StringBuffer();
  final random = Random();
  
  for (int i = 0; i < len; i++) {
    final index = (keyStringArr.length - 1) * random.nextDouble();
    final ceilIndex = index.ceil();
    result.write(keyStringArr[ceilIndex]);
  }
  
  return result.toString();
}

/// 格式化cookie
String parseCookieString(String cookie) {
  var t = cookie.replaceAll(
    RegExp(r'\s*(Domain|domain|path|expires)=[^(;|$)]+;*'),
    '',
  );
  return t.replaceAll(';HttpOnly', '');
}

/// cookie 转 json
Map<String, String> cookieToJson(String? cookie) {
  if (cookie == null || cookie.isEmpty) {
    return {};
  }
  
  final cookieArr = cookie.split(';');
  final result = <String, String>{};
  
  for (final item in cookieArr) {
    final arr = item.split('=');
    if (arr.length >= 2) {
      final key = arr[0].trim();
      final value = arr[1].trim();
      if (key.isNotEmpty) {
        result[key] = value;
      }
    }
  }
  
  return result;
}

/// krc解码
/// @param {string | Uint8Array | Buffer} val
String decodeLyrics(dynamic val) {
  Uint8List? bytes;
  
  if (val is Uint8List) {
    bytes = val;
  } else if (val is List<int>) {
    bytes = Uint8List.fromList(val);
  } else if (val is String) {
    bytes = base64Decode(val);
  }
  
  if (bytes == null || bytes.length <= 4) {
    return '';
  }
  
  const enKey = [64, 71, 97, 119, 94, 50, 116, 71, 81, 54, 49, 45, 206, 210, 110, 105];
  final krcBytes = bytes.sublist(4);
  final len = krcBytes.length;
  
  for (int index = 0; index < len; index++) {
    krcBytes[index] = krcBytes[index] ^ enKey[index % enKey.length];
  }
  
  try {
    final inflateData = Inflate(krcBytes).getBytes();
    return utf8.decode(inflateData);
  } catch (e) {
    return '';
  }
}

/// 计算mid
String calculateMid(String str) {
  var bigInteger = BigInt.zero;
  final bigInteger2 = BigInt.from(16);
  final digest = md5.convert(utf8.encode(str));
  final hexString = digest.toString();
  final length = hexString.length;
  
  for (int i = 0; i < length; i++) {
    final charValue = BigInt.from(int.parse(hexString[i], radix: 16));
    final powerValue = bigInteger2.pow(length - 1 - i);
    bigInteger += charValue * powerValue;
  }
  
  return bigInteger.toString();
}

/// 生成GUID
String getGuid() {
  String e() {
    final random = Random();
    final num = (65536 * (1 + random.nextDouble())).toInt();
    return num.toRadixString(16).substring(1).padLeft(4, '0');
  }
  
  return '${e()}${e()}-${e()}-${e()}-${e()}-${e()}${e()}${e()}';
}


/// AES 加密
/// 
/// [data] 需要加密的数据
/// [opt] 可选的密钥和初始向量配置
/// 
/// 返回：当提供完整的 opt.key 和 opt.iv 时返回加密后的十六进制字符串，
/// 否则返回包含加密字符串和生成密钥的 Map
T cryptoAesEncrypt<T>(T data, {String? key, String? iv}) {
  // 处理输入数据
  String dataStr = data is Map || data is List
      ? jsonEncode(data)
      : data.toString();
  
  String? tempKey;
  String finalKey;
  String finalIv;
  
  // 生成或使用提供的密钥和IV
  if (key != null && iv != null) {
    finalKey = key;
    finalIv = iv;
  } else {
    tempKey = key ?? randomNumber(16).toLowerCase();
    finalKey = cryptoMd5(tempKey).substring(0, 32);
    finalIv = finalKey.substring(finalKey.length - 16);
  }
  
  // 执行AES加密
  final encKey = enc.Key.fromUtf8(finalKey);
  final encIv = enc.IV.fromUtf8(finalIv);
  final encrypter = enc.Encrypter(enc.AES(encKey, mode: enc.AESMode.cbc));
  final encrypted = encrypter.encrypt(dataStr, iv: encIv);
  
  // 返回结果
  if (key != null && iv != null) {
    return encrypted.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join() as T;
  }
  return {
    'str': encrypted.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(),
    'key': tempKey!
  } as T;
}

/// AES 解密
/// 
/// [data] 需要解密的十六进制字符串
/// [key] 密钥
/// [iv] 初始向量（可选）
/// 
/// 返回：尝试解析为 JSON 对象，如果失败则返回字符串
dynamic cryptoAesDecrypt(String data, String key, [String? iv]) {
  // 处理密钥和IV
  String finalKey = key;
  if (iv == null) {
    finalKey = cryptoMd5(key).substring(0, 32);
  }
  String finalIv = iv ?? finalKey.substring(finalKey.length - 16);
  
  try {
    // 执行AES解密
    final encKey = enc.Key.fromUtf8(finalKey);
    final encIv = enc.IV.fromUtf8(finalIv);
    final encrypter = enc.Encrypter(enc.AES(encKey, mode: enc.AESMode.cbc));
    
    // 将十六进制字符串转换为字节
    final encryptedBytes = List<int>.generate(
      data.length ~/ 2,
      (i) => int.parse(data.substring(i * 2, i * 2 + 2), radix: 16)
    );
    
    // 确保数据长度是AES块大小(16字节)的整数倍
    final blockSize = 16;
    final paddedLength = (encryptedBytes.length ~/ blockSize) * blockSize;
    final validBytes = encryptedBytes.sublist(0, paddedLength);
    
    if (validBytes.isEmpty) {
      throw Exception('解密数据为空');
    }
    
    final encrypted = enc.Encrypted(Uint8List.fromList(validBytes));
    final decrypted = encrypter.decrypt(encrypted, iv: encIv);
    
    // 尝试解析为JSON
    try {
      return jsonDecode(decrypted);
    } catch (_) {
      return decrypted;
    }
  } catch (e) {
    throw Exception('AES解密失败: $e');
  }
}

/// RSA加密（无填充）
/// 
/// [data] 需要加密的数据
/// [publicKey] RSA公钥（可选，默认使用环境变量判断）
/// 
/// 返回十六进制字符串
String cryptoRSAEncrypt(dynamic data, {String? publicKey}) {
  
  // 处理输入数据
  String dataStr = data is Map || data is List
      ? jsonEncode(data)
      : data.toString();

  final buffer = Uint8List.fromList(utf8.encode(dataStr));
 
  final pem = publicKey ?? publicLiteRasKey;

  // 2. 解析 PEM 公钥，提取 modulus (n) 和 exponent (e)
  final RSAPublicKey key = StringUtils.CryptoUtils.rsaPublicKeyFromPem(pem);
  final BigInt n = key.modulus!;
  final BigInt e = key.exponent!;

  // 3. 计算密钥长度 (字节数) -> 等同于 JS: Math.ceil(key.n.bitLength() / 8)
  final int keyLength = (n.bitLength + 7) ~/ 8;

  if (buffer.length > keyLength) {
    throw ArgumentError('Data length exceeds key size');
  }

  // 4. 自定义填充逻辑：如果数据短于密钥长度，则在【右侧补零】
  // 注意：JS 的 Uint8Array.set(buffer) 默认从 index 0 开始复制，即数据在左，0 在右。
  Uint8List padded = buffer;
  if (buffer.length < keyLength) {
    padded = Uint8List(keyLength);
    padded.setRange(0, buffer.length, buffer);
  }

  return rsaRawEncrypt(padded, e, n, keyLength);
}

/// 底层 Raw RSA 加密 (等同于 JS 的 rsaRawEncrypt)
String rsaRawEncrypt(Uint8List buffer, BigInt e, BigInt n, int keyLength) {
  // 1. 将 Uint8List 转换为 BigInt (大端序 Big-Endian)
  // 等同于 JS: new forge.jsbn.BigInteger(uint8ArrayToHex(buffer), 16)
  BigInt message = BigInt.zero;
  for (int i = 0; i < buffer.length; i++) {
    message = (message << 8) | BigInt.from(buffer[i]);
  }

  // 2. 核心 RSA 数学运算: C = M^e mod n
  // 等同于 JS: message.modPow(publicKey.e, publicKey.n)
  BigInt encrypted = message.modPow(e, n);

  // 3. 转换为 16 进制字符串，并在左侧补零至指定长度
  // 等同于 JS: encrypted.toString(16).padStart(keyLength * 2, '0')
  String hexStr = encrypted.toRadixString(16);
  return hexStr.padLeft(keyLength * 2, '0');
}

/// RSA加密（PKCS1 v1.5填充）
/// 
/// [data] 需要加密的数据（Map/List/String）
/// 
/// 返回十六进制字符串
String rsaEncrypt2(dynamic data) {
  // 处理输入数据
  String dataStr = data is Map || data is List
      ? jsonEncode(data)
      : data.toString();
  final buffer = Uint8List.fromList(utf8.encode(dataStr));
  
  // 使用公钥
  final key = publicLiteRasKey;
  final rsaParser = enc.RSAKeyParser();
  final rsaPublicKey = rsaParser.parse(key) as RSAPublicKey;
  
  // 计算密钥长度（字节）
  final keySize = (rsaPublicKey.n!.bitLength + 7) ~/ 8;
  
  // PKCS1 v1.5 填充: 0x00 + 0x02 + 随机非零字节 + 0x00 + 数据
  // 最大数据长度 = keySize - 11
  final maxDataLength = keySize - 11;
  if (buffer.length > maxDataLength) {
    throw ArgumentError('Data too long for RSA PKCS1 v1.5 encryption: '
        '${buffer.length} bytes (max: $maxDataLength)');
  }
  
  // 构建 PKCS1 v1.5 填充
  final padded = Uint8List(keySize);
  padded[0] = 0x00;
  padded[1] = 0x02;
  
  // 填充随机非零字节
  final random = Random.secure();
  for (int i = 2; i < keySize - buffer.length - 1;) {
    final byte = random.nextInt(256);
    if (byte != 0x00) {
      padded[i] = byte;
      i++;
    }
  }
  
  padded[keySize - buffer.length - 1] = 0x00;
  padded.setRange(keySize - buffer.length, keySize, buffer);
  
  // 使用RSA引擎加密（无额外编码）
  final encryptor = RSAEngine();
  encryptor.init(true, PublicKeyParameter<RSAPublicKey>(rsaPublicKey));
  
  final encrypted = encryptor.process(padded);
  return _bytesToHex(encrypted);
}

/// 播放列表AES加密
/// 
/// [data] 需要加密的数据
/// 
/// 返回包含密钥和加密字符串的Map
Map<String, String> playlistAesEncrypt(dynamic data) {
  // 处理输入数据
  final useData = data is Map || data is List
      ? jsonEncode(data)
      : data.toString();
  
  // 生成随机密钥
  final key = randomString(6).toLowerCase();
  final encryptKey = cryptoMd5(key).substring(0, 16);
  final iv = cryptoMd5(key).substring(16, 32);
  
  // 执行AES-128-CBC加密
  final encKey = enc.Key.fromUtf8(encryptKey);
  final encIv = enc.IV.fromUtf8(iv);
  final encrypter = enc.Encrypter(enc.AES(encKey, mode: enc.AESMode.cbc));
  final encrypted = encrypter.encrypt(useData, iv: encIv);
  
  return {
    'key': key,
    'str': base64.encode(encrypted.bytes)
  };
}

/// 字节数组转十六进制字符串
String _bytesToHex(List<int> bytes) {
  return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}

/// 播放列表AES解密
/// 
/// [data] 包含key和str的Map
/// 
/// 返回：尝试解析为JSON对象，如果失败则返回字符串
dynamic playlistAesDecrypt(Map<String, String> data) {
  final key = data['key']!;
  final encryptedStr = data['str']!;
  
  // 生成加密密钥和IV
  final encryptKey = cryptoMd5(key).substring(0, 16);
  final ivStr = cryptoMd5(key).substring(16, 32);
  
  try {
    // 首先尝试直接Base64解码（可能是未加密的数据）
    try {
      final decodedBytes = base64.decode(encryptedStr);
      final decodedStr = utf8.decode(decodedBytes);
      return jsonDecode(decodedStr);
    } catch (_) {
      // 不是纯Base64编码的JSON，继续尝试AES解密
    }
    
    // Base64解码
    final encryptedBytes = base64.decode(encryptedStr);
    
    // 确保数据长度是AES块大小(16字节)的整数倍
    final blockSize = 16;
    final paddedLength = (encryptedBytes.length ~/ blockSize) * blockSize;
    final validBytes = encryptedBytes.sublist(0, paddedLength);
    
    if (validBytes.isEmpty) {
      throw Exception('解密数据为空');
    }
    
    // 执行AES-128-CBC解密
    final encKey = enc.Key.fromUtf8(encryptKey);
    final encIv = enc.IV.fromUtf8(ivStr);
    final encrypter = enc.Encrypter(enc.AES(encKey, mode: enc.AESMode.cbc));
    final encrypted = enc.Encrypted(Uint8List.fromList(validBytes));
    final decrypted = encrypter.decrypt(encrypted, iv: encIv);
    
    // 尝试解析为JSON
    try {
      return jsonDecode(decrypted);
    } catch (_) {
      return decrypted;
    }
  } catch (e) {
    throw Exception('播放列表AES解密失败: $e');
  }
}


import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart' as pc;
import 'dart:convert';

// 自定义 NoPadding 加密方法
Encrypted encryptNoPadding(Uint8List bytes, pc.RSAPublicKey _publicKey) {
  final modulusLength = (_publicKey.n!.bitLength + 7) ~/ 8;
  
  // if (bytes.length > modulusLength - 11) {
  //   throw Exception('明文太长');
  // }

  // 手动添加零填充使长度等于模数长度
  final paddedBytes = Uint8List(modulusLength)..setRange(0, bytes.length, bytes);
  
  // 使用公钥加密
  final bi = _toBigInt(paddedBytes);
  final result = bi.modPow(_publicKey.e!, _publicKey.n!);
  return Encrypted(_toUint8List(result, modulusLength));
}

// 自定义 NoPadding 解密方法
// String decryptNoPadding(Encrypted encrypted) {
//   final bi = _toBigInt(encrypted.bytes);
//   final result = bi.modPow(_privateKey.d, _privateKey.n);
//   final decryptedBytes = _toUint8List(result, (_privateKey.n.bitLength + 7) ~/ 8);
//   // 移除零填充并转换为字符串
//   int firstNonZeroIndex = 0;
//   while (firstNonZeroIndex < decryptedBytes.length && decryptedBytes[firstNonZeroIndex] == 0) {
//     firstNonZeroIndex++;
//   }
//   return utf8.decode(decryptedBytes.sublist(firstNonZeroIndex));
// }

BigInt _toBigInt(Uint8List bytes) {
  var result = BigInt.zero;
  for (var byte in bytes) {
    result = result * BigInt.from(256) + BigInt.from(byte);
  }
  return result;
}

Uint8List _toUint8List(BigInt number, int length) {
  final result = Uint8List(length);
  for (int i = length - 1; i >= 0; i--) {
    result[i] = (number % BigInt.from(256)).toInt();
    number = number ~/ BigInt.from(256);
  }
  return result;
}

String encryptRSANoPadding(Uint8List bytes, pc.RSAPublicKey publicKey) {
  try {
    final encrypted = encryptNoPadding(bytes, publicKey);
    return base64Encode(encrypted.bytes);
  } catch (e) {
    throw Exception('加密失败: $e');
  }
}

import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:ku_gou_music/config/util.dart';
import 'package:ku_gou_music/store/user.dart';

final _dio = Dio();

/// 设备信息
///
/// 用于酷狗音乐设备注册接口 `/risk/v2/r_register_dev`
class DeviceInfo {
  /// 可用内存，单位是字节
  final int availableRamSize;

  /// 内部存储可用空间，单位是字节（约 48 MB）
  final int availableRomSize;

  /// 外部存储可用空间，单位是字节（约 48 MB）
  final int availableSDSize;

  /// 基带版本
  final String basebandVer;

  /// 电池电量百分比
  final int batteryLevel;

  /// 电池状态（1=未充电, 2=充电中, 3=已充满）
  final int batteryStatus;

  /// 品牌
  final String brand;

  /// 设备序号
  final String buildSerial;

  /// 设备代号
  final String device;

  /// IMEI 号
  final String? imei;

  /// SIM 卡号序号
  final String imsi;

  /// 厂商
  final String manufacturer;

  /// 设备 UUID
  final String? uuid;

  /// 是否有加速度传感器
  final bool accelerometer;

  /// 加速度传感器值
  final String accelerometerValue;

  /// 是否有重力传感器
  final bool gravity;

  /// 重力传感器的值
  final String gravityValue;

  /// 是否有陀螺仪
  final bool gyroscope;

  /// 陀螺仪的值
  final String gyroscopeValue;

  /// 是否有光线传感器
  final bool light;

  /// 光线传感器的值
  final String lightValue;

  /// 是否有磁力传感器
  final bool magnetic;

  /// 磁力传感器的值
  final String magneticValue;

  /// 是否有方向传感器
  final bool orientation;

  /// 方向传感器的值
  final String orientationValue;

  /// 是否有压力传感器
  final bool pressure;

  /// 压力传感器的值
  final String pressureValue;

  /// 是否有步数传感器
  final bool stepCounter;

  /// 步数传感器的值
  final String stepCounterValue;

  /// 是否有温度传感器
  final bool temperature;

  /// 温度传感器的值
  final String temperatureValue;

  DeviceInfo({
    this.availableRamSize = 4983533568,
    this.availableRomSize = 48114719,
    this.availableSDSize = 48114717,
    this.basebandVer = '',
    this.batteryLevel = 100,
    this.batteryStatus = 3,
    this.brand = 'Redmi',
    this.buildSerial = 'unknown',
    this.device = 'marble',
    this.imei,
    this.imsi = '',
    this.manufacturer = 'Xiaomi',
    this.uuid,
    this.accelerometer = false,
    this.accelerometerValue = '',
    this.gravity = false,
    this.gravityValue = '',
    this.gyroscope = false,
    this.gyroscopeValue = '',
    this.light = false,
    this.lightValue = '',
    this.magnetic = false,
    this.magneticValue = '',
    this.orientation = false,
    this.orientationValue = '',
    this.pressure = false,
    this.pressureValue = '',
    this.stepCounter = false,
    this.stepCounterValue = '',
    this.temperature = false,
    this.temperatureValue = '',
  });
}

/// 设备注册接口
///
/// 向酷狗服务器注册设备信息，用于风控和设备识别
///
/// [deviceInfo] 设备信息，为空则使用默认设备信息（Redmi/marble）
///
/// 返回包含 `status`、`body`、`cookie`、`headers` 的 Map
Future<Map<String, dynamic>> registerDevice({DeviceInfo? deviceInfo}) async {
  final info = deviceInfo ?? DeviceInfo();
  final userid = userInstance.userid;
  final token = userInstance.token;

  final dataMap = <String, dynamic>{
    'availableRamSize': info.availableRamSize,
    'availableRomSize': info.availableRomSize,
    'availableSDSize': info.availableSDSize,
    'basebandVer': info.basebandVer,
    'batteryLevel': info.batteryLevel,
    'batteryStatus': info.batteryStatus,
    'brand': info.brand,
    'buildSerial': info.buildSerial,
    'device': info.device,
    'imei': info.imei ?? '',
    'imsi': info.imsi,
    'manufacturer': info.manufacturer,
    'uuid': info.uuid ?? '',
    'accelerometer': info.accelerometer,
    'accelerometerValue': info.accelerometerValue,
    'gravity': info.gravity,
    'gravityValue': info.gravityValue,
    'gyroscope': info.gyroscope,
    'gyroscopeValue': info.gyroscopeValue,
    'light': info.light,
    'lightValue': info.lightValue,
    'magnetic': info.magnetic,
    'magneticValue': info.magneticValue,
    'orientation': info.orientation,
    'orientationValue': info.orientationValue,
    'pressure': info.pressure,
    'pressureValue': info.pressureValue,
    'step_counter': info.stepCounter,
    'step_counterValue': info.stepCounterValue,
    'temperature': info.temperature,
    'temperatureValue': info.temperatureValue,
  };

  final aesEncrypt = playlistAesEncrypt(dataMap);
  final p = rsaEncrypt2({'aes': aesEncrypt['key'], 'uid': userid, 'token': token});

  final clienttime = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();

  final params = <String, dynamic>{
    'part': '1',
    'platid': '1',
    'p': p,
  };

  final paramsWithSignature = <String, dynamic>{
    ...params,
    'appid': (isLite ? liteAppid : appid).toString(),
    'clientver': (isLite ? liteClientver : clientver).toString(),
    'clienttime': clienttime,
    'dfid': userInstance.dfid,
    'mid': mid,
    'uuid': '-',
  };
  paramsWithSignature['signature'] = signatureAndroidParams(paramsWithSignature);

  final userAgent = 'Android15-1070-11083-46-0-DiscoveryDRADProtocol-wifi';
  final headers = <String, String>{
    'User-Agent': userAgent,
    'kg-rc': '1',
    'kg-thash': '5d816a0',
    'kg-rec': '1',
    'kg-rf': 'B9EDA08A64250DEFFBCADDEE00F8F25F',
    'X-Real-IP': '127.0.0.1',
    'X-Forwarded-For': '127.0.0.1',
  };

  try {
    final response = await _dio.request(
      'https://userservice.kugou.com/risk/v2/r_register_dev',
      data: aesEncrypt['str'],
      queryParameters: paramsWithSignature,
      options: Options(
        method: 'POST',
        headers: headers,
        responseType: ResponseType.bytes,
      ),
    );

    final bytes = response.data as Uint8List;
    final base64Body = base64.encode(bytes);
    final body = playlistAesDecrypt({'str': base64Body, 'key': aesEncrypt['key']!});

    final cookies = <String>[];
    final responseCookies = response.headers['set-cookie'] ?? [];
    for (final cookie in responseCookies) {
      cookies.add(parseCookieString(cookie));
    }

    final result = <String, dynamic>{
      'status': 500,
      'body': body,
      'cookie': cookies,
      'headers': response.headers.map,
    };

    if (body is Map<String, dynamic>) {
      result['status'] = body['status'] ?? 500;
      if (body['status'] == 1 && body['data'] != null) {
        final dfid = body['data']['dfid'];
        if (dfid != null) {
          cookies.add('dfid=$dfid');
        }
      }
    }

    return result;
  } on DioException catch (e) {
    throw {
      'status': 502,
      'body': {'status': 0, 'msg': e.message},
      'cookie': <String>[],
    };
  }
}





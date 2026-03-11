import 'package:dio/dio.dart';
// import 'package:get/get_connect/connect.dart';
// import 'package:get/get_connect/http/src/request/request.dart';
import 'dart:convert';
import '../../config/config.dart';
import 'helper.dart';

const SERVER_API_URL = 'https://gateway.kugou.com';

// class _HttpService extends GetConnect {
//   @override
//   _HttpService onInit() {
//     httpClient.userAgent = '';
//     httpClient.addRequestModifier<void>((request) {
//       request.headers.remove('content-type');
//       request.headers.remove('content-length');
//       print(request);
//       return request;
//     });
//     // httpClient.baseUrl = SERVER_API_URL;
//     // 请求拦截
//     // httpClient.addRequestModifier<void>((request) {
//     //   imageHeader.forEach((key, value) {
//     //     request.headers[key] = value;
//     //   });
//     //   return request;
//     // });

//     // httpClient.addAuthenticator<dynamic>((Request request) async {
//     //   // Set the header
//     //   request.headers['token'] =
//     //       '6e9c9ba1f56d406fb35926475906f9215f0a099abae929eb041cb59900de955a';
//     //   return request;
//     // });

//     // 响应拦截
//     // httpClient.addResponseModifier(_responseHandler);
//     super.onInit();
//     return this;
//   }

//   bool _isExternalUrl(String url) {
//     final RegExp regExp = RegExp(r"^https?://");

//     if (regExp.hasMatch(url)) {
//       return true;
//     }

//     return false;
//   }

//   String completionUri(String url) {
//     if (false == _isExternalUrl(url)) url = SERVER_API_URL + url;
//     return url.replaceFirst('http://', 'https://');
//   }

//   Response<dynamic> _responseHandler(Request<Object?> request, Response response) {
//     dynamic body;
//     if ((response.headers!['content-type'] ?? '').contains('json')) {
//       try {
//         body = json.decode(response.body);
//       } catch (e) {
//         body = response.body;
//       }
//     } else {
//       body = response.body;
//     }
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return response.copyWith(body: body);
//     } else {
//       throw Exception(body);
//     }
//   }
// }

// final _HttpService httpService = _HttpService().onInit();

final dio = Dio();

/// 请求参数封装
class RequestOptions {
  final String? baseURL;

  String? url;
  /// 请求方法 GET POST PUT DELETE PATCH
  final String method;
  /// 请求地址
  String? baseUrl;
  /// post 请求Body
  final Map<String, dynamic>? data;
  /// get 请求参数
  final Map<String, dynamic>? params;
  /// 请求头
  final Map<String, String>? headers;
  /// signature加密方式 'android' | 'web' | 'register'
  String? encryptType;
  /// 请求cookie
  final Map<String, dynamic>? cookie;
  /// 
  bool? encryptKey;
  /// 清除默认请求参数
  bool? clearDefaultParams;
  bool? notSignature;
  String? ip;
  String? realIP;

  RequestOptions({
    this.params,
    this.baseURL,
    this.method = 'GET',
    this.data,
    this.headers,
    this.cookie,
    this.url,
    this.baseUrl,
    this.encryptType,
    this.encryptKey,
    this.clearDefaultParams,
    this.notSignature,
    this.ip,
    this.realIP
  });
}

/// 响应参数封装
class ResponseOptions<T> {
  int status;
  T? body;
  List<String> cookie;
  Map<String, dynamic> headers;
  ResponseOptions({ this.status = 500, this.body, this.cookie = const [], this.headers = const {} });
}

Future<ResponseOptions<T>> createRequest<T>(RequestOptions options) async {
  String dfid = options.cookie?['dfid'] ?? '08U3ic1DdgYU3EsoVb0Ee3GB'; // 自定义
  // token=3f26d402d64d4276dc8ad8cdd50814fd6871e7b029aa1b089c40c296ab3cbc52;userid=487837317;dfid=08U3ic1DdgYU3EsoVb0Ee3GB
  // String mid = options.cookie?['KUGOU_API_MID'] ?? '334689572176563962868706300678062568191'; //'334689572176563962868706300678062568191';
  String uuid = '-'; //cryptoMd5(`${dfid}${mid}`); // 可以自定义
  String token = options.cookie?['token'] ?? '3f26d402d64d4276dc8ad8cdd50814fd6871e7b029aa1b089c40c296ab3cbc52';
  int userid = options.cookie?['userid'] ?? 487837317;
  String clienttime = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
  String ip = options.realIP ?? options.ip ?? '127.0.0.1';
  Map<String, String> headers = {
    'User-Agent': 'Android15-1070-11083-46-0-DiscoveryDRADProtocol-wifi',
    ...(options.headers ?? {}),
    'kg-rc': '1',
    'kg-thash': '5d816a0',
    'kg-rec': '1',
    'kg-rf': 'B9EDA08A64250DEFFBCADDEE00F8F25F',
    'dfid': dfid, 
    'clienttime': clienttime.toString(), 
    'mid': mid,
  };
  if (ip != '') {
    headers['X-Real-IP'] = ip;
    headers['X-Forwarded-For'] = ip;
  }
  Map<String, dynamic> defaultParams = {
    "dfid": dfid,
    "mid": mid,
    "uuid": uuid,
    "appid": isLite ? liteAppid : appid,
    "clientver": isLite ? liteClientver : clientver,
    "clienttime": clienttime,
  };

  if (token.isNotEmpty) defaultParams['token'] = token;
  if (userid != 0) defaultParams['userid'] = userid.toString();
  Map<String, dynamic> params = {};
  final origin = (options.clearDefaultParams ?? false) ? options.params ?? {} : { ...defaultParams, ...(options.params ?? {})};
  /// 煞笔Uri库对int类型无法处理
  origin.forEach((key, value) {
    params[key] = value is int ? value.toString() : value;
  });
  if (options.encryptKey ?? false) {
    params['key'] = signKey(params['hash'], params['mid'], params['userid'], params['appid']);
  }

  final String data = options.data is Map ? jsonEncode(options.data) :  '';

  if ((params['signature'] == null) && !(options.notSignature ?? false)) {
    switch (options.encryptType) {
      case 'register':
        params['signature'] = signatureRegisterParams(params);
        break;
      case 'web':
        params['signature'] = signatureWebParams(params);
        break;
      case 'android':
      default:
        params['signature'] = signatureAndroidParams(params, data);
        break;
    }
  }
  /// 暂不知道这个接口作用

  // if (options.url?.includes('openapicdn')) {
  //   const url = requestOptions.url;
  //   const _params = Object.keys(params)
  //     .map((key) => `${key}=${params[key]}`)
  //     .join('&');
  //   requestOptions.url = `${url}?${_params}`;
  //   requestOptions.params = {};
  // }

  // var answer = { 'status': 500, 'body': Map<String, dynamic>, 'cookie': [], 'headers': Map<String, dynamic> };
  // final result = Future.
  try {
    // var response = await httpService.request<T>(
    //   '${options.baseURL ?? SERVER_API_URL}${options.url}', 
    //   options.method,
    //   query: params,
    //   headers: headers,
    //   body: data,
    // );

    // final response = await dio.request<T>('${options.baseURL ?? SERVER_API_URL}${options.url}', 
    //   data: data,
    //   options: Options(
    //     method: options.method,
    //     headers: headers,
    //   ),
    // );
    
    final response = await dio.get('${options.baseURL ?? SERVER_API_URL}${options.url}',
      queryParameters: params,
      options: Options(
        method: options.method,
        headers: headers,
      ),
    );

    // final body = response.body;
    // answer.cookie = (response.headers['set-cookie'] || []).map((x) => parseCookieString(x));

    // if (response.headers?['ssa-code'] != null) {
    //   answer.headers['ssa-code'] = response.headers!['ssa-code'];
    // }
    if (response.data is Map) {
      final status = (response.data as Map)['status'];
      final errorCode = (response.data as Map)['error_code'];
      if ((status is int && status != 0) || (errorCode is int && errorCode != 0)) {
        return ResponseOptions<T>(body: response.data, status: 200);
      }
    }
    throw ResponseOptions(status: 502, body: response.data );
  } catch (e) {
    throw ResponseOptions(status: 502, body: { 'status': 0, 'msg': e });
  }
}



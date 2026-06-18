import 'dart:convert';

import 'package:ku_gou_music/store/user.dart';

import '../../config/util.dart';
import '../request/request.dart';
/// 获取音乐urls
/// 
/// [albumId] 专辑id
/// 
/// [quality] 支持 魔法音乐
/// 
// piano 钢琴
// acappella 人声 伴奏 分离
// subwoofer 乐器
// ancient 尤克里里
// dj dj
Future<ResponseOptions<Map<String, dynamic>>> getMusicUrls({
  required String hash,
  /// enum SongURLQuality 'piano', 'acappella', 'subwoofer', 'ancient', 'surnay', 'dj', '128' '320' 'flac' 'high' 'viper_atmos' 'viper_clear' 'viper_tape'
  String? quality,
  int albumId = 0,
  int albumAudioDd = 0,
  /// 是否返回试听部分（仅部分歌曲）
  int freePart = 0,
}) async {
  
  final nextQuality = ['piano', 'acappella', 'subwoofer', 'ancient', 'dj', 'surnay'].contains(quality)
    ? 'magic_$quality}'
    : quality;

  final page_id = isLite ? 967177915 : 151369488;
  final ppage_id = isLite ? '356753938,823673182,967485191' : '463467626,350369493,788954147';

  final dataMap = {
    'album_id': albumId,
    'area_code': 1,
    'hash': hash.toLowerCase(),
    'ssa_flag': 'is_fromtrack',
    'version': 11436,
    'page_id': page_id,
    'quality': nextQuality ?? 128,
    'album_audio_id': albumAudioDd,
    'behavior': 'play',
    'pid': isLite ? 411 : 2,
    'cmd': 26,
    'pidversion': 3001,
    'IsFreePart': freePart,
    'ppage_id': ppage_id,
    'cdnBackup': 1,
    'kcard': 0,
    'module': '',
  };
  return createRequest(RequestOptions(
    url: '/v5/url',
    method: 'GET',
    params: dataMap,
    encryptType: 'android',
    headers: { 'x-router': 'trackercdn.kugou.com'},
    encryptKey: true,
    // notSignature: true,
    // notSign: true,
    cookie: { 'dfid': userInstance.dfid },
    // cookie: Object.assign({}, {dfid: randomString(24)}, params?.cookie ),
  ));
}

/// 新版 获取音乐urls 无法解码
Future getPrivMusicUrls({ 
  required String hash,
  String vipToken = '', 
  String? token, 
  String? KUGOU_API_MID, 
  String userid = '0', 
  String? dfid, 
  int? vip_type = 0, 
  String? album_audio_id, 
  bool free_part = false
}) async {
  var clienttime_ms = DateTime.now().millisecondsSinceEpoch;
  dfid = dfid ?? randomString(24); // 自定义

  Map<String, dynamic> dataMap = {
    'area_code': '1',
    'behavior': 'play',
    'qualities': ['128', '320', 'flac', 'high', 'multitrack', 'viper_atmos', 'viper_tape', 'viper_clear'],
    'resource': {
      'album_audio_id': album_audio_id ?? '',
      'collect_list_id': '3',
      'collect_time': clienttime_ms,
      'hash': hash ?? '',
      'id': 0,
      'page_id': 1,
      'type': 'audio',
    },
    'token': token ?? '',
    'tracker_param': {
      'all_m': 1,
      'auth': '',
      'is_free_part': free_part ? 1 : 0,
      'key': cryptoMd5('${hash}185672dd44712f60bb1736df5a377e82${appid}${KUGOU_API_MID}${userid}'),
      'module_id': 0,
      'need_climax': 1,
      'need_xcdn': 1,
      'open_time': '',
      'pid': '411',
      'pidversion': '3001',
      'priv_vip_type': '6',
      'viptoken': vipToken,
    },
    'userid': userid,
    'vip': vip_type,
  };

  return createRequest(RequestOptions(
    baseURL: 'http://tracker.kugou.com',
    url: '/v6/priv_url',
    method: 'POST',
    data: dataMap,
    encryptType: 'android',
    // cookie: Object.assign({}, { dfid }, params?.cookie),
  ));
}

/// 搜索歌词search
Future<ResponseOptions<Map<String, dynamic>>> searchLyrics({
  /// 搜索关键字
  String? keyword,
  /// 搜索hash
  String? hash,
  int? album_audio_id = 0,
  String? man,
}) {
  final dataMap = {
    'album_audio_id': album_audio_id,
    'appid': isLite ? liteAppid : appid,
    'clientver': isLite ? liteClientver : clientver,
    'duration': 0,
    'hash': hash,
    'keyword': keyword ?? '',
    'lrctxt': 1,
    'man': man ?? 'no',
  };

  return createRequest(RequestOptions(
    baseURL: 'https://lyrics.kugou.com',
    url: '/v1/search',
    params: dataMap,
    // cookie: params?.cookie || {},
    encryptType: 'android',
    clearDefaultParams: true,
    // notSign: true,
  ));
}

/// 获取音乐歌词
Future<Map<String, dynamic>> getMusicLyrics({
  /// 歌词ID、从搜索接口中获取
  required String id,
  /// 歌词密钥，从搜索接口中获取
  required String accesskey,
  /// 歌词格式，可选值：krc、lrc
  String? fmt,
  /// 客户端类型，可选值：android、ios
  String? client,
}) async {
  final dataMap = {
    'ver': 1,
    'client': client ?? 'android',
    'id': id,
    'accesskey': accesskey,
    'fmt': fmt ?? 'krc',
    'charset': 'utf8',
  };
  final response = await createRequest<Map<String, dynamic>>(RequestOptions(
    baseURL: 'https://lyrics.kugou.com',
    url: '/download',
    method: 'GET',
    params: dataMap,
    encryptType: 'android',
  ));
  var body  = response.body!;
  if (body['content'] != null) {
    body['content'] = (dataMap['fmt'] == 'lrc' || body['contenttype'] != 0) ? decodeBase64String(body['content']) : decodeLyrics(body['content']);
    // response.body!['decodeContent'] = response.body!['content'];
  }
  return body;
}

String decodeBase64String(String base64String) {
  // 将base64字符串解码为字节
  final bytes = base64.decode(base64String);
  // 将字节转换为字符串
  return utf8.decode(bytes);
}

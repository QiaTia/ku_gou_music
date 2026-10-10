import 'package:ku_gou_music/api/request/helper.dart';
import 'package:ku_gou_music/api/request/request.dart';
import 'package:ku_gou_music/config/config.dart';
import 'package:ku_gou_music/config/util.dart';
import 'package:ku_gou_music/store/user.dart';

/// 获取歌手详情
/// 对应 MoeKoe 的 /artist/detail
/// 返回：author_name / fansnums / intro / sizable_avatar（含 {size} 占位）等
Future<ResponseOptions<Map<String, dynamic>>> getArtistDetail({
  required String id,
}) {
  return createRequest(
    RequestOptions(
      url: '/kmr/v3/author',
      method: 'POST',
      data: {'author_id': id},
      encryptType: 'android',
      headers: {'x-router': 'openapi.kugou.com', 'kg-tid': '36'},
    ),
  );
}

/// 获取歌手歌曲列表
/// 对应 MoeKoe 的 /artist/audios
///
/// [sort] 'hot' 最热（1）/ 其他 最新（2）
/// 返回 data 为歌曲数组：hash/audio_name/author_name/album_name/
/// trans_param.union_cover（含 {size}）/timelength/hash_flac/hash_320/privilege/mvhash
Future<ResponseOptions<Map<String, dynamic>>> getArtistAudios({
  required String id,
  int page = 1,
  int pagesize = 30,
  String sort = 'hot',
}) {
  final clienttime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final dataMap = {
    'appid': isLite ? liteAppid : appid,
    'clientver': isLite ? liteClientver : clientver,
    'mid': mid,
    'clienttime': clienttime,
    'key': signParamsKey(clienttime.toString()),
    'author_id': id,
    'pagesize': pagesize,
    'page': page,
    'sort': sort == 'hot' ? 1 : 2,
    'area_code': 'all',
  };
  return createRequest(
    RequestOptions(
      baseURL: 'https://openapi.kugou.com',
      url: '/kmr/v1/audio_group/author',
      method: 'POST',
      data: dataMap,
      encryptType: 'android',
      headers: {'x-router': 'openapi.kugou.com', 'kg-tid': '220'},
    ),
  );
}

/// 关注歌手
/// 对应 MoeKoe 的 /artist/follow
Future<ResponseOptions<Map<String, dynamic>>> followArtist({
  required int singerid,
}) {
  final clienttime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final aesEncrypt = playlistAesEncrypt({
    'singerid': singerid,
    'token': userInstance.token,
  });
  final p = rsaEncrypt2({
    'clienttime': clienttime,
    'key': aesEncrypt['key'],
  });
  return createRequest(
    RequestOptions(
      url: '/followservice/v3/follow_singer',
      method: 'POST',
      data: {
        'plat': 0,
        'userid': userInstance.userid,
        'singerid': singerid,
        'source': 7,
        'p': p,
        'params': aesEncrypt['str'],
      },
      params: {'clienttime': clienttime},
      encryptType: 'android',
    ),
  );
}

/// 取消关注歌手
/// 对应 MoeKoe 的 /artist/unfollow
Future<ResponseOptions<Map<String, dynamic>>> unfollowArtist({
  required int singerid,
}) {
  final clienttime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final aesEncrypt = playlistAesEncrypt({
    'singerid': singerid,
    'token': userInstance.token,
  });
  final p = rsaEncrypt2({
    'clienttime': clienttime,
    'key': aesEncrypt['key'],
  });
  return createRequest(
    RequestOptions(
      url: '/followservice/v3/unfollow_singer',
      method: 'POST',
      data: {
        'plat': 0,
        'userid': userInstance.userid,
        'singerid': singerid,
        'source': 7,
        'p': p,
        'params': aesEncrypt['str'],
      },
      params: {'clienttime': clienttime},
      encryptType: 'android',
    ),
  );
}

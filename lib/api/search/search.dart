import '../request/request.dart';
import 'package:ku_gou_music/config/util.dart';
import 'package:ku_gou_music/models/search/search_song_response.dart';
import 'package:ku_gou_music/models/search/search_special_response.dart';
import 'package:ku_gou_music/models/search/search_album_response.dart';
import 'package:ku_gou_music/models/search/search_mv_response.dart';
import 'package:ku_gou_music/models/search/search_author_response.dart';
import 'package:ku_gou_music/models/search/search_lyric_response.dart';
import 'package:ku_gou_music/models/search/search_complex_response.dart';

/// 搜索接口（complexsearch.kugou.com）
///
/// 不同 type 的搜索接口返回结构完全不同，因此按类型拆分为独立函数：
/// - 单曲: /v2/search/song（大写字段 ID/SongName/...）
/// - 歌单: /v1/search/special（小写字段 specialid/specialname/...）
/// - 专辑: /v1/search/album（小写字段 albumid/albumname/...）
/// - MV: /v1/search/mv（大写字段 MvID/MvName/Pic/...）
/// - 歌手: /v1/search/author（大写字段 AuthorId/AuthorName/...）
/// - 歌词: /v1/search/lyric（大写字段 LyricID/SongName/...）
///
/// 使用 Web 端签名（platform=WebFilter + appid=1014）匿名请求，
/// 无需设备注册（dfid=-）与登录 token。
const _searchHost = 'https://complexsearch.kugou.com';

/// Web 端搜索通用参数
Map<String, String> _webSearchParams(
  String keywords,
  int page,
  int pagesize,
) {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  return {
    'keyword': keywords,
    'page': page.toString(),
    'pagesize': pagesize.toString(),
    'bitrate': '0',
    'isfuzzy': '0',
    'tag': 'em',
    'inputtype': '0',
    'platform': 'WebFilter',
    'userid': '-1',
    'clientver': '2000',
    'iscorrection': '1',
    'privilege_filter': '0',
    'srcappid': '2919',
    'clienttime': timestamp.toString(),
    'mid': cryptoMd5('search_mid_$timestamp'),
    'uuid': cryptoMd5('search_uuid_$timestamp'),
    'dfid': '-',
    'appid': '1014',
  };
}

/// 发起 Web 端搜索请求，返回响应中的 data 部分
Future<Map<String, dynamic>> _webSearch(
  String type,
  String keywords,
  int page,
  int pagesize,
) async {
  final res = await createRequest(
    RequestOptions(
      url: '/${type == 'song' ? 'v2' : 'v1'}/search/$type',
      baseURL: _searchHost,
      method: 'GET',
      params: _webSearchParams(keywords, page, pagesize),
      encryptType: 'web',
      clearDefaultParams: true,
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',
        'Referer': 'https://www.kugou.com/',
      },
    ),
  );

  final body = res.body;
  if (body is Map<String, dynamic> && body['status'] == 1) {
    final data = body['data'];
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
  }
  throw Exception('搜索$type失败: ${body is Map ? body['error_code'] : body}');
}

/// 搜索单曲
Future<SearchSongResponse> searchSong(
  String keywords, [
  int page = 1,
  int pagesize = 30,
]) async {
  final data = await _webSearch('song', keywords, page, pagesize);
  return SearchSongResponse.fromJson(data);
}

/// 搜索歌单
Future<SearchSpecialResponse> searchSpecial(
  String keywords, [
  int page = 1,
  int pagesize = 30,
]) async {
  final data = await _webSearch('special', keywords, page, pagesize);
  return SearchSpecialResponse.fromJson(data);
}

/// 搜索专辑
Future<SearchAlbumResponse> searchAlbum(
  String keywords, [
  int page = 1,
  int pagesize = 30,
]) async {
  final data = await _webSearch('album', keywords, page, pagesize);
  return SearchAlbumResponse.fromJson(data);
}

/// 搜索MV
Future<SearchMvResponse> searchMv(
  String keywords, [
  int page = 1,
  int pagesize = 30,
]) async {
  final data = await _webSearch('mv', keywords, page, pagesize);
  return SearchMvResponse.fromJson(data);
}

/// 搜索歌手
Future<SearchAuthorResponse> searchAuthor(
  String keywords, [
  int page = 1,
  int pagesize = 30,
]) async {
  final data = await _webSearch('author', keywords, page, pagesize);
  return SearchAuthorResponse.fromJson(data);
}

/// 搜索歌词
Future<SearchLyricResponse> searchLyric(
  String keywords, [
  int page = 1,
  int pagesize = 30,
]) async {
  final data = await _webSearch('lyric', keywords, page, pagesize);
  return SearchLyricResponse.fromJson(data);
}

/// 综合搜索（App 端接口，需要设备注册）
Future<SearchComplexResponse> searchComplex(
  String keywords, [
  int page = 1,
  int? pagesize,
]) async {
  final dataMap = {
    "platform": 'AndroidFilter',
    "keyword": keywords,
    "page": page,
    "pagesize": pagesize ?? 30,
    "cursor": 0,
  };
  final res = await createRequest(
    RequestOptions(
      url: '/v6/search/complex',
      baseURL: _searchHost,
      method: 'GET',
      params: dataMap,
      encryptType: 'android',
    ),
  );

  return SearchComplexResponse.fromJson(res.body?['data']);
}

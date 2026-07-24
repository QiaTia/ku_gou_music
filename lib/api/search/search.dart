import '../request/request.dart';
import 'package:ku_gou_music/models/search/search_song_response.dart';
import 'package:ku_gou_music/models/search/search_complex_response.dart';

/// 普通搜索
/// { type: 'song', name: '单曲' },
// { type: 'special', name: '歌单' },
// { type: 'album', name: '专辑' },
// { type: 'mv', name: 'MV' },
// { type: 'author', name: '歌手' }
Future search(
  String keywords, [
  String type = 'song',
  int page = 1,
  int? pagesize,
]) async {
  final dataMap = {
    // token: '',
    "albumhide": 0,
    "iscorrection": 1,
    "keyword": keywords,
    "nocollect": 0,
    "page": page,
    "pagesize": pagesize ?? 30,
    "platform": 'AndroidFilter',
  };

  final searchType =
      ['special', 'lyric', 'song', 'album', 'author', 'mv'].contains(type)
      ? type
      : 'song';

  final res = await createRequest(
    RequestOptions(
      url: '/${searchType == 'song' ? 'v3' : 'v1'}/search/$searchType',
      method: 'GET',
      params: dataMap,
      encryptType: 'android',
      headers: {'x-router': 'complexsearch.kugou.com'},
    ),
  );
  return res.body?['data'];
  // return SearchSongResponse.fromJson(res.body?['data']);
}

/// 综合搜索
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
      baseURL: 'https://complexsearch.kugou.com',
      method: 'GET',
      params: dataMap,
      encryptType: 'android',
    ),
  );

  return SearchComplexResponse.fromJson(res.body?['data']);
}

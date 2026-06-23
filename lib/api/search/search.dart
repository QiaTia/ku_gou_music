import '../request/request.dart';

/// 普通搜索
/// { type: 'song', name: '单曲' },
// { type: 'special', name: '歌单' },
// { type: 'album', name: '专辑' },
// { type: 'mv', name: 'MV' },
// { type: 'author', name: '歌手' }
Future search(String keywords, [String type = 'song',int page = 1, int? pagesize]) async {
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

  final searchType = ['special', 'lyric', 'song', 'album', 'author', 'mv'].contains(type) ? type : 'song';

  return createRequest(RequestOptions(
    url: '/${searchType == 'song' ? 'v3' : 'v1'}/search/song$searchType',
    method: 'GET', 
    params: dataMap,
    encryptType: 'android',
    headers: { 'x-router': 'complexsearch.kugou.com' },
  ));
}
/// 综合搜索
Future searchComplex(String keywords, [int page = 1, int? pagesize]) async {
   final dataMap = {
    "platform": 'AndroidFilter',
    "keyword": keywords,
    "page": page,
    "pagesize": pagesize ?? 30 ,
    "cursor": 0,
  };
  return createRequest(RequestOptions(
    url: '/v6/search/complex',
    baseURL: 'https://complexsearch.kugou.com',
    method: 'GET', 
    params: dataMap,
    encryptType: 'android',
  ));
}

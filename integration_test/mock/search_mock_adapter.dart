import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// 集成测试用的 Dio 网络适配器。
///
/// 仅拦截「综合搜索」接口 (`/v6/search/complex`)，返回本地构造的合法 JSON，
/// 使搜索流程测试不依赖外网、可重复执行；其余请求透传到真实网络
/// （首页推荐、广场分类等在有网环境下由真实接口返回）。
///
/// 用法：在测试初始化时 `dio.httpClientAdapter = const MockHttpClientAdapter();`
class MockHttpClientAdapter implements HttpClientAdapter {
  MockHttpClientAdapter([HttpClientAdapter? delegate])
      : _delegate = delegate ?? IOHttpClientAdapter();

  final HttpClientAdapter _delegate;

  // 与 lib/models/search 中各 freezed 模型字段对应的精简合法响应。
  // 所有字段都有 @Default，因此最小字段也能被正确解析。
  static const String _complexJson = r'''
  {
    "status": 1,
    "error_code": 0,
    "data": {
      "correctiontip": "",
      "correctionforce": 0,
      "lists": [
        {
          "type": "song",
          "total": "1",
          "lists": [
            {
              "ID": "123",
              "SongName": "Test Song",
              "SingerName": "Test Artist",
              "FileHash": "abc",
              "Duration": "200",
              "Image": "http://example.com/cover.png"
            }
          ]
        },
        {
          "type": "collect",
          "total": "1",
          "lists": [
            {
              "specialid": "456",
              "specialname": "Test Playlist",
              "img": "http://example.com/p.png",
              "song_count": "10",
              "nickname": "tester"
            }
          ]
        },
        {
          "type": "author",
          "total": "1",
          "lists": [
            {
              "AuthorId": "789",
              "AuthorName": "Test Author",
              "Avatar": "http://example.com/a.png",
              "AudioCount": "20",
              "FansNum": "100"
            }
          ]
        }
      ]
    }
  }
  ''';

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.contains('search/complex')) {
      return ResponseBody.fromString(
        _complexJson,
        200,
        headers: {'content-type': ['application/json']},
      );
    }
    // 非搜索接口：透传真实网络
    return _delegate.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) => _delegate.close(force: force);
}

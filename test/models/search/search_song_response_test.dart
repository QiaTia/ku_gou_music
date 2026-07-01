import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:ku_gou_music/models/search/search_song_response.dart';

void main() {
  group('SearchSongResponse', () {
    test('fromJson 正常数据反序列化', () {
      final json = {
        'info': [
          {
            'songid': 1001,
            'songname': '晴天',
            'hash': 'hash_a',
            'author_name': '周杰伦',
            'album_id': 2001,
            'album_name': '叶惠美',
            'time_length': 269,
          },
          {
            'songid': 1002,
            'songname': '七里香',
            'hash': 'hash_b',
            'author_name': '周杰伦',
            'album_id': 2002,
            'album_name': '七里香',
            'time_length': 299,
          },
        ],
        'count': 100,
        'pagesize': 30,
        'page': 1,
      };

      final response = SearchSongResponse.fromJson(json);

      expect(response.info.length, 2);
      expect(response.info[0].songid, 1001);
      expect(response.info[0].songname, '晴天');
      expect(response.info[1].songid, 1002);
      expect(response.info[1].songname, '七里香');
      expect(response.count, 100);
      expect(response.pagesize, 30);
      expect(response.page, 1);
    });

    test('fromJson 空列表', () {
      final json = {
        'info': [],
        'count': 0,
        'pagesize': 30,
        'page': 1,
      };

      final response = SearchSongResponse.fromJson(json);

      expect(response.info, isEmpty);
      expect(response.count, 0);
    });

    test('fromJson 缺失字段使用默认值', () {
      final json = <String, dynamic>{};

      final response = SearchSongResponse.fromJson(json);

      expect(response.info, []);
      expect(response.count, 0);
      expect(response.pagesize, 30);
      expect(response.page, 1);
    });

    test('fromJson null 字段使用默认值', () {
      final json = {
        'info': null,
        'count': null,
        'pagesize': null,
        'page': null,
      };

      final response = SearchSongResponse.fromJson(json);

      expect(response.info, []);
      expect(response.count, 0);
      expect(response.pagesize, 30);
      expect(response.page, 1);
    });

    test('toJson round-trip', () {
      final json = {
        'info': [
          {
            'songid': 1001,
            'songname': '晴天',
            'hash': 'hash_a',
            'author_name': '周杰伦',
            'album_id': 2001,
            'album_name': '叶惠美',
            'time_length': 269,
            'publish_date': '',
            'sizable_cover': '',
            'file_size': 0,
            'singerinfo': [],
            'tags': [],
            '320hash': '',
            '320filesize': 0,
            'sqhash': '',
            'sqfilesize': 0,
            'high_hash': '',
            'privilege': 0,
            'old_song_id': 0,
            'old_copys': 0,
            'album_audio_id': 0,
          },
        ],
        'count': 50,
        'pagesize': 30,
        'page': 2,
      };

      final response = SearchSongResponse.fromJson(json);
      final restored = SearchSongResponse.fromJson(
        jsonDecode(jsonEncode(response.toJson())) as Map<String, dynamic>,
      );

      expect(restored.info.length, 1);
      expect(restored.info[0].songid, 1001);
      expect(restored.count, 50);
      expect(restored.pagesize, 30);
      expect(restored.page, 2);
    });

    test('freezed 相等性', () {
      final json = {
        'info': [],
        'count': 0,
        'pagesize': 30,
        'page': 1,
      };

      final a = SearchSongResponse.fromJson(json);
      final b = SearchSongResponse.fromJson(json);
      expect(a, equals(b));
    });

    test('freezed copyWith', () {
      final json = {
        'info': [],
        'count': 0,
        'pagesize': 30,
        'page': 1,
      };

      final response = SearchSongResponse.fromJson(json);
      final copied = response.copyWith(count: 200, page: 3);

      expect(copied.count, 200);
      expect(copied.page, 3);
      expect(copied.pagesize, 30);
    });
  });
}

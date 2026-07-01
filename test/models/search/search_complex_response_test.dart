import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:ku_gou_music/models/search/search_complex_response.dart';

void main() {
  group('SearchComplexResponse', () {
    test('fromJson 完整综合搜索响应', () {
      final json = {
        'song': {
          'info': [
            {
              'songid': 1001,
              'songname': '晴天',
              'hash': 'hash_song_a',
              'author_name': '周杰伦',
              'album_id': 2001,
              'album_name': '叶惠美',
              'time_length': 269,
            },
          ],
          'count': 500,
        },
        'special': {
          'info': [
            {
              'specialid': 3001,
              'specialname': '华语经典',
              'singername': '',
              'imgurl': 'https://img.kugou.com/sp/100.jpg',
              'play_count': 80000,
            },
          ],
          'count': 200,
        },
        'album': {
          'info': [
            {
              'albumid': 4001,
              'albumname': '范特西',
              'singername': '周杰伦',
              'imgurl': 'https://img.kugou.com/al/100.jpg',
              'song_count': 10,
            },
          ],
          'count': 50,
        },
        'mv': {
          'info': [
            {
              'mvid': 5001,
              'mvname': '晴天MV',
              'singername': '周杰伦',
              'imgurl': 'https://img.kugou.com/mv/100.jpg',
              'play_count': 2000000,
            },
          ],
          'count': 30,
        },
        'author': {
          'info': [
            {
              'authorid': 3066,
              'author_name': '周杰伦',
              'imgurl': 'https://img.kugou.com/singer/3066.jpg',
              'song_count': 300,
            },
          ],
          'count': 10,
        },
        'lyric': {
          'info': [
            {
              'id': 6001,
              'accesskey': 'AK_XYZ',
              'songname': '晴天',
              'singername': '周杰伦',
              'hash': 'lyric_hash',
              'duration': 269,
            },
          ],
          'count': 15,
        },
      };

      final response = SearchComplexResponse.fromJson(json);

      // song
      expect(response.song, isNotNull);
      expect(response.song!.info.length, 1);
      expect(response.song!.info[0].songid, 1001);
      expect(response.song!.info[0].songname, '晴天');
      expect(response.song!.count, 500);

      // special
      expect(response.special, isNotNull);
      expect(response.special!.info.length, 1);
      expect(response.special!.info[0].specialId, 3001);
      expect(response.special!.info[0].specialName, '华语经典');
      expect(response.special!.count, 200);

      // album
      expect(response.album, isNotNull);
      expect(response.album!.info.length, 1);
      expect(response.album!.info[0].albumId, 4001);
      expect(response.album!.info[0].albumName, '范特西');
      expect(response.album!.count, 50);

      // mv
      expect(response.mv, isNotNull);
      expect(response.mv!.info.length, 1);
      expect(response.mv!.info[0].mvId, 5001);
      expect(response.mv!.info[0].mvName, '晴天MV');
      expect(response.mv!.count, 30);

      // author
      expect(response.author, isNotNull);
      expect(response.author!.info.length, 1);
      expect(response.author!.info[0].authorId, 3066);
      expect(response.author!.info[0].authorName, '周杰伦');
      expect(response.author!.count, 10);

      // lyric
      expect(response.lyric, isNotNull);
      expect(response.lyric!.info.length, 1);
      expect(response.lyric!.info[0].id, 6001);
      expect(response.lyric!.info[0].songName, '晴天');
      expect(response.lyric!.count, 15);
    });

    test('fromJson 部分分组缺失时为 null', () {
      final json = {
        'song': {
          'info': [
            {
              'songid': 1001,
              'songname': '晴天',
              'hash': 'hash_a',
              'author_name': '周杰伦',
            },
          ],
          'count': 10,
        },
        // 其他分组缺失
      };

      final response = SearchComplexResponse.fromJson(json);

      expect(response.song, isNotNull);
      expect(response.song!.info.length, 1);
      expect(response.special, isNull);
      expect(response.album, isNull);
      expect(response.mv, isNull);
      expect(response.author, isNull);
      expect(response.lyric, isNull);
    });

    test('fromJson 空响应', () {
      final response = SearchComplexResponse.fromJson({});

      expect(response.song, isNull);
      expect(response.special, isNull);
      expect(response.album, isNull);
      expect(response.mv, isNull);
      expect(response.author, isNull);
      expect(response.lyric, isNull);
    });

    test('fromJson 分组内 info 为空列表', () {
      final json = {
        'song': {'info': [], 'count': 0},
        'special': {'info': [], 'count': 0},
        'album': {'info': [], 'count': 0},
        'mv': {'info': [], 'count': 0},
        'author': {'info': [], 'count': 0},
        'lyric': {'info': [], 'count': 0},
      };

      final response = SearchComplexResponse.fromJson(json);

      expect(response.song!.info, isEmpty);
      expect(response.special!.info, isEmpty);
      expect(response.album!.info, isEmpty);
      expect(response.mv!.info, isEmpty);
      expect(response.author!.info, isEmpty);
      expect(response.lyric!.info, isEmpty);
    });

    test('fromJson 分组内 count 缺失时默认为 0', () {
      final json = {
        'song': {
          'info': [
            {
              'songid': 1,
              'songname': '测试',
              'hash': 'h1',
              'author_name': '歌手A',
            },
          ],
        },
      };

      final response = SearchComplexResponse.fromJson(json);

      expect(response.song, isNotNull);
      expect(response.song!.info.length, 1);
      expect(response.song!.count, 0);
    });

    test('toJson round-trip', () {
      final json = {
        'song': {
          'info': [
            {
              'songid': 1001,
              'songname': '晴天',
              'hash': 'hash_a',
              'author_name': '周杰伦',
              'album_id': 0,
              'album_name': '',
              'time_length': 0,
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
          'count': 500,
        },
        'special': {
          'info': [
            {
              'specialid': 3001,
              'specialname': '华语经典',
              'singername': '',
              'imgurl': '',
              'intro': '',
              'play_count': 0,
              'collectcount': 0,
              'global_collection_id': '',
              'nickname': '',
              'song_count': 0,
              'tag': '',
              'publishtime': '',
            },
          ],
          'count': 200,
        },
      };

      final response = SearchComplexResponse.fromJson(json);
      final restored = SearchComplexResponse.fromJson(
        jsonDecode(jsonEncode(response.toJson())) as Map<String, dynamic>,
      );

      expect(restored.song!.info[0].songid, 1001);
      expect(restored.song!.count, 500);
      expect(restored.special!.info[0].specialId, 3001);
      expect(restored.special!.count, 200);
    });

    test('freezed 相等性', () {
      final json = {
        'song': {
          'info': [],
          'count': 0,
        },
      };

      final a = SearchComplexResponse.fromJson(json);
      final b = SearchComplexResponse.fromJson(json);
      expect(a, equals(b));
    });

    test('freezed copyWith', () {
      final json = {
        'song': {
          'info': [],
          'count': 10,
        },
      };

      final response = SearchComplexResponse.fromJson(json);
      final copied = response.copyWith(
        album: SearchComplexAlbum(info: [], count: 5),
      );

      expect(copied.song, isNotNull);
      expect(copied.song!.count, 10);
      expect(copied.album, isNotNull);
      expect(copied.album!.count, 5);
    });
  });

  group('SearchComplexSong', () {
    test('fromJson 正常数据', () {
      final json = {
        'info': [
          {
            'songid': 1,
            'songname': '测试',
            'hash': 'h1',
            'author_name': '歌手A',
          },
        ],
        'count': 100,
      };

      final song = SearchComplexSong.fromJson(json);
      expect(song.info.length, 1);
      expect(song.count, 100);
    });

    test('fromJson 默认值', () {
      final song = SearchComplexSong.fromJson({});
      expect(song.info, []);
      expect(song.count, 0);
    });
  });
}

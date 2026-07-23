import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:ku_gou_music/models/search/search_complex_response.dart';

void main() {
  group('SearchComplexResponse', () {
    test('fromJson 完整综合搜索响应', () {
      // 注意：实际调用方会先取出接口的 data 字段再传入，
      // 因此这里直接构造 data 层 JSON（包含 correctiontip + lists 分组）。
      final json = {
        'correctiontip': '你是不是要找：晴天',
        'lists': [
          {
            'type': 'song',
            'total': 480,
            'lists': [
              {
                'ID': 1001,
                'SongName': '晴天',
                'SingerName': '周杰伦',
                'FileHash': 'hash_song_a',
                'Duration': 269,
                'AlbumID': 2001,
                'AlbumName': '叶惠美',
              },
            ],
          },
          {
            'type': 'album',
            'total': 50,
            'lists': [
              {
                'albumid': 4001,
                'albumname': '范特西',
                'singername': '周杰伦',
                'imgurl': 'https://img.kugou.com/al/100.jpg',
                'song_count': 10,
              },
            ],
          },
          {
            'type': 'mv',
            'total': 30,
            'lists': [
              {
                'mvid': 5001,
                'mvname': '晴天MV',
                'singername': '周杰伦',
                'imgurl': 'https://img.kugou.com/mv/100.jpg',
                'play_count': 2000000,
              },
            ],
          },
          {
            'type': 'author',
            'total': 10,
            'lists': [
              {
                'AuthorId': 3066,
                'AuthorName': '周杰伦',
                'Avatar': 'https://img.kugou.com/singer/3066.jpg',
                'AudioCount': 300,
              },
            ],
          },
          {
            'type': 'collect',
            'total': 200,
            'lists': [
              {
                'specialid': 3001,
                'specialname': '华语经典',
                'img': 'https://img.kugou.com/sp/100.jpg',
                'song_count': 100,
              },
            ],
          },
          {
            'type': 'program',
            'total': 5,
            'lists': [
              {
                'albumid': 7001,
                'albumname': '电台A',
                'title': '第1期',
                'singer': '主播A',
                'songcount': 20,
              },
            ],
          },
        ],
      };

      final response = SearchComplexResponse.fromJson(json);

      // 分组数量与提示
      expect(response.lists.length, 6);
      expect(response.correctionTip, '你是不是要找：晴天');

      SearchComplexGroup groupOf(String type) =>
          response.lists.firstWhere((g) => g.type == type);

      // song —— 通过扩展 getter songList 按类型解析
      final songGroup = groupOf('song');
      expect(songGroup.total, 480);
      expect(songGroup.songList.length, 1);
      expect(songGroup.songList[0].id, 1001);
      expect(songGroup.songList[0].songName, '晴天');
      expect(songGroup.songList[0].singerName, '周杰伦');

      // album
      final albumGroup = groupOf('album');
      expect(albumGroup.albumList.length, 1);
      expect(albumGroup.albumList[0].albumId, 4001);
      expect(albumGroup.albumList[0].albumName, '范特西');

      // mv
      final mvGroup = groupOf('mv');
      expect(mvGroup.mvList.length, 1);
      expect(mvGroup.mvList[0].mvId, 5001);
      expect(mvGroup.mvList[0].mvName, '晴天MV');

      // author
      final authorGroup = groupOf('author');
      expect(authorGroup.authorList.length, 1);
      expect(authorGroup.authorList[0].authorId, 3066);
      expect(authorGroup.authorList[0].authorName, '周杰伦');

      // collect
      final collectGroup = groupOf('collect');
      expect(collectGroup.collectList.length, 1);
      expect(collectGroup.collectList[0].specialId, 3001);
      expect(collectGroup.collectList[0].specialName, '华语经典');

      // program
      final programGroup = groupOf('program');
      expect(programGroup.programList.length, 1);
      expect(programGroup.programList[0].albumId, 7001);
      expect(programGroup.programList[0].title, '第1期');
    });

    test('fromJson 部分分组缺失时只含已有分组', () {
      final json = {
        'lists': [
          {
            'type': 'song',
            'total': 10,
            'lists': [
              {'ID': 1, 'SongName': '测试', 'SingerName': '歌手A'},
            ],
          },
        ],
      };

      final response = SearchComplexResponse.fromJson(json);

      expect(response.lists.length, 1);
      expect(response.lists.first.type, 'song');
      expect(response.lists.first.songList.length, 1);
      // 未返回的分组在 lists 中不存在
      expect(response.lists.any((g) => g.type == 'album'), false);
      expect(response.lists.any((g) => g.type == 'mv'), false);
    });

    test('fromJson 空响应', () {
      final response = SearchComplexResponse.fromJson({});

      expect(response.lists, isEmpty);
      expect(response.correctionTip, '');
    });

    test('fromJson 分组内 lists 为空列表', () {
      final json = {
        'lists': [
          {'type': 'song', 'total': 0, 'lists': []},
        ],
      };

      final response = SearchComplexResponse.fromJson(json);

      expect(response.lists.first.songList, isEmpty);
    });

    test('fromJson 分组内 total 缺失时默认为 0', () {
      final json = {
        'lists': [
          {
            'type': 'song',
            'lists': [
              {'ID': 1, 'SongName': '测试', 'SingerName': '歌手A'},
            ],
          },
        ],
      };

      final response = SearchComplexResponse.fromJson(json);

      expect(response.lists.first.total, 0);
      expect(response.lists.first.songList.length, 1);
    });

    test('toJson round-trip', () {
      final json = {
        'correctiontip': 'tip',
        'lists': [
          {
            'type': 'song',
            'total': 500,
            'lists': [
              {'ID': 1001, 'SongName': '晴天', 'SingerName': '周杰伦'},
            ],
          },
          {
            'type': 'album',
            'total': 50,
            'lists': [
              {'albumid': 4001, 'albumname': '范特西', 'singername': '周杰伦'},
            ],
          },
        ],
      };

      final response = SearchComplexResponse.fromJson(json);
      final restored = SearchComplexResponse.fromJson(
        jsonDecode(jsonEncode(response.toJson())) as Map<String, dynamic>,
      );

      expect(restored.lists.length, 2);
      final songGroup = restored.lists.firstWhere((g) => g.type == 'song');
      expect(songGroup.total, 500);
      expect(songGroup.songList[0].id, 1001);
      expect(songGroup.songList[0].songName, '晴天');
      final albumGroup = restored.lists.firstWhere((g) => g.type == 'album');
      expect(albumGroup.albumList[0].albumId, 4001);
    });

    test('freezed 相等性', () {
      final json = {
        'lists': [
          {'type': 'song', 'total': 0, 'lists': []},
        ],
      };

      final a = SearchComplexResponse.fromJson(json);
      final b = SearchComplexResponse.fromJson(json);
      expect(a, equals(b));
    });

    test('freezed copyWith', () {
      final json = {
        'lists': [
          {'type': 'song', 'total': 10, 'lists': []},
        ],
      };

      final response = SearchComplexResponse.fromJson(json);
      final newGroup = SearchComplexGroup(
        type: 'mv',
        total: 5,
        lists: [
          {'mvid': 1, 'mvname': 'MV1', 'singername': 'x'},
        ],
      );
      final copied = response.copyWith(lists: [newGroup]);

      expect(copied.lists.length, 1);
      expect(copied.lists.first.type, 'mv');
      expect(copied.lists.first.total, 5);
      expect(copied.lists.first.mvList.length, 1);
    });
  });
}

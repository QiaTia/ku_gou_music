import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:ku_gou_music/models/search/search_song_info.dart';

void main() {
  group('SearchSongInfo', () {
    test('fromJson 正常数据反序列化', () {
      final json = {
        'songid': 12345678,
        'songname': '晴天',
        'hash': 'a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4',
        'author_name': '周杰伦',
        'album_id': 87654,
        'album_name': '叶惠美',
        'time_length': 269,
        'publish_date': '2003-07-31',
        'sizable_cover': 'https://img.kugou.com/album/{size}/100.jpg',
        'file_size': 4300800,
        'singerinfo': [
          {'name': '周杰伦', 'is_publish': 1, 'id': 1234},
        ],
        'tags': [
          {'tag_id': 1, 'tag_name': '华语', 'parent_id': 0},
        ],
        '320hash': 'f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3',
        '320filesize': 8601600,
        'sqhash': '1a2b3c4d5e6f1a2b3c4d5e6f1a2b3c4d',
        'sqfilesize': 34406400,
        'high_hash': 'abcdef123456abcdef123456abcdef12',
        'privilege': 0,
        'old_song_id': 11111,
        'old_copys': 1,
        'album_audio_id': 99999,
      };

      final info = SearchSongInfo.fromJson(json);

      expect(info.songid, 12345678);
      expect(info.songname, '晴天');
      expect(info.hash, 'a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4');
      expect(info.authorName, '周杰伦');
      expect(info.albumId, 87654);
      expect(info.albumName, '叶惠美');
      expect(info.timeLength, 269);
      expect(info.publishDate, '2003-07-31');
      expect(info.coverUrl, 'https://img.kugou.com/album/{size}/100.jpg');
      expect(info.fileSize, 4300800);
      expect(info.singerinfo.length, 1);
      expect(info.singerinfo[0].name, '周杰伦');
      expect(info.tags.length, 1);
      expect(info.tags[0].tagName, '华语');
      expect(info.hash320, 'f6e5d4c3b2a1f6e5d4c3b2a1f6e5d4c3');
      expect(info.fileSize320, 8601600);
      expect(info.hashSq, '1a2b3c4d5e6f1a2b3c4d5e6f1a2b3c4d');
      expect(info.fileSizeSq, 34406400);
      expect(info.hashHigh, 'abcdef123456abcdef123456abcdef12');
      expect(info.privilege, 0);
      expect(info.oldSongId, 11111);
      expect(info.oldCopys, 1);
      expect(info.albumAudioId, 99999);
    });

    test('fromJson IntFromStringConverter 兼容 String 类型', () {
      final json = {
        'songid': '12345678',
        'songname': '测试歌曲',
        'hash': 'abc123',
        'author_name': '测试歌手',
        'album_id': '87654',
        'time_length': '269',
        'file_size': '4300800',
        '320filesize': '8601600',
        'sqfilesize': '34406400',
        'privilege': '1',
      };

      final info = SearchSongInfo.fromJson(json);

      expect(info.songid, 12345678);
      expect(info.albumId, 87654);
      expect(info.timeLength, 269);
      expect(info.fileSize, 4300800);
      expect(info.fileSize320, 8601600);
      expect(info.fileSizeSq, 34406400);
      expect(info.privilege, 1);
    });

    test('fromJson IntFromStringConverter 兼容 double 类型', () {
      final json = {
        'songid': 12345678.0,
        'songname': '测试歌曲',
        'hash': 'abc123',
        'author_name': '测试歌手',
        'album_id': 87654.5,
        'time_length': 269.9,
        'file_size': 4300800.0,
      };

      final info = SearchSongInfo.fromJson(json);

      expect(info.songid, 12345678);
      expect(info.albumId, 87654);
      expect(info.timeLength, 269);
      expect(info.fileSize, 4300800);
    });

    test('fromJson 缺失可选字段时使用默认值', () {
      final json = {
        'songid': 1,
        'songname': '最小数据',
        'hash': 'hash1',
        'author_name': '歌手A',
      };

      final info = SearchSongInfo.fromJson(json);

      expect(info.albumId, 0);
      expect(info.albumName, '');
      expect(info.timeLength, 0);
      expect(info.publishDate, '');
      expect(info.coverUrl, '');
      expect(info.fileSize, 0);
      expect(info.singerinfo, []);
      expect(info.tags, []);
      expect(info.hash320, '');
      expect(info.fileSize320, 0);
      expect(info.hashSq, '');
      expect(info.fileSizeSq, 0);
      expect(info.hashHigh, '');
      expect(info.privilege, 0);
      expect(info.oldSongId, 0);
      expect(info.oldCopys, 0);
      expect(info.albumAudioId, 0);
    });

    test('fromJson null 可选字段时使用默认值', () {
      final json = {
        'songid': 1,
        'songname': '测试',
        'hash': 'hash1',
        'author_name': '歌手A',
        'album_id': null,
        'album_name': null,
        'time_length': null,
        'singerinfo': null,
        'tags': null,
      };

      final info = SearchSongInfo.fromJson(json);

      expect(info.albumId, 0);
      expect(info.albumName, '');
      expect(info.timeLength, 0);
      expect(info.singerinfo, []);
      expect(info.tags, []);
    });

    test('toJson 序列化后可还原 (round-trip)', () {
      final json = {
        'songid': 12345678,
        'songname': '晴天',
        'hash': 'a1b2c3d4e5f6a1b2c3d4e5f6a1b2c3d4',
        'author_name': '周杰伦',
        'album_id': 87654,
        'album_name': '叶惠美',
        'time_length': 269,
        'publish_date': '2003-07-31',
        'sizable_cover': 'https://img.kugou.com/album/{size}/100.jpg',
        'file_size': 4300800,
        'singerinfo': [
          {'name': '周杰伦', 'is_publish': 1, 'id': 1234},
        ],
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
      };

      final info = SearchSongInfo.fromJson(json);

      // round-trip: jsonEncode → jsonDecode 确保嵌套对象正确序列化
      final toJsonResult = jsonDecode(jsonEncode(info.toJson())) as Map<String, dynamic>;
      final restored = SearchSongInfo.fromJson(toJsonResult);
      expect(restored.songid, info.songid);
      expect(restored.songname, info.songname);
      expect(restored.hash, info.hash);
      expect(restored.authorName, info.authorName);
      expect(restored.albumId, info.albumId);
      expect(restored.albumName, info.albumName);
      expect(restored.timeLength, info.timeLength);
      expect(restored.coverUrl, info.coverUrl);
      expect(restored.fileSize, info.fileSize);
      expect(restored.privilege, info.privilege);
    });

    group('便捷 getter', () {
      test('coverUrl150 替换 {size} 为 150', () {
        final json = {
          'songid': 1,
          'songname': '测试',
          'hash': 'hash1',
          'author_name': '歌手A',
          'sizable_cover': 'https://img.kugou.com/album/{size}/100.jpg',
        };
        final info = SearchSongInfo.fromJson(json);
        expect(info.coverUrl150, 'https://img.kugou.com/album/150/100.jpg');
      });

      test('coverUrl150 无 {size} 时原样返回', () {
        final json = {
          'songid': 1,
          'songname': '测试',
          'hash': 'hash1',
          'author_name': '歌手A',
          'sizable_cover': 'https://img.kugou.com/album/100.jpg',
        };
        final info = SearchSongInfo.fromJson(json);
        expect(info.coverUrl150, 'https://img.kugou.com/album/100.jpg');
      });

      test('durationLabel 格式化时长', () {
        final json = {
          'songid': 1,
          'songname': '测试',
          'hash': 'hash1',
          'author_name': '歌手A',
          'time_length': 269,
        };
        final info = SearchSongInfo.fromJson(json);
        expect(info.durationLabel, '4:29');
      });

      test('durationLabel 不足一分钟', () {
        final json = {
          'songid': 1,
          'songname': '测试',
          'hash': 'hash1',
          'author_name': '歌手A',
          'time_length': 45,
        };
        final info = SearchSongInfo.fromJson(json);
        expect(info.durationLabel, '0:45');
      });

      test('durationLabel 零秒', () {
        final json = {
          'songid': 1,
          'songname': '测试',
          'hash': 'hash1',
          'author_name': '歌手A',
          'time_length': 0,
        };
        final info = SearchSongInfo.fromJson(json);
        expect(info.durationLabel, '0:00');
      });

      test('singerNames 拼接歌手名', () {
        final json = {
          'songid': 1,
          'songname': '测试',
          'hash': 'hash1',
          'author_name': '周杰伦/方文山',
          'singerinfo': [
            {'name': '周杰伦', 'is_publish': 1, 'id': 1},
            {'name': '方文山', 'is_publish': 1, 'id': 2},
          ],
        };
        final info = SearchSongInfo.fromJson(json);
        expect(info.singerNames, '周杰伦、方文山');
      });

      test('singerNames 无歌手时返回空字符串', () {
        final json = {
          'songid': 1,
          'songname': '测试',
          'hash': 'hash1',
          'author_name': '未知',
        };
        final info = SearchSongInfo.fromJson(json);
        expect(info.singerNames, '');
      });
    });

    test('freezed 相等性判断', () {
      final json = {
        'songid': 1,
        'songname': '测试',
        'hash': 'hash1',
        'author_name': '歌手A',
      };

      final a = SearchSongInfo.fromJson(json);
      final b = SearchSongInfo.fromJson(json);
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('freezed copyWith', () {
      final json = {
        'songid': 1,
        'songname': '测试',
        'hash': 'hash1',
        'author_name': '歌手A',
        'time_length': 200,
      };
      final info = SearchSongInfo.fromJson(json);
      final copied = info.copyWith(songname: '新名称', timeLength: 300);

      expect(copied.songid, 1);
      expect(copied.songname, '新名称');
      expect(copied.timeLength, 300);
      expect(copied.authorName, '歌手A');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:ku_gou_music/models/search/search_special_info.dart';
import 'package:ku_gou_music/models/search/search_album_info.dart';
import 'package:ku_gou_music/models/search/search_author_info.dart';
import 'package:ku_gou_music/models/search/search_mv_info.dart';
import 'package:ku_gou_music/models/search/search_lyric_info.dart';

void main() {
  group('SearchSpecialInfo', () {
    test('fromJson 正常数据', () {
      final json = {
        'specialid': 12345,
        'specialname': '华语经典老歌',
        'singername': '各种歌手',
        'imgurl': 'https://img.kugou.com/special/100.jpg',
        'intro': '精选华语经典',
        'play_count': 50000,
        'collectcount': 1200,
        'global_collection_id': 'gc_12345',
        'nickname': '小编',
        'song_count': 100,
        'tag': '华语,经典',
        'publishtime': '2024-01-01',
      };

      final info = SearchSpecialInfo.fromJson(json);

      expect(info.specialId, 12345);
      expect(info.specialName, '华语经典老歌');
      expect(info.singerName, '各种歌手');
      expect(info.imgUrl, 'https://img.kugou.com/special/100.jpg');
      expect(info.intro, '精选华语经典');
      expect(info.playCount, 50000);
      expect(info.collectcount, 1200);
      expect(info.globalCollectionId, 'gc_12345');
      expect(info.nickname, '小编');
      expect(info.songCount, 100);
      expect(info.tag, '华语,经典');
      expect(info.publishtime, '2024-01-01');
    });

    test('fromJson IntFromStringConverter 兼容 String', () {
      final json = {
        'specialid': '12345',
        'play_count': '50000',
        'collectcount': '1200',
        'song_count': '100',
      };

      final info = SearchSpecialInfo.fromJson(json);

      expect(info.specialId, 12345);
      expect(info.playCount, 50000);
      expect(info.collectcount, 1200);
      expect(info.songCount, 100);
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchSpecialInfo.fromJson({});

      expect(info.specialId, 0);
      expect(info.specialName, '');
      expect(info.playCount, 0);
      expect(info.collectcount, 0);
    });

    test('toJson round-trip', () {
      final json = {
        'specialid': 12345,
        'specialname': '歌单A',
        'singername': '',
        'imgurl': '',
        'intro': '',
        'play_count': 100,
        'collectcount': 0,
        'global_collection_id': '',
        'nickname': '',
        'song_count': 10,
        'tag': '',
        'publishtime': '',
      };

      final info = SearchSpecialInfo.fromJson(json);
      final restored = SearchSpecialInfo.fromJson(info.toJson());

      expect(restored.specialId, 12345);
      expect(restored.specialName, '歌单A');
      expect(restored.playCount, 100);
    });
  });

  group('SearchAlbumInfo', () {
    test('fromJson 正常数据', () {
      final json = {
        'albumid': 56789,
        'albumname': '范特西',
        'singername': '周杰伦',
        'imgurl': 'https://img.kugou.com/album/200.jpg',
        'intro': '2001年专辑',
        'publish_date': '2001-09-14',
        'song_count': 10,
        'type': 1,
      };

      final info = SearchAlbumInfo.fromJson(json);

      expect(info.albumId, 56789);
      expect(info.albumName, '范特西');
      expect(info.singerName, '周杰伦');
      expect(info.publishDate, '2001-09-14');
      expect(info.songCount, 10);
      expect(info.type, 1);
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchAlbumInfo.fromJson({});

      expect(info.albumId, 0);
      expect(info.albumName, '');
      expect(info.songCount, 0);
    });
  });

  group('SearchAuthorInfo', () {
    test('fromJson 正常数据', () {
      final json = {
        'AuthorId': 3066,
        'AuthorName': '周杰伦',
        'Avatar': 'https://img.kugou.com/singer/3066.jpg',
        'AudioCount': 300,
        'AlbumCount': 30,
        'VideoCount': 50,
        'FansNum': 5000000,
        'IsSettledAuthor': 1,
        'Heat': 9999,
      };

      final info = SearchAuthorInfo.fromJson(json);

      expect(info.authorId, 3066);
      expect(info.authorName, '周杰伦');
      expect(info.avatar, 'https://img.kugou.com/singer/3066.jpg');
      expect(info.audioCount, 300);
      expect(info.albumCount, 30);
      expect(info.videoCount, 50);
      expect(info.fansNum, 5000000);
      expect(info.isSettledAuthor, 1);
      expect(info.heat, 9999);
    });

    test('fromJson IntFromStringConverter 兼容 String', () {
      final json = {
        'AuthorId': '3066',
        'AuthorName': '周杰伦',
        'AudioCount': '300',
        'FansNum': '5000000',
      };

      final info = SearchAuthorInfo.fromJson(json);

      expect(info.authorId, 3066);
      expect(info.audioCount, 300);
      expect(info.fansNum, 5000000);
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchAuthorInfo.fromJson({});

      expect(info.authorId, 0);
      expect(info.authorName, '');
      expect(info.audioCount, 0);
      expect(info.fansNum, 0);
    });
  });

  group('SearchMvInfo', () {
    test('fromJson 正常数据', () {
      final json = {
        'mvid': 78901,
        'mvname': '晴天MV',
        'singername': '周杰伦',
        'imgurl': 'https://img.kugou.com/mv/78901.jpg',
        'play_count': 1000000,
        'publish_date': '2003-08-01',
        'time_length': 280,
        'hash': 'mv_hash_abc',
        'songid': 12345678,
      };

      final info = SearchMvInfo.fromJson(json);

      expect(info.mvId, 78901);
      expect(info.mvName, '晴天MV');
      expect(info.singerName, '周杰伦');
      expect(info.playCount, 1000000);
      expect(info.publishDate, '2003-08-01');
      expect(info.timeLength, 280);
      expect(info.hash, 'mv_hash_abc');
      expect(info.songId, 12345678);
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchMvInfo.fromJson({});

      expect(info.mvId, 0);
      expect(info.mvName, '');
      expect(info.playCount, 0);
      expect(info.timeLength, 0);
    });
  });

  group('SearchLyricInfo', () {
    test('fromJson 正常数据', () {
      final json = {
        'id': 45678,
        'accesskey': 'AK_ABC123',
        'songname': '晴天',
        'singername': '周杰伦',
        'hash': 'lyric_hash_xyz',
        'duration': 269,
        'album_id': 87654,
        'album_audio_id': 99999,
      };

      final info = SearchLyricInfo.fromJson(json);

      expect(info.id, 45678);
      expect(info.accesskey, 'AK_ABC123');
      expect(info.songName, '晴天');
      expect(info.singerName, '周杰伦');
      expect(info.hash, 'lyric_hash_xyz');
      expect(info.duration, 269);
      expect(info.albumId, 87654);
      expect(info.albumAudioId, 99999);
    });

    test('fromJson IntFromStringConverter 兼容 String', () {
      final json = {
        'id': '45678',
        'duration': '269',
        'album_id': '87654',
      };

      final info = SearchLyricInfo.fromJson(json);

      expect(info.id, 45678);
      expect(info.duration, 269);
      expect(info.albumId, 87654);
    });

    test('fromJson 缺失可选字段使用默认值', () {
      final json = {'id': 1};

      final info = SearchLyricInfo.fromJson(json);

      expect(info.accesskey, '');
      expect(info.songName, '');
      expect(info.singerName, '');
      expect(info.hash, '');
      expect(info.duration, 0);
      expect(info.albumId, 0);
      expect(info.albumAudioId, 0);
    });
  });
}

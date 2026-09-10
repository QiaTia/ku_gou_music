import 'package:flutter_test/flutter_test.dart';
import 'package:ku_gou_music/models/search/search_special_info.dart';
import 'package:ku_gou_music/models/search/search_album_info.dart';
import 'package:ku_gou_music/models/search/search_author_info.dart';
import 'package:ku_gou_music/models/search/search_mv_info.dart';
import 'package:ku_gou_music/models/search/search_lyric_info.dart';

void main() {
  group('SearchSpecialInfo', () {
    test('fromJson 真实接口数据（/v1/search/special）', () {
      // 来自 complexsearch.kugou.com/v1/search/special 真实返回
      final json = {
        'specialid': 6409645,
        'specialname': '<em>周杰伦</em>必听热歌｜聆听周式金曲，聆听青春记忆',
        'song_count': 154,
        'img': 'http://imge.kugou.com/soft/collection/150/20260414/xxx.png',
        'intro': '',
        'publish_time': '2023-01-10 19:31:00',
        'collect_count': '0',
        'play_count': '189226',
        'total_play_count': '33328117',
        'nickname': '酷乐推荐',
        'suid': '2132029040',
        'gid': 'collection_3_2132029040_287_0',
        'egid': 'gcid_3z15kqlufz87z048',
        'isvip': 0,
        'isugc': 0,
        'ispublish': 1,
        'tag_str': '',
      };

      final info = SearchSpecialInfo.fromJson(json);

      expect(info.specialId, 6409645);
      expect(info.songCount, 154);
      expect(info.playCount, 189226);
      expect(info.collectCount, 0);
      expect(info.totalPlayCount, 33328117);
      expect(info.nickname, '酷乐推荐');
      expect(info.suid, '2132029040');
      expect(info.isVip, 0);
      expect(info.isUgc, 0);
      // 高亮标记清理
      expect(info.displaySpecialName, '周杰伦必听热歌｜聆听周式金曲，聆听青春记忆');
    });

    test('fromJson IntFromStringConverter 兼容 String', () {
      final info = SearchSpecialInfo.fromJson({
        'specialid': '12345',
        'song_count': '100',
        'play_count': '50000',
      });

      expect(info.specialId, 12345);
      expect(info.songCount, 100);
      expect(info.playCount, 50000);
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchSpecialInfo.fromJson({});

      expect(info.specialId, 0);
      expect(info.specialName, '');
      expect(info.playCount, 0);
      expect(info.songCount, 0);
    });
  });

  group('SearchAlbumInfo', () {
    test('fromJson 真实接口数据（/v1/search/album）', () {
      // 来自 complexsearch.kugou.com/v1/search/album 真实返回
      final json = {
        'albumid': 960399,
        'albumname': '魔<em>杰</em>座',
        'singer': '<em>周杰伦</em>',
        'singerid': '0',
        'img': 'http://imge.kugou.com/stdmusic/240/xxx.jpg',
        'intro': '',
        'company': '',
        'publish_time': '2008-10-15',
        'language': '华语',
        'songcount': 11,
        'collect_count': 0,
        'privilege': 0,
        'quality': 2,
        'singerids': [3520],
        'singers': [
          {'name': '<em>周杰伦</em>', 'id': 3520},
        ],
      };

      final info = SearchAlbumInfo.fromJson(json);

      expect(info.albumId, 960399);
      expect(info.songCount, 11);
      expect(info.publishTime, '2008-10-15');
      expect(info.language, '华语');
      expect(info.singerIds, [3520]);
      expect(info.singers, hasLength(1));
      // 高亮标记清理
      expect(info.displayAlbumName, '魔杰座');
      expect(info.displayArtistName, '周杰伦');
    });

    test('fromJson IntFromStringConverter 兼容 String', () {
      final info = SearchAlbumInfo.fromJson({
        'albumid': '56789',
        'songcount': '10',
      });

      expect(info.albumId, 56789);
      expect(info.songCount, 10);
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchAlbumInfo.fromJson({});

      expect(info.albumId, 0);
      expect(info.albumName, '');
      expect(info.songCount, 0);
      expect(info.singers, isEmpty);
    });
  });

  group('SearchAuthorInfo', () {
    test('fromJson 真实接口数据（/v1/search/author）', () {
      // 来自 complexsearch.kugou.com/v1/search/author 真实返回
      final json = {
        'AuthorId': 3520,
        'AuthorName': '<em>周杰伦</em>',
        'IsSettledAuthor': 0,
        'Avatar': 'http://singerimg.kugou.com/uploadpic/softhead/240/xxx.jpg',
        'Heat': 19459918,
        'AlbumCount': 49,
        'AudioCount': 1820,
        'VideoCount': 2823,
        'LyricistCount': 0,
        'ComposerCount': 0,
        'Identity': 1135,
        'FansNum': 25615021,
        'UserId': 0,
        'IsReal': 1,
        'FirstFrameImage': 'http://singerimg.kugou.com/uploadpic/softhead/{size}/xxx.jpg',
      };

      final info = SearchAuthorInfo.fromJson(json);

      expect(info.authorId, 3520);
      expect(info.audioCount, 1820);
      expect(info.albumCount, 49);
      expect(info.videoCount, 2823);
      expect(info.fansNum, 25615021);
      expect(info.heat, 19459918);
      expect(info.isReal, 1);
      // 高亮标记清理
      expect(info.displayAuthorName, '周杰伦');
    });

    test('fromJson IntFromStringConverter 兼容 String', () {
      final info = SearchAuthorInfo.fromJson({
        'AuthorId': '3066',
        'AudioCount': '300',
        'FansNum': '5000000',
      });

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
    test('fromJson 真实接口数据（/v1/search/mv）', () {
      // 来自 complexsearch.kugou.com/v1/search/mv 真实返回
      final json = {
        'MvID': 117613,
        'AudioID': '20505418',
        'EMvID': '2ir1f4',
        'FileName': '<em>周杰伦</em> - 晴天',
        'SingerName': '<em>周杰伦</em>',
        'MvName': '晴天',
        'MvHot': 4293,
        'MvHash': '3B1F32C55F9774501794213C09168A18',
        'Duration': 317,
        'PublishDate': '2003-07-31 00:00:00',
        'Pic': '20200620174316264397.jpg',
        'ErectPic': '20231208231353568089.jpg',
        'IsOfficial': 1,
        'IsUgc': 0,
        'HistoryHeat': 103196149,
        'MvHashMark': '1080P',
        'Privilege': 10,
        'MixSongID': '32100650',
        'AlbumID': '966846',
        'SingerID': [3520],
        'Singers': [
          {'name': '<em>周杰伦</em>', 'id': 3520},
        ],
        'ThumbGif': 'http://musiclibpicbssdl.cloud.kugou.com/xxx.gif',
      };

      final info = SearchMvInfo.fromJson(json);

      expect(info.mvId, 117613);
      expect(info.audioId, '20505418');
      expect(info.duration, 317);
      expect(info.mvHot, 4293);
      expect(info.historyHeat, 103196149);
      expect(info.isOfficial, 1);
      expect(info.isUgc, 0);
      expect(info.mvHashMark, '1080P');
      expect(info.singerId, [3520]);
      expect(info.singers, hasLength(1));
      // 封面拼接（含 {size} 占位符）
      expect(info.coverUrl, 'https://imge.kugou.com/mvpic/{size}/20200620174316264397.jpg');
      // 时长格式化与高亮清理
      expect(info.durationLabel, '5:17');
      expect(info.displayMvName, '晴天');
      expect(info.displaySingerName, '周杰伦');
    });

    test('coverUrl 无 Pic 时回退 ThumbGif', () {
      final info = SearchMvInfo.fromJson({
        'ThumbGif': 'http://musiclibpicbssdl.cloud.kugou.com/xxx.gif',
      });

      expect(info.coverUrl, 'http://musiclibpicbssdl.cloud.kugou.com/xxx.gif');
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchMvInfo.fromJson({});

      expect(info.mvId, 0);
      expect(info.mvName, '');
      expect(info.duration, 0);
      expect(info.coverUrl, '');
      expect(info.singers, isEmpty);
    });
  });

  group('SearchLyricInfo', () {
    test('fromJson 真实接口数据（/v1/search/lyric）', () {
      // 来自 complexsearch.kugou.com/v1/search/lyric 真实返回
      final json = {
        'TimeLength': 269,
        'OwnerCount': 3009405,
        'Lyric': '晴天 - 周杰伦 (Jay Chou)  词：周杰伦  曲：周杰伦',
        'ExtName': 'mp3',
        'BitRate': 128,
        'Quality': 2,
        'FileSize': 4317292,
        'FileName': '周杰伦 - 晴天',
        'SingerName': '周杰伦',
        'SingerID': [3520],
        'SongName': '晴天',
        'FileHash': 'B3A52A7A958BF0AED0EBFBA2E9A818B7',
        'LyricID': 32100650,
        'MvHash': '92B86DA2E11C3C84DE3A944ED12D97F1',
        'HasMv': false,
        'PublishAge': 255,
        'SQType': 0,
        'SQSize': 31633244,
        'SQHash': '0A69169202DE95AAF24A9944CCF0730D',
        '320Size': 10792943,
        '320Hash': '1B56126A8A03924F1DD066259C095CBC',
        'AlbumID': '966846',
        'Scid': 20505418,
        'MixSongID': 32100650,
        'Privilege': 10,
        'PayType': 3,
        'Image': 'http://imge.kugou.com/stdmusic/{size}/xxx.jpg',
        'Singers': [
          {'name': '周杰伦', 'id': 3520},
        ],
      };

      final info = SearchLyricInfo.fromJson(json);

      expect(info.lyricId, 32100650);
      expect(info.songName, '晴天');
      expect(info.singerName, '周杰伦');
      expect(info.fileHash, 'B3A52A7A958BF0AED0EBFBA2E9A818B7');
      expect(info.duration, 269);
      expect(info.bitRate, 128);
      expect(info.fileSize, 4317292);
      expect(info.hqHash, '1B56126A8A03924F1DD066259C095CBC');
      expect(info.sqHash, '0A69169202DE95AAF24A9944CCF0730D');
      expect(info.hasMv, false);
      expect(info.albumId, '966846');
      expect(info.mixSongId, 32100650);
      expect(info.durationLabel, '4:29');
      expect(info.displaySongName, '晴天');
    });

    test('fromJson IntFromStringConverter 兼容 String', () {
      final info = SearchLyricInfo.fromJson({
        'LyricID': '45678',
        'TimeLength': '269',
      });

      expect(info.lyricId, 45678);
      expect(info.duration, 269);
    });

    test('fromJson 缺失字段使用默认值', () {
      final info = SearchLyricInfo.fromJson({});

      expect(info.lyricId, 0);
      expect(info.songName, '');
      expect(info.duration, 0);
      expect(info.hasMv, false);
    });
  });
}

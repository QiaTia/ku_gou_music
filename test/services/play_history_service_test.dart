import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/services/play_history_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late PlayHistoryService service;

  setUpAll(() async {
    // 模拟 path_provider 平台通道
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async => '.',
    );
    await GetStorage.init();
  });

  setUp(() async {
    service = PlayHistoryService();
    await service.clearAll();
  });

  tearDown(() async {
    await service.clearAll();
  });

  group('PlayHistoryService - 歌曲记录', () {
    test('添加歌曲记录后应该能获取到', () async {
      final song = SongPlayHistory(
        id: '1',
        name: '晴天',
        cover: 'https://example.com/cover1.jpg',
        playTime: DateTime.now().millisecondsSinceEpoch,
        hash: 'hash1',
        author: '周杰伦',
        timelen: 269,
        privilege: 0,
        isSq: true,
        isHq: true,
        mvhash: 'mv1',
      );

      await service.addSong(song);
      final songs = service.getSongs();

      expect(songs.length, 1);
      expect(songs.first.id, '1');
      expect(songs.first.name, '晴天');
      expect(songs.first.author, '周杰伦');
      expect(songs.first.hash, 'hash1');
      expect(songs.first.isSq, true);
      expect(songs.first.isHq, true);
    });

    test('重复添加同一首歌应该移到最前面', () async {
      final song1 = SongPlayHistory(
        id: '1',
        name: '晴天',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '周杰伦',
      );
      final song2 = SongPlayHistory(
        id: '2',
        name: '七里香',
        cover: 'cover2.jpg',
        playTime: 2000,
        hash: 'hash2',
        author: '周杰伦',
      );

      await service.addSong(song1);
      await service.addSong(song2);
      // 再次添加song1，应该移到最前面
      await service.addSong(song1.copyWith(playTime: 3000));

      final songs = service.getSongs();
      expect(songs.length, 2);
      expect(songs.first.id, '1');
      expect(songs.last.id, '2');
    });

    test('删除指定歌曲记录', () async {
      final song1 = SongPlayHistory(
        id: '1',
        name: '晴天',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '周杰伦',
      );
      final song2 = SongPlayHistory(
        id: '2',
        name: '七里香',
        cover: 'cover2.jpg',
        playTime: 2000,
        hash: 'hash2',
        author: '周杰伦',
      );

      await service.addSong(song1);
      await service.addSong(song2);
      await service.removeSongs(['1']);

      final songs = service.getSongs();
      expect(songs.length, 1);
      expect(songs.first.id, '2');
    });

    test('清空所有歌曲记录', () async {
      final song = SongPlayHistory(
        id: '1',
        name: '晴天',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '周杰伦',
      );

      await service.addSong(song);
      await service.clearSongs();

      final songs = service.getSongs();
      expect(songs.isEmpty, true);
    });

    test('歌曲记录超过最大数量应该自动截断', () async {
      // 添加超过200条的记录
      for (int i = 0; i < 250; i++) {
        final song = SongPlayHistory(
          id: i.toString(),
          name: '歌曲$i',
          cover: 'cover$i.jpg',
          playTime: i,
          hash: 'hash$i',
          author: '歌手',
        );
        await service.addSong(song);
      }

      final songs = service.getSongs();
      expect(songs.length, lessThanOrEqualTo(PlayHistoryService.maxCacheCount));
    });
  });

  group('PlayHistoryService - 歌单记录', () {
    test('添加歌单记录后应该能获取到', () async {
      final playlist = PlaylistPlayHistory(
        id: 'pl1',
        name: '华语经典',
        cover: 'cover.jpg',
        playTime: DateTime.now().millisecondsSinceEpoch,
        nickname: '小编',
        playCount: 50000,
        songCount: 100,
        intro: '精选华语经典老歌',
      );

      await service.addPlaylist(playlist);
      final playlists = service.getPlaylists();

      expect(playlists.length, 1);
      expect(playlists.first.id, 'pl1');
      expect(playlists.first.name, '华语经典');
      expect(playlists.first.nickname, '小编');
      expect(playlists.first.songCount, 100);
    });

    test('重复添加同一歌单应该移到最前面', () async {
      final playlist1 = PlaylistPlayHistory(
        id: 'pl1',
        name: '华语经典',
        cover: 'cover1.jpg',
        playTime: 1000,
      );
      final playlist2 = PlaylistPlayHistory(
        id: 'pl2',
        name: '欧美流行',
        cover: 'cover2.jpg',
        playTime: 2000,
      );

      await service.addPlaylist(playlist1);
      await service.addPlaylist(playlist2);
      await service.addPlaylist(playlist1.copyWith(playTime: 3000));

      final playlists = service.getPlaylists();
      expect(playlists.length, 2);
      expect(playlists.first.id, 'pl1');
      expect(playlists.last.id, 'pl2');
    });
  });

  group('PlayHistoryService - 专辑记录', () {
    test('添加专辑记录后应该能获取到', () async {
      final album = AlbumPlayHistory(
        id: 'album1',
        name: '范特西',
        cover: 'cover.jpg',
        playTime: DateTime.now().millisecondsSinceEpoch,
        singerName: '周杰伦',
        publishTime: '2001-09-14',
        songCount: 10,
        intro: '经典专辑',
      );

      await service.addAlbum(album);
      final albums = service.getAlbums();

      expect(albums.length, 1);
      expect(albums.first.id, 'album1');
      expect(albums.first.name, '范特西');
      expect(albums.first.singerName, '周杰伦');
      expect(albums.first.songCount, 10);
    });

    test('删除专辑记录', () async {
      final album = AlbumPlayHistory(
        id: 'album1',
        name: '范特西',
        cover: 'cover.jpg',
        playTime: 1000,
      );

      await service.addAlbum(album);
      await service.removeAlbums(['album1']);

      final albums = service.getAlbums();
      expect(albums.isEmpty, true);
    });
  });

  group('PlayHistoryService - 通用方法', () {
    test('totalCount 应该返回所有类型记录总数', () async {
      final song = SongPlayHistory(
        id: '1',
        name: '晴天',
        cover: 'cover.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '周杰伦',
      );
      final playlist = PlaylistPlayHistory(
        id: 'pl1',
        name: '华语经典',
        cover: 'cover.jpg',
        playTime: 2000,
      );
      final album = AlbumPlayHistory(
        id: 'album1',
        name: '范特西',
        cover: 'cover.jpg',
        playTime: 3000,
      );

      await service.addSong(song);
      await service.addPlaylist(playlist);
      await service.addAlbum(album);

      expect(service.totalCount, 3);
    });

    test('clearAll 应该清空所有记录', () async {
      final song = SongPlayHistory(
        id: '1',
        name: '晴天',
        cover: 'cover.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '周杰伦',
      );
      final playlist = PlaylistPlayHistory(
        id: 'pl1',
        name: '华语经典',
        cover: 'cover.jpg',
        playTime: 2000,
      );

      await service.addSong(song);
      await service.addPlaylist(playlist);
      await service.clearAll();

      expect(service.getSongs().isEmpty, true);
      expect(service.getPlaylists().isEmpty, true);
      expect(service.getAlbums().isEmpty, true);
      expect(service.totalCount, 0);
    });
  });

  group('数据序列化与反序列化', () {
    test('SongPlayHistory JSON round-trip', () {
      final original = SongPlayHistory(
        id: '1',
        name: '晴天',
        cover: 'cover.jpg',
        playTime: 1234567890,
        hash: 'hash1',
        author: '周杰伦',
        timelen: 269,
        privilege: 1,
        isSq: true,
        isHq: false,
        mvhash: 'mv1',
      );

      final json = original.toJson();
      final restored = SongPlayHistory.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.cover, original.cover);
      expect(restored.playTime, original.playTime);
      expect(restored.hash, original.hash);
      expect(restored.author, original.author);
      expect(restored.timelen, original.timelen);
      expect(restored.privilege, original.privilege);
      expect(restored.isSq, original.isSq);
      expect(restored.isHq, original.isHq);
      expect(restored.mvhash, original.mvhash);
    });

    test('PlaylistPlayHistory JSON round-trip', () {
      final original = PlaylistPlayHistory(
        id: 'pl1',
        name: '华语经典',
        cover: 'cover.jpg',
        playTime: 1234567890,
        nickname: '小编',
        playCount: 50000,
        songCount: 100,
        intro: '精选',
      );

      final json = original.toJson();
      final restored = PlaylistPlayHistory.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.nickname, original.nickname);
      expect(restored.playCount, original.playCount);
      expect(restored.songCount, original.songCount);
      expect(restored.intro, original.intro);
    });

    test('AlbumPlayHistory JSON round-trip', () {
      final original = AlbumPlayHistory(
        id: 'album1',
        name: '范特西',
        cover: 'cover.jpg',
        playTime: 1234567890,
        singerName: '周杰伦',
        publishTime: '2001-09-14',
        songCount: 10,
        intro: '经典',
      );

      final json = original.toJson();
      final restored = AlbumPlayHistory.fromJson(json);

      expect(restored.id, original.id);
      expect(restored.name, original.name);
      expect(restored.singerName, original.singerName);
      expect(restored.publishTime, original.publishTime);
      expect(restored.songCount, original.songCount);
    });
  });
}

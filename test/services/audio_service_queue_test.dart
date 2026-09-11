import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/services/audio_service.dart';
import 'package:ku_gou_music/services/song_cache_service.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';

/// 构造一首测试用歌曲（无需真实音频资源）
SongItemStruct _song(String hash) => SongItemStruct(
      hash: hash,
      audio_id: 1,
      timelen: 200000,
      mvhash: '',
      origin_name: 'TestArtist - TestSong',
      privilege: 0,
      author: 'TestArtist',
      is_hq: false,
      name: 'TestSong',
      is_sq: false,
      cover: '',
    );

/// 覆盖「点击单曲 → 加入播放列表并切歌」的队列行为。
///
/// 说明：测试环境无法获取真实播放地址，故只断言队列（songList / playlist）
/// 的入队、去重与索引对齐；是否真正播放由 playSongAtIndex 的返回值表达。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AudioService audioService;

  setUpAll(() async {
    // 独立临时目录，避免与其他测试文件争用 GetStorage.gs 文件锁
    final tempDir = await Directory.systemTemp.createTemp('kgm_audio_test_');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async => tempDir.path,
    );
    try {
      await GetStorage.init();
    } catch (_) {
      // 已初始化，忽略
    }
  });

  setUp(() {
    // 依赖注册顺序：SongCacheService -> AudioService
    if (!Get.isRegistered<SongCacheService>()) Get.put(SongCacheService());
    if (!Get.isRegistered<AudioService>()) Get.put(AudioService());
    audioService = Get.find<AudioService>();
    audioService.songList.clear();
    audioService.playlist.clear();
  });

  group('AudioService.addAndPlay', () {
    test('新歌追加到队尾，且 songList 与 playlist 等长', () async {
      await audioService.addAndPlay(_song('h1'));

      expect(audioService.songList.length, 1);
      expect(audioService.songList.first.hash, 'h1');
      expect(audioService.playlist.length, audioService.songList.length);
    });

    test('重复点击同一首歌不会重复入队', () async {
      await audioService.addAndPlay(_song('h1'));
      await audioService.addAndPlay(_song('h1'));

      expect(audioService.songList.length, 1);
      expect(audioService.playlist.length, 1);
    });

    test('连续点击不同歌曲按点击顺序追加', () async {
      await audioService.addAndPlay(_song('h1'));
      await audioService.addAndPlay(_song('h2'));

      expect(
        audioService.songList.map((s) => s.hash).toList(),
        ['h1', 'h2'],
      );
      expect(audioService.playlist.length, 2);
    });

    test('资源不可用时返回 false（而非抛异常）', () async {
      final ok = await audioService.addAndPlay(_song('h1'));
      expect(ok, isFalse);
    });
  });

  group('AudioService.addToQueue', () {
    test('追加歌曲并保持索引对齐', () async {
      await audioService.addToQueue(_song('h1'));
      await audioService.addToQueue(_song('h2'));

      expect(audioService.songList.length, 2);
      expect(audioService.playlist.length, 2);
    });

    test('按 hash 去重', () async {
      await audioService.addToQueue(_song('h1'));
      await audioService.addToQueue(_song('h1'));

      expect(audioService.songList.length, 1);
      expect(audioService.playlist.length, 1);
    });
  });
}

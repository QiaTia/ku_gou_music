import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/services/audio_service.dart';
import 'package:ku_gou_music/services/song_cache_service.dart';
import 'package:ku_gou_music/services/play_history_service.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late RecentlyController controller;

  setUpAll(() async {
    // 模拟 path_provider 平台通道，使用独立临时目录避免并行测试争用同一 GetStorage.gs 文件锁
    final tempDir = await Directory.systemTemp.createTemp('kgm_test_');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async => tempDir.path,
    );
    try {
      await GetStorage.init();
    } catch (_) {
      // 已经初始化过了，忽略
    }
  });

  setUp(() async {
    final service = PlayHistoryService();
    await service.clearAll();

    // 注册依赖（顺序：SongCacheService -> AudioService -> MusicController）
    if (!Get.isRegistered<SongCacheService>()) {
      Get.put(SongCacheService());
    }
    if (!Get.isRegistered<MusicController>()) {
      Get.put(AudioService());
      Get.put(MusicController());
    }

    controller = RecentlyController();
    Get.put(controller);
  });

  tearDown(() async {
    Get.delete<RecentlyController>();
    final service = PlayHistoryService();
    await service.clearAll();
  });

  group('RecentlyController - 初始化', () {
    test('初始状态验证', () {
      expect(controller.currentTab.value, 0);
      expect(controller.isEditing.value, false);
      expect(controller.selectedIds.isEmpty, true);
      expect(controller.tabTitles, ['歌曲', '歌单', '专辑']);
    });

    test('loadHistory 应该加载播放记录', () {
      controller.loadHistory();
      expect(controller.songHistory, isNotNull);
      expect(controller.playlistHistory, isNotNull);
      expect(controller.albumHistory, isNotNull);
    });
  });

  group('RecentlyController - Tab切换', () {
    test('switchTab 应该切换当前Tab', () {
      controller.switchTab(1);
      expect(controller.currentTab.value, 1);

      controller.switchTab(2);
      expect(controller.currentTab.value, 2);
    });

    test('切换到相同Tab应该无效', () {
      controller.switchTab(0);
      expect(controller.currentTab.value, 0);
    });

    test('切换Tab时应该退出编辑模式', () {
      controller.enterEditMode();
      expect(controller.isEditing.value, true);

      controller.switchTab(1);
      expect(controller.isEditing.value, false);
    });
  });

  group('RecentlyController - 编辑模式', () {
    test('进入编辑模式', () {
      controller.enterEditMode();
      expect(controller.isEditing.value, true);
      expect(controller.selectedIds.isEmpty, true);
    });

    test('退出编辑模式', () {
      controller.enterEditMode();
      controller.selectedIds.add('test-id');

      controller.exitEditMode();
      expect(controller.isEditing.value, false);
      expect(controller.selectedIds.isEmpty, true);
    });

    test('toggleEditMode 应该切换编辑状态', () {
      controller.toggleEditMode();
      expect(controller.isEditing.value, true);

      controller.toggleEditMode();
      expect(controller.isEditing.value, false);
    });
  });

  group('RecentlyController - 选中操作', () {
    test('toggleSelect 应该添加选中项', () {
      controller.toggleSelect('id1');
      expect(controller.selectedIds.contains('id1'), true);
    });

    test('toggleSelect 应该取消已选中项', () {
      controller.toggleSelect('id1');
      controller.toggleSelect('id1');
      expect(controller.selectedIds.contains('id1'), false);
    });

    test('selectAll 应该选中所有歌曲', () async {
      // 先添加一些歌曲
      final service = PlayHistoryService();
      await service.addSong(SongPlayHistory(
        id: '1',
        name: '歌曲1',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '歌手1',
      ));
      await service.addSong(SongPlayHistory(
        id: '2',
        name: '歌曲2',
        cover: 'cover2.jpg',
        playTime: 2000,
        hash: 'hash2',
        author: '歌手2',
      ));

      controller.loadHistory();
      controller.selectAll();

      expect(controller.selectedIds.length, 2);
      expect(controller.selectedIds.contains('1'), true);
      expect(controller.selectedIds.contains('2'), true);
    });

    test('deselectAll 应该清空选中项', () {
      controller.selectedIds.addAll(['id1', 'id2', 'id3']);
      controller.deselectAll();
      expect(controller.selectedIds.isEmpty, true);
    });

    test('isAllSelected 应该正确判断', () async {
      final service = PlayHistoryService();
      await service.addSong(SongPlayHistory(
        id: '1',
        name: '歌曲1',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '歌手1',
      ));

      controller.loadHistory();
      expect(controller.isAllSelected, false);

      controller.selectAll();
      expect(controller.isAllSelected, true);
    });
  });

  group('RecentlyController - 删除操作', () {
    test('deleteSelected 应该删除选中的歌曲', () async {
      final service = PlayHistoryService();
      await service.addSong(SongPlayHistory(
        id: '1',
        name: '歌曲1',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '歌手1',
      ));
      await service.addSong(SongPlayHistory(
        id: '2',
        name: '歌曲2',
        cover: 'cover2.jpg',
        playTime: 2000,
        hash: 'hash2',
        author: '歌手2',
      ));

      controller.loadHistory();
      controller.selectedIds.add('1');
      await controller.deleteSelected();

      expect(controller.songHistory.length, 1);
      expect(controller.songHistory.first.id, '2');
      expect(controller.selectedIds.isEmpty, true);
    });

    test('clearCurrentTab 应该清空当前Tab的所有记录', () async {
      final service = PlayHistoryService();
      await service.addSong(SongPlayHistory(
        id: '1',
        name: '歌曲1',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '歌手1',
      ));

      controller.loadHistory();
      expect(controller.songHistory.isNotEmpty, true);

      await controller.clearCurrentTab();
      expect(controller.songHistory.isEmpty, true);
    });
  });

  group('RecentlyController - 播放操作', () {
    test('playSong 应该将歌曲移到最前面', () async {
      final service = PlayHistoryService();
      await service.addSong(SongPlayHistory(
        id: '1',
        name: '歌曲1',
        cover: 'cover1.jpg',
        playTime: 1000,
        hash: 'hash1',
        author: '歌手1',
      ));
      await service.addSong(SongPlayHistory(
        id: '2',
        name: '歌曲2',
        cover: 'cover2.jpg',
        playTime: 2000,
        hash: 'hash2',
        author: '歌手2',
      ));

      controller.loadHistory();
      // 初始顺序: 2, 1
      expect(controller.songHistory.first.id, '2');

      // 播放歌曲1，应该移到最前面
      await controller.playSong(controller.songHistory.last);

      // 顺序应该变为: 1, 2
      expect(controller.songHistory.first.id, '1');
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/services/audio_service.dart';
import 'package:ku_gou_music/services/play_history_service.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.controller.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late RecentlyController controller;

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
    // 注册依赖
    if (!Get.isRegistered<AudioService>()) {
      Get.put(AudioService());
    }
    if (!Get.isRegistered<MusicController>()) {
      Get.put(MusicController());
    }
    if (!Get.isRegistered<LocalRouterController>()) {
      Get.put(LocalRouterController(
        initialRoute: '/',
        routes: {'/': (context) => const SizedBox.shrink()},
      ));
    }

    final service = PlayHistoryService();
    await service.clearAll();

    controller = RecentlyController();
    Get.put(controller);
  });

  tearDown(() async {
    Get.delete<RecentlyController>();
    final service = PlayHistoryService();
    await service.clearAll();
  });

  group('RecentlyPage Widget Tests', () {
    testWidgets('页面应该显示Tab栏', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 验证Tab文字存在
      expect(find.text('歌曲'), findsOneWidget);
      expect(find.text('歌单'), findsOneWidget);
      expect(find.text('专辑'), findsOneWidget);
    });

    testWidgets('空状态应该显示提示文字', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 验证空状态提示
      expect(find.text('暂无最近播放的歌曲'), findsOneWidget);
    });

    testWidgets('点击Tab应该切换内容', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 点击"歌单"Tab
      await tester.tap(find.text('歌单'));
      await tester.pumpAndSettle();

      // 验证切换到歌单Tab
      expect(find.text('暂无最近播放的歌单'), findsOneWidget);

      // 点击"专辑"Tab
      await tester.tap(find.text('专辑'));
      await tester.pumpAndSettle();

      // 验证切换到专辑Tab
      expect(find.text('暂无最近播放的专辑'), findsOneWidget);
    });

    testWidgets('点击编辑按钮应该进入编辑模式', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 点击编辑按钮
      final editButton = find.byIcon(Icons.edit_outlined);
      expect(editButton, findsOneWidget);

      await tester.tap(editButton);
      await tester.pumpAndSettle();

      // 验证进入编辑模式（应该显示"完成"按钮）
      expect(find.text('完成'), findsOneWidget);
    });

    testWidgets('编辑模式下应该显示全选按钮', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 进入编辑模式
      await tester.tap(find.byIcon(Icons.edit_outlined));
      await tester.pumpAndSettle();

      // 验证全选按钮存在
      expect(find.text('全选'), findsOneWidget);
    });

    testWidgets('有歌曲时应该显示歌曲列表', (WidgetTester tester) async {
      // 添加测试数据
      final service = PlayHistoryService();
      await service.addSong(SongPlayHistory(
        id: '1',
        name: '测试歌曲',
        cover: 'cover.jpg',
        playTime: DateTime.now().millisecondsSinceEpoch,
        hash: 'hash1',
        author: '测试歌手',
      ));
      controller.loadHistory();

      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 验证歌曲名称显示
      expect(find.text('测试歌曲'), findsOneWidget);
      expect(find.text('测试歌手'), findsOneWidget);
    });

    testWidgets('有歌单时应该显示歌单列表', (WidgetTester tester) async {
      // 添加测试数据
      final service = PlayHistoryService();
      await service.addPlaylist(PlaylistPlayHistory(
        id: 'pl1',
        name: '测试歌单',
        cover: 'cover.jpg',
        playTime: DateTime.now().millisecondsSinceEpoch,
        nickname: '测试用户',
        songCount: 10,
      ));
      controller.loadHistory();

      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 切换到歌单Tab
      await tester.tap(find.text('歌单'));
      await tester.pumpAndSettle();

      // 验证歌单信息显示
      expect(find.text('测试歌单'), findsOneWidget);
      expect(find.text('by 测试用户'), findsOneWidget);
    });

    testWidgets('有专辑时应该显示专辑列表', (WidgetTester tester) async {
      // 添加测试数据
      final service = PlayHistoryService();
      await service.addAlbum(AlbumPlayHistory(
        id: 'album1',
        name: '测试专辑',
        cover: 'cover.jpg',
        playTime: DateTime.now().millisecondsSinceEpoch,
        singerName: '测试歌手',
        songCount: 12,
      ));
      controller.loadHistory();

      await tester.pumpWidget(
        const GetMaterialApp(
          home: RecentlyPage(),
        ),
      );
      await tester.pumpAndSettle();

      // 切换到专辑Tab
      await tester.tap(find.text('专辑'));
      await tester.pumpAndSettle();

      // 验证专辑信息显示
      expect(find.text('测试专辑'), findsOneWidget);
      expect(find.text('测试歌手'), findsOneWidget);
    });
  });
}

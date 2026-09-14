import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/services/audio_service.dart';
import 'package:ku_gou_music/services/play_history_service.dart';
import 'package:ku_gou_music/services/song_cache_service.dart';
import 'package:ku_gou_music/views/home/mobile/widgets/liquid_glass_bottom_bar.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.controller.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

/// 移动端「最近播放」Tab 的窄屏适配回归测试
///
/// 关注两件事：
/// 1. 底部 TabBar 从 3 项变成 4 项后，在 320/360/412 等窄屏下不产生 RenderFlex 溢出；
/// 2. RecentlyPage 在窄屏场景下，Tab 栏与列表不溢出。
///
/// 注意：底部 TabBar 内含 [RotatingAlbumCover]，它是 `..repeat()` 无限动画，
/// 因此这里一律用定次 `pump()`，绝不能用 `pumpAndSettle()`（会永不返回）。
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late RecentlyController controller;

  setUpAll(() async {
    // 独立临时目录，避免并行测试争用同一 GetStorage.gs 文件锁
    final tempDir = await Directory.systemTemp.createTemp('kgm_mobile_test_');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/path_provider'),
      (MethodCall methodCall) async => tempDir.path,
    );
    await GetStorage.init();
  });

  setUp(() async {
    if (!Get.isRegistered<SongCacheService>()) {
      Get.put(SongCacheService());
    }
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

    await PlayHistoryService().clearAll();

    controller = RecentlyController();
    Get.put(controller);
  });

  tearDown(() async {
    Get.delete<RecentlyController>();
    await PlayHistoryService().clearAll();
  });

  /// 捕获当前用例期间产生的溢出异常文本
  final overflowMessages = <String>[];

  void installErrorTrap() {
    overflowMessages.clear();
    final original = FlutterError.onError;
    FlutterError.onError = (details) {
      overflowMessages.add(details.exception.toString());
      original?.call(details);
    };
    addTearDown(() => FlutterError.onError = original);
  }

  bool hasOverflow() =>
      overflowMessages.any((m) => m.contains('overflowed'));

  group('LiquidGlassBottomBar 窄屏适配', () {
    for (final width in <double>[320, 360, 412]) {
      testWidgets('宽度 ${width.toInt()}px 下 4 项 TabBar 不溢出', (tester) async {
        tester.view.physicalSize = Size(width, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        installErrorTrap();

        await tester.pumpWidget(
          GetMaterialApp(
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: width,
                  child: LiquidGlassBottomBar(
                    currentIndex: 2,
                    musicController: Get.find<MusicController>(),
                    onTap: (_) {},
                  ),
                ),
              ),
            ),
          ),
        );
        // 无限旋转动画存在 → 用定次 pump
        await tester.pump(const Duration(milliseconds: 300));

        expect(find.text('最近播放'), findsOneWidget);
        expect(
          hasOverflow(),
          isFalse,
          reason: '宽度 ${width.toInt()}px 下底栏出现溢出: $overflowMessages',
        );
      });
    }

    testWidgets('4 个 Tab 全部可见', (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: Center(
              child: LiquidGlassBottomBar(
                currentIndex: 0,
                musicController: Get.find<MusicController>(),
                onTap: (_) {},
              ),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('首页'), findsOneWidget);
      expect(find.text('发现'), findsOneWidget);
      expect(find.text('最近播放'), findsOneWidget);
      expect(find.text('我的'), findsOneWidget);
    });
  });

  group('RecentlyPage 窄屏适配', () {
    testWidgets('360px 窄屏下 Tab 栏与列表不溢出', (tester) async {
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      installErrorTrap();

      await tester.pumpWidget(
        const GetMaterialApp(home: RecentlyPage()),
      );
      await tester.pumpAndSettle();

      expect(find.text('歌曲'), findsOneWidget);
      expect(
        hasOverflow(),
        isFalse,
        reason: '窄屏下 RecentlyPage 出现溢出: $overflowMessages',
      );
    });

    testWidgets('宽屏下最近播放页面正常渲染（PC 回归）', (tester) async {
      tester.view.physicalSize = const Size(1280, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      installErrorTrap();

      await tester.pumpWidget(
        const GetMaterialApp(home: RecentlyPage()),
      );
      await tester.pumpAndSettle();

      expect(find.text('最近播放'), findsOneWidget);
      expect(hasOverflow(), isFalse);
    });
  });
}

// integration_test/app_flow_test.dart
//
// 酷狗音乐客户端「端到端集成测试」示例。
//
// 运行方式（需连接 Android 模拟器 / iOS 模拟器 / 真机，集成测试跑在真实设备上）：
//   flutter pub get
//   flutter test integration_test/app_flow_test.dart
//
// 说明：
//  - 直接 pump `MyApp()`（而非调用 `main()`），从而跳过 `JustAudioBackground.init()`，
//    同时仍能覆盖真实页面与真实 GetX 依赖注入。
//  - 通过 `path_provider` 平台通道 mock 到独立临时目录，避免多实例争用 GetStorage。
//  - 强制 1280x800 桌面尺寸，使 `MyApp` 走 PC 布局（带侧边栏的 `HomePage`）。
//  - 搜索接口被 `MockHttpClientAdapter` 拦截，返回本地构造数据，流程稳定可重复。
//  - 播放控制使用「静音 WAV data URI」占位音源，无需真实音频即可驱动 play/pause/next。

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:integration_test/integration_test.dart';

import 'package:ku_gou_music/api/request/request.dart' show dio;
import 'package:ku_gou_music/main.dart' show MyApp;
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/services/song_cache_service.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/home/pc/home/home.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'package:ku_gou_music/views/home/pc/plaza/plaza.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.dart';
import 'package:ku_gou_music/views/login/login_page.dart';
import 'package:ku_gou_music/views/my/my.dart';
import 'package:ku_gou_music/views/music/player_screen.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';
import 'package:ku_gou_music/views/search/search.dart';
import 'mock/search_mock_adapter.dart';

const _pathProviderChannel = MethodChannel('plugins.flutter.io/path_provider');

late Directory _tempDir;

/// 每个测试用例前的统一装配：reset 依赖 -> 重新初始化存储/缓存 -> 启动 App。
Future<void> pumpApp(WidgetTester tester) async {
  Get.reset();
  await GetStorage.init();
  userInstance.init();
  await Get.putAsync<SongCacheService>(() => SongCacheService().init());

  // 桌面尺寸 -> PC 布局（带侧边栏）
  await tester.binding.setSurfaceSize(const Size(1280, 800));

  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // path_provider 通道 mock 到独立临时目录（在真实设备上也能写，且不与其他测试争用）
    _tempDir = await Directory.systemTemp.createTemp('kgm_it_');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_pathProviderChannel, (call) async {
      switch (call.method) {
        case 'getApplicationDocumentsDirectory':
        case 'getTemporaryDirectory':
        case 'getApplicationSupportDirectory':
          return _tempDir.path;
        case 'getExternalStorageDirectory':
          return _tempDir.path;
        default:
          return null;
      }
    });

    await GetStorage.init();
    userInstance.init();
    await Get.putAsync<SongCacheService>(() => SongCacheService().init());

    // 拦截搜索接口，其余请求走真实网络
    dio.httpClientAdapter = MockHttpClientAdapter();
  });

  group('1. 启动 & 侧边栏', () {
    testWidgets('启动后展示侧边栏菜单与默认首页', (tester) async {
      await pumpApp(tester);

      // 侧边栏品牌与菜单
      expect(find.text('Music'), findsWidgets);
      expect(find.text('首页'), findsOneWidget);
      expect(find.text('广场'), findsOneWidget);
      expect(find.text('排行榜'), findsOneWidget);
      expect(find.text('最近播放'), findsOneWidget);
      expect(find.text('我的'), findsOneWidget);

      // 默认进入首页，且静态标题已渲染（不依赖网络）
      expect(find.byType(HomeTopPage), findsOneWidget);
      expect(find.text('推荐歌曲'), findsOneWidget);
      expect(find.text('推荐歌单'), findsOneWidget);
    });
  });

  group('2. 侧边栏导航', () {
    testWidgets('点击各菜单可切换到对应页面', (tester) async {
      await pumpApp(tester);

      await tester.tap(find.text('排行榜'));
      await tester.pumpAndSettle();
      expect(find.byType(RankingPage), findsOneWidget);

      await tester.tap(find.text('最近播放'));
      await tester.pumpAndSettle();
      expect(find.byType(RecentlyPage), findsOneWidget);

      await tester.tap(find.text('广场'));
      await tester.pumpAndSettle();
      expect(find.byType(PlazaPage), findsOneWidget);

      // 默认存在 token，进入「我的」页而非登录页
      await tester.tap(find.text('我的'));
      await tester.pumpAndSettle();
      expect(find.byType(MyScreen), findsOneWidget);

      // 回到首页
      await tester.tap(find.text('首页'));
      await tester.pumpAndSettle();
      expect(find.byType(HomeTopPage), findsOneWidget);
    });
  });

  group('3. 登录流程', () {
    testWidgets('未登录点击「我的」跳转登录页并可切换登录方式', (tester) async {
      await pumpApp(tester);

      // 清掉默认 token，模拟未登录状态
      userInstance.clearUser();
      await tester.pumpAndSettle();

      await tester.tap(find.text('我的'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.text('KuGou Music'), findsOneWidget);

      // 两种登录方式 Tab 均存在
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('QR Code'), findsOneWidget);

      // 切换到二维码登录，再切回密码登录，页面不崩溃
      await tester.tap(find.text('QR Code'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Password'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
    });
  });

  group('4. 搜索流程（已 Mock）', () {
    testWidgets('首页搜索框输入关键词进入搜索结果页并展示 Mock 结果',
        (tester) async {
      await pumpApp(tester);

      // 首页顶栏的搜索框
      final field = find.descendant(
        of: find.byType(TitleSearchField),
        matching: find.byType(TextField),
      );
      expect(field, findsOneWidget);

      await tester.enterText(field, 'love');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // 已进入搜索页
      expect(find.byType(SearchPage), findsOneWidget);

      // Mock 返回的「综合」结果
      expect(find.text('Test Song'), findsOneWidget);
      expect(find.text('Test Playlist'), findsOneWidget);
      expect(find.text('Test Author'), findsOneWidget);

      // 搜索页分类 Tab 存在，点击单曲 Tab 不崩溃（该 Tab 走真实网络）
      expect(find.text('单曲'), findsOneWidget);
      await tester.tap(find.text('单曲'));
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsOneWidget);
    });
  });

  group('5. 播放控制', () {
    testWidgets('底部控制条可切换播放/暂停并打开播放页', (tester) async {
      await pumpApp(tester);

      // 预载入一首假歌（占位为静音 data URI，离线可播放，不会触发真实音频请求）
      final music = Get.find<MusicController>();
      await music.loadPlaylistMusic([
        SongItemStruct(
          hash: 'h_test',
          audio_id: 1,
          timelen: 200,
          mvhash: '',
          origin_name: 'Test Artist - Fake Song',
          privilege: 0,
          author: 'Test Artist',
          is_hq: false,
          name: 'Fake Song',
          is_sq: false,
          cover: '',
        ),
      ]);
      await tester.pumpAndSettle();

      // 底部控制条显示了当前歌曲
      expect(find.text('Fake Song'), findsOneWidget);

      // 播放 / 暂停
      final playBtn = find.byTooltip('播放 / 暂停');
      expect(playBtn, findsOneWidget);
      await tester.tap(playBtn);
      await tester.pumpAndSettle();

      // 下一曲 / 上一曲
      await tester.tap(find.byTooltip('下一曲'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('上一曲'));
      await tester.pumpAndSettle();

      // 切换循环模式（初始为「随机播放」）
      await tester.tap(find.byTooltip('随机播放'));
      await tester.pumpAndSettle();

      // 点击当前歌曲打开播放页
      await tester.tap(find.text('Fake Song'));
      await tester.pumpAndSettle();
      expect(find.byType(MusicPlayerScreen), findsOneWidget);
    });
  });
}

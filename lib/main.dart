import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/api/login/register_dev.dart';
import 'package:ku_gou_music/config/config.dart';
import 'package:ku_gou_music/controllers/settings_controller.dart';
import 'package:ku_gou_music/views/artist/artist.dart';
import 'package:ku_gou_music/views/home/mobile/layout.dart';
import 'package:ku_gou_music/views/mv/mv.dart';
import 'package:ku_gou_music/views/playlist/playlist.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';
import 'package:layout/layout.dart';
import 'bindings/music_binding.dart';
import 'i18n/app_translations.dart';
import 'services/window_service.dart';
import 'views/music/player_screen.dart';
import 'views/music/playlist_screen.dart';
import 'views/home/pc/layout/layout.dart';
import 'views/login/login_page.dart';
import 'store/user.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'services/song_cache_service.dart';

class DesktopScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

void main() async {

  // video_player 官方插件不支持 Windows 桌面，接入 media_kit 后端
  // （必须在使用 VideoPlayerController 之前初始化）
  VideoPlayerMediaKit.ensureInitialized(
    android: true,
    iOS: true,
    macOS: true,
    windows: true,
    linux: true,
  );

  // 1. 初始化后台播放 (必须在 runApp 之前)
  await JustAudioBackground.init(
    androidNotificationChannelId: 'cn.tia.ku_gou_music.channel.audio',
    androidNotificationChannelName: 'Music Playback',
    androidNotificationOngoing: true, // 通知栏是否常驻
    androidStopForegroundOnPause: true, // 暂停时是否停止前台服务(省电)
    // 可选：预加载下一首
    preloadArtwork: false,
    // 可选：通知栏图标 (Android 必须提供一个单色图标，否则可能崩溃或不显示)
    // androidNotificationIcon: 'mipmap/ic_launcher',
  );

  await GetStorage.init();
  await GetStorage.init(SettingsController.boxName);

  // 注册翻译（托盘菜单在 runApp 前构建也需要 .tr）
  // JSON 词典覆盖基础词典；zh_CN 无词典，key 即中文原文
  Get.addTranslations(await loadAppTranslations());

  // 语言设置：空值跟随系统语言
  final settingsBox = GetStorage(SettingsController.boxName);
  final appLocale = SettingsController.localeFromLanguage(
    settingsBox.read<String>('language') ?? '',
  );

  // 桌面窗口与托盘（原生标题栏/最小化到托盘/托盘菜单）
  // SettingsController 需先注册（WindowService 内监听设置变化）
  Get.put(SettingsController());
  await WindowService.instance.init(
    nativeTitleBar:
        (settingsBox.read<String>('nativeTitleBar') ?? 'off') == 'on',
    minimizeToTray: (settingsBox.read<String>('minimizeToTray') ?? 'on') == 'on',
    customTrayMenu:
        (settingsBox.read<String>('customTrayMenu') ?? 'native') == 'custom',
  );

  // 初始化歌曲缓存服务（必须在 runApp 之前，AudioService 依赖它）
  await Get.putAsync<SongCacheService>(() => SongCacheService().init());
  userInstance.init();
  if (userInstance.dfid.isEmpty) {
    registerDevice()
        .then((result) {
          userInstance.setDfid(result['body']['data']['dfid'] ?? '-');
        })
        .catchError((error) {
          print('Device registration failed: $error');
        });
  }
  runApp(MyApp(appLocale: appLocale));
}

class MyApp extends StatelessWidget {
  final Locale? appLocale;

  const MyApp({super.key, this.appLocale});

  ThemeData _buildTheme(SettingsController settings, Brightness brightness) {
    final primary = settings.primaryColor;
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: brightness,
      ).copyWith(primary: primary),
      fontFamily: settings.fontFamily,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;
    final settings = Get.find<SettingsController>();

    return Layout(
      child: Obx(
        // 读取主题相关 obs，主题切换时整体重建
        () {
          settings.values['theme'];
          settings.values['themeColor'];
          settings.values['font'];
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: DesktopScrollBehavior(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            fallbackLocale: const Locale('zh', 'CN'),
            supportedLocales: const [
              Locale('zh', 'CN'),
              Locale('zh', 'TW'),
              Locale('en', 'US'),
            ],
            locale: appLocale, // null 时跟随系统语言
            themeMode: settings.themeMode,
            theme: _buildTheme(settings, Brightness.light),
            darkTheme: _buildTheme(settings, Brightness.dark),
            initialBinding: MusicBinding(),
            home: isMobile ? const MobileLayoutPage() : const HomePage(),
            navigatorObservers: [routeObserver],
            routes: {
              '/player': (context) => MusicPlayerScreen(),
              '/playlist': (context) => const CurrentPlaylistScreen(),
              '/login': (context) => const LoginPage(),
              '/playlist/detail': (context) {
                final args =
                    ModalRoute.of(context)?.settings.arguments
                        as Map<String, dynamic>?;
                return PlaylistScreen(
                  name: args?['name'],
                  id: args?['id'],
                  pic: args?['pic'],
                );
              },
              '/artist/detail': (context) {
                final args =
                    ModalRoute.of(context)?.settings.arguments
                        as Map<String, dynamic>?;
                return ArtistScreen(
                  singerid:
                      (args?['singerid'] is num) ? args!['singerid'].toInt() : 0,
                  initialFollowed: args?['unfollow'] == true,
                );
              },
              '/mv': (context) {
                final args =
                    ModalRoute.of(context)?.settings.arguments
                        as Map<String, dynamic>?;
                return MvScreen(
                  hash: args?['hash']?.toString() ?? '',
                  title: args?['title']?.toString() ?? '视频播放'.tr,
                );
              },
            },
          );
        },
      ),
    );
  }
}

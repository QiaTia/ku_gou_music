import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/api/login/register_dev.dart';
import 'package:ku_gou_music/config/config.dart';
import 'package:ku_gou_music/views/home/mobile/layout.dart';
import 'package:ku_gou_music/views/playlist/playlist.dart';
import 'package:layout/layout.dart';
import 'bindings/music_binding.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;
    
    return Layout(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: DesktopScrollBehavior(),
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        darkTheme: ThemeData.dark(),
        initialBinding: MusicBinding(),
        home: isMobile ? const MobileLayoutPage() : const HomePage(),
        navigatorObservers: [routeObserver],
        routes: {
          '/player': (context) => MusicPlayerScreen(),
          '/playlist': (context) => const CurrentPlaylistScreen(),
          '/login': (context) => const LoginPage(),
          '/playlist/detail': (context) {
            final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
            return PlaylistScreen(name: args?['name'], id: args?['id'], pic: args?['pic'],);
          }
        }
      ),
    );
  }
}

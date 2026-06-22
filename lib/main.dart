import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/api/login/register_dev.dart';
import 'package:layout/layout.dart';
import 'bindings/music_binding.dart';
import 'views/music/player_screen.dart';
import 'views/music/playlist_screen.dart';
import 'views/home/pc/layout/layout.dart';
import 'views/login/login_page.dart';
import 'store/user.dart';

void main() async {
  await GetStorage.init();
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
    return Layout(
      child: GetMaterialApp(
        title: '音乐播放器',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        darkTheme: ThemeData.dark(),
        initialBinding: MusicBinding(),
        home: const HomePage(),
        routes: {
          '/player': (context) => MusicPlayerScreen(),
          '/playlist': (context) => const PlaylistScreen(),
          '/login': (context) => const LoginPage(),
        },
        getPages: [
          GetPage(
            name: '/player',
            page: () => MusicPlayerScreen(),
            transition: Transition.upToDown,
            transitionDuration: Duration(milliseconds: 300),
            opaque: false,
            fullscreenDialog: true,
            popGesture: true,
          ),
          GetPage(name: '/playlist', page: () => const PlaylistScreen()),
          GetPage(
            name: '/login',
            page: () => const LoginPage(),
            transition: Transition.fade,
            transitionDuration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

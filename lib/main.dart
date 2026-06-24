import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/api/login/register_dev.dart';
import 'package:ku_gou_music/config/config.dart';
import 'package:ku_gou_music/views/home/mobile/layout.dart';
import 'package:layout/layout.dart';
import 'bindings/music_binding.dart';
import 'views/music/player_screen.dart';
import 'views/music/playlist_screen.dart';
import 'views/home/pc/layout/layout.dart';
import 'views/login/login_page.dart';
import 'store/user.dart';

class DesktopScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}

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

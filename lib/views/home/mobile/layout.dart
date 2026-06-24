import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/home/pc/router/config.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:ku_gou_music/views/music/player_screen.dart';
import 'package:ku_gou_music/widgets/rotating_album_cover.dart';

class MobileLayoutPage extends StatefulWidget {
  const MobileLayoutPage({super.key});

  @override
  State<MobileLayoutPage> createState() => _MobileLayoutPageState();
}

class _MobileLayoutPageState extends State<MobileLayoutPage> {
  int _currentIndex = 0;
  DateTime? currentBackPressTime;
  final musicController = Get.put(MusicController());
  bool closeOnConfirm() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 4)) {
      currentBackPressTime = now;
      Get.showSnackbar(
        GetSnackBar(
          message: 'conirmExitApp'.tr,
          duration: const Duration(seconds: 4),
        ),
      );
      return false;
    }
    currentBackPressTime = null;
    return true;
  }

  void _onPlayer() {
    Get.to(() => const MusicPlayerScreen());
  }

  @override
  Widget build(BuildContext context) {
    final routerController = Get.put(
      LocalRouterController(initialRoute: initialRoute, routes: routes),
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (closeOnConfirm()) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: LocalRouter(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 4 && userInstance.token.isEmpty) {
              Get.toNamed('/login');
              return;
            } else {
              final paths = ['/home', '/plaza', '/ranking', '/recently', '/my'];
              routerController.navigateTo(paths[index]);
            }
            setState(() => _currentIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFF5E8A),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive_sharp),
              label: '广场',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: '排行榜',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: '最近播放'),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play),
              label: '我的',
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: _onPlayer,
          heroTag: '_buildAlbumCover', 
          elevation: 0, 
          backgroundColor: Colors.transparent,
          child: RotatingAlbumCover(musicController: musicController, ignoreHero: true),
        ),
      ),
    );
  }
}

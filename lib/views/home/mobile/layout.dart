import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/views/music/player_screen.dart';
import 'package:ku_gou_music/views/my/my.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  DateTime? currentBackPressTime;
  final musicController = Get.put(MusicController());

  // 返回键退出
  bool closeOnConfirm() {
    DateTime now = DateTime.now();
    // 物理键，两次间隔大于4秒, 退出请求无效
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
    // 退出请求有效
    currentBackPressTime = null;
    return true;
  }

  void _onPlayer() {
    // Get.to(() => const MyScreen());
    // // 加载示例音乐并跳转到播放器
    // if (musicController.playlist.isEmpty) {
    //   musicController.loadSampleMusic();
    // }
    Get.to(() => const MusicPlayerScreen());
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        if (closeOnConfirm()) {
          // 系统级别导航栈 退出程序
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: Row(children: [
              Expanded(child: 
                IndexedStack(
                  index: 0,
                  children: [
                    MyScreen()
                  ]
                ))
            ])),
          ],
        ),
        floatingActionButtonLocation: .centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: _onPlayer,
          tooltip: 'Increment',
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}

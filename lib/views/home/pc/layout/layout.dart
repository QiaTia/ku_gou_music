import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'bottom_control.dart';
import 'sidebar.dart';
import '../router/router.dart';
import '../router/config.dart';

class HomePage extends GetView {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalRouterController(initialRoute: initialRoute, routes: routes));
    Get.put(MusicController());

    return Scaffold(
      body: Stack(
        children: [
          // 内容区延伸到底栏下方，为液态玻璃底栏提供模糊背景
          Positioned.fill(
            child: Row(
              children: [
                Sidebar(),
                Expanded(child: LocalRouter()),
              ],
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: BottomControl()),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Sidebar(),
                Expanded(child: LocalRouter()),
              ],
            ),
          ),
          BottomControl(),
        ],
      ),
    );
  }
}

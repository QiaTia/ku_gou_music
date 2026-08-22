import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/home/mobile/widgets/liquid_glass_bottom_bar.dart';
import 'package:ku_gou_music/views/home/pc/router/config.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

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
        extendBody: true,
        body: LocalRouter(),
        bottomNavigationBar: _buildBottomSheet(context, routerController),
      ),
    );
  }

  /// 底部悬浮液态玻璃 TabBar（移动端不需要播放信息条，仅保留 TabBar）
  Widget _buildBottomSheet(BuildContext context, LocalRouterController routerController) {
    return SafeArea(
      top: false,
      child: Container(
        height: 84,
        padding: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.bottomCenter,
        child: LiquidGlassBottomBar(
          currentIndex: _currentIndex,
          musicController: musicController,
          onTap: (index) {
            if (index == 3 && userInstance.token.isEmpty) {
              Get.toNamed('/login');
              return;
            }
            final paths = ['/home', '/plaza', '/ranking', '/my'];
            routerController.navigateTo(paths[index]);
            setState(() => _currentIndex = index);
          },
        ),
      ),
    );
  }
}

import 'dart:ui';
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
        extendBody: true,
        body: Column(children: [ 
          Expanded(child: LocalRouter()),
          SizedBox(height: 80)
        ]),
        bottomNavigationBar: _LiquidGlassBottomBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 4 && userInstance.token.isEmpty) {
              Get.toNamed('/login');
              return;
            }
            final paths = ['/home', '/plaza', '/ranking', '/recently', '/my'];
            routerController.navigateTo(paths[index]);
            setState(() => _currentIndex = index);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: _onPlayer,
          heroTag: '_buildAlbumCover',
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: Colors.transparent,
          child: RotatingAlbumCover(musicController: musicController, ignoreHero: true),
        ),
      ),
    );
  }
}

class _LiquidGlassBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _LiquidGlassBottomBar({
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    _BarItem(icon: Icons.home, label: '首页'),
    _BarItem(icon: Icons.all_inclusive_sharp, label: '广场'),
    _BarItem(icon: Icons.trending_up, label: '排行榜'),
    _BarItem(icon: Icons.history, label: '最近播放'),
    _BarItem(icon: Icons.playlist_play, label: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final selectedIndex = ValueNotifier<int>(currentIndex);

    return ClipPath(
      clipper: _LiquidGlassClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          height: 80 + bottomPadding,
          padding: EdgeInsets.only(bottom: bottomPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0.25),
                Colors.white.withValues(alpha: 0.15),
              ],
            ),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.4),
                width: 0.5,
              ),
            ),
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, current, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_items.length, (i) {
                  final item = _items[i];
                  final isSelected = i == current;
                  return _LiquidBarItem(
                    item: item,
                    isSelected: isSelected,
                    onTap: () {
                      selectedIndex.value = i;
                      onTap(i);
                    },
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LiquidBarItem extends StatelessWidget {
  final _BarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _LiquidBarItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 14 : 0,
                vertical: isSelected ? 4 : 0,
              ),
              decoration: isSelected
                  ? BoxDecoration(
                      color: const Color(0xFFFF5E8A).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    )
                  : null,
              child: Icon(
                item.icon,
                size: 24,
                color: isSelected
                    ? const Color(0xFFFF5E8A)
                    : Colors.grey.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 2),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? const Color(0xFFFF5E8A)
                    : Colors.grey.withValues(alpha: 0.7),
              ),
              child: Text(item.label),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarItem {
  final IconData icon;
  final String label;
  const _BarItem({required this.icon, required this.label});
}

/// Liquid glass clipper with notch for FAB
class _LiquidGlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final notchRadius = 32.0;
    final centerX = size.width / 2;
    const curveDepth = 28.0;

    path.moveTo(0, 0);
    path.lineTo(centerX - notchRadius - 10, 0);

    path.quadraticBezierTo(
      centerX - notchRadius,
      0,
      centerX - notchRadius,
      curveDepth * 0.3,
    );
    path.arcToPoint(
      Offset(centerX + notchRadius, curveDepth * 0.3),
      radius: Radius.circular(notchRadius + 4),
      clockwise: false,
    );
    path.quadraticBezierTo(
      centerX + notchRadius,
      0,
      centerX + notchRadius + 10,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

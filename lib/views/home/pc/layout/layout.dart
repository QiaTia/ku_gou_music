import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/controllers/settings_controller.dart';
import 'package:window_manager/window_manager.dart';
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

    // 原生标题栏被隐藏时，由布局顶部渲染自定义窗口控制栏（仅 Windows 桌面）
    final nativeTitleBarOn =
        Get.find<SettingsController>().values['nativeTitleBar'] == 'on';
    final showWindowControls = !nativeTitleBarOn &&
        defaultTargetPlatform == TargetPlatform.windows;
    final topInset = showWindowControls ? 32.0 : 0.0;

    return Scaffold(
      body: Stack(
        children: [
          // 内容区延伸到底栏下方，为液态玻璃底栏提供模糊背景
          Positioned.fill(
            top: topInset,
            child: Row(
              children: [
                Sidebar(),
                Expanded(child: LocalRouter()),
              ],
            ),
          ),
          if (showWindowControls)
            const Positioned(left: 0, right: 0, top: 0, child: _WindowControlBar()),
          Positioned(left: 0, right: 0, bottom: 0, child: BottomControl()),
        ],
      ),
    );
  }
}

/// 自定义窗口控制栏：拖拽移动 + 最小化/最大化/关闭
/// （原生标题栏隐藏时替代系统标题栏，关闭按钮行为由 WindowService 决定）
class _WindowControlBar extends StatelessWidget {
  const _WindowControlBar();

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final iconColor = Theme.of(context).textTheme.bodyMedium?.color;
    return Container(
      height: 32,
      color: bg,
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: SizedBox.expand(
                child: GestureDetector(
                  // 双击标题栏切换最大化（与系统标题栏行为一致）
                  onDoubleTap: () async {
                    if (await windowManager.isMaximized()) {
                      await windowManager.restore();
                    } else {
                      await windowManager.maximize();
                    }
                  },
                ),
              ),
            ),
          ),
          _WindowButton(
            icon: Icons.minimize,
            iconColor: iconColor,
            hoverColor: Colors.black.withValues(alpha: 0.08),
            onTap: windowManager.minimize,
          ),
          _WindowButton(
            icon: Icons.crop_square,
            iconColor: iconColor,
            hoverColor: Colors.black.withValues(alpha: 0.08),
            onTap: () async {
              if (await windowManager.isMaximized()) {
                await windowManager.restore();
              } else {
                await windowManager.maximize();
              }
            },
          ),
          _WindowButton(
            icon: Icons.close,
            iconColor: iconColor,
            hoverColor: const Color(0xFFE81123),
            hoverIconColor: Colors.white,
            // 触发 onWindowClose：按「关闭时最小化到托盘」设置隐藏或退出
            onTap: windowManager.close,
          ),
        ],
      ),
    );
  }
}

class _WindowButton extends StatefulWidget {
  final IconData icon;
  final Color? iconColor;
  final Color hoverColor;
  final Color? hoverIconColor;
  final VoidCallback onTap;

  const _WindowButton({
    required this.icon,
    required this.hoverColor,
    required this.onTap,
    this.iconColor,
    this.hoverIconColor,
  });

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 46,
          height: 32,
          color: _hovering ? widget.hoverColor : Colors.transparent,
          child: Icon(
            widget.icon,
            size: 16,
            color: _hovering
                ? (widget.hoverIconColor ?? widget.iconColor)
                : widget.iconColor,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/controllers/settings_controller.dart';

/// 桌面窗口与系统托盘服务（仅 Windows 桌面）：
/// - 原生标题栏开关（nativeTitleBar）：隐藏时由 PC 布局渲染自定义窗口控制栏
/// - 关闭时最小化到托盘（minimizeToTray）
/// - 托盘图标与菜单（customTrayMenu: native 原生 / custom 高级）
class WindowService with WindowListener {
  WindowService._();

  static final WindowService instance = WindowService._();

  final SystemTray _systemTray = SystemTray();
  bool _trayReady = false;

  /// 是否最小化到托盘（点击关闭按钮时隐藏而非退出）
  bool _minimizeToTray = true;

  /// 初始化窗口样式与托盘。必须在 runApp 之前调用。
  Future<void> init({
    required bool nativeTitleBar,
    required bool minimizeToTray,
    required bool customTrayMenu,
  }) async {
    if (defaultTargetPlatform != TargetPlatform.windows) return;

    _minimizeToTray = minimizeToTray;

    await windowManager.ensureInitialized();
    windowManager.addListener(this);
    // 拦截关闭事件，由 onWindowClose 决定隐藏到托盘还是退出
    await windowManager.setPreventClose(true);

    final options = WindowOptions(
      titleBarStyle:
          nativeTitleBar ? TitleBarStyle.normal : TitleBarStyle.hidden,
    );
    await windowManager.waitUntilReadyToShow(options, () async {
      await windowManager.show();
      await windowManager.focus();
    });

    await _setupTray(customTrayMenu: customTrayMenu);

    // 托盘菜单样式/关闭行为变化时实时生效
    final settings = Get.find<SettingsController>();
    ever(settings.values, (_) {
      final trayStyle = settings.values['customTrayMenu'] ?? 'native';
      _setupTray(customTrayMenu: trayStyle == 'custom');
      _minimizeToTray = settings.values['minimizeToTray'] == 'on';
    });
  }

  // ==================== 托盘 ====================

  Future<void> _setupTray({required bool customTrayMenu}) async {
    try {
      if (!_trayReady) {
        await _systemTray.initSystemTray(
          title: 'ku_gou_music',
          iconPath: 'assets/app_icon.ico',
          toolTip: '酷狗音乐'.tr,
        );
        _trayReady = true;
        _systemTray.registerSystemTrayEventHandler((eventName) {
          if (eventName == 'leftMouseUp') {
            // 左键单击：唤起主界面
            _showMainWindow();
          } else if (eventName == 'rightMouseUp') {
            _systemTray.popUpContextMenu();
          }
        });
      }
      await _systemTray.setContextMenu(_buildTrayMenu(customTrayMenu));
    } catch (e) {
      print('⚠️ 系统托盘初始化失败: $e'.tr);
    }
  }

  List<MenuItemBase> _buildTrayMenu(bool customTrayMenu) {
    final items = <MenuItemBase>[
      MenuItem(
        label: 'showMainWindow'.tr,
        onClicked: _showMainWindow,
      ),
    ];
    if (customTrayMenu) {
      // 高级菜单：带播放控制（runApp 前 MusicController 未注册时点击不生效）
      items.addAll([
        MenuSeparator(),
        MenuItem(
          label: 'playPause'.tr,
          onClicked: () async {
            try {
              await Get.find<MusicController>().togglePlayPause();
            } catch (_) {}
          },
        ),
        MenuItem(
          label: 'previousTrack'.tr,
          onClicked: () async {
            try {
              await Get.find<MusicController>().previousSong();
            } catch (_) {}
          },
        ),
        MenuItem(
          label: 'nextTrack'.tr,
          onClicked: () async {
            try {
              await Get.find<MusicController>().nextSong();
            } catch (_) {}
          },
        ),
      ]);
    }
    items.addAll([
      MenuSeparator(),
      MenuItem(label: 'exitApp'.tr, onClicked: exitApp),
    ]);
    return items;
  }

  void _showMainWindow() {
    windowManager.show();
    windowManager.focus();
  }

  /// 退出应用（托盘图标随进程退出自动消失）
  Future<void> exitApp() async {
    await windowManager.destroy();
  }

  // ==================== 窗口事件 ====================

  @override
  void onWindowClose() async {
    if (_minimizeToTray) {
      // 隐藏到托盘，播放不中断
      await windowManager.hide();
    } else {
      await exitApp();
    }
  }
}

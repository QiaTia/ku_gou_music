import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/models/settings/settings_model.dart';
import 'package:ku_gou_music/store/user.dart';

/// 设置控制器：负责设置值的持久化、主题联动与网络测试
class SettingsController extends GetxController {
  static const String boxName = 'app_settings';

  late final GetStorage _box;

  /// 全部分组（静态结构）
  final List<SettingSection> sections = buildSettingSections();

  /// 快捷键配置结构
  final Map<String, ShortcutConfig> shortcutConfigs = buildShortcutConfigs();

  /// 当前设置值（key -> value）
  final RxMap<String, String> values = <String, String>{}.obs;

  /// 修改后需要提示「重启/刷新后生效」的项
  final RxSet<String> refreshHints = <String>{}.obs;

  /// 快捷键（action -> 组合键字符串）
  final RxMap<String, String> shortcuts = <String, String>{}.obs;

  /// 字体可选项（静态常见字体清单，value 为字体族名；字体名为专有名词不做翻译）
  static const List<SettingOption> fontOptions = [
    SettingOption('默认字体', ''),
    SettingOption('微软雅黑', 'Microsoft YaHei'),
    SettingOption('等线', 'DengXian'),
    SettingOption('宋体', 'SimSun'),
    SettingOption('黑体', 'SimHei'),
    SettingOption('楷体', 'KaiTi'),
    SettingOption('仿宋', 'FangSong'),
    SettingOption('苹方', 'PingFang SC'),
    SettingOption('Noto Sans SC', 'Noto Sans SC'),
  ];

  /// 主色调映射
  static const Map<String, Color> themeColors = {
    'pink': Color(0xFFFF5E8A),
    'blue': Color(0xFF4A90D9),
    'green': Color(0xFF4CAF50),
    'orange': Color(0xFFFF9800),
  };

  @override
  void onInit() {
    super.onInit();
    _box = GetStorage(boxName);
    _loadAll();
    // 启动问候语：等首帧渲染完成后再弹（UI 依赖 context）
    Future.delayed(const Duration(milliseconds: 1500), _showStartupGreeting);
  }

  /// 「启动问候语」设置：按时间段拼接问候文案，登录后带上昵称
  void _showStartupGreeting() {
    if (values['greetings'] != 'on') return;
    final hour = DateTime.now().hour;
    String period;
    if (hour < 6) {
      period = '夜深了'.tr;
    } else if (hour < 12) {
      period = '早上好'.tr;
    } else if (hour < 14) {
      period = '中午好'.tr;
    } else if (hour < 18) {
      period = '下午好'.tr;
    } else {
      period = '晚上好'.tr;
    }
    final nickname = userInstance.nickname ?? '';
    Get.snackbar(
      '👋 $period',
      nickname.isEmpty ? '欢迎回来，祝你听歌愉快'.tr : '$nickname，欢迎回来，祝你听歌愉快'.tr,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }

  // ==================== 读取 / 写入 ====================

  void _loadAll() {
    for (final section in sections) {
      for (final item in section.items) {
        final stored = _box.read<String>(item.key);
        values[item.key] = stored ?? item.defaultValue ?? '';
      }
    }
    // 隐藏的内部键
    values['dpiScale'] = _box.read<String>('dpiScale') ?? '1.0';
    values['apiBaseUrl'] = _box.read<String>('apiBaseUrl') ?? '';
    values['proxyUrl'] = _box.read<String>('proxyUrl') ?? '';

    // 快捷键
    final storedShortcuts = _box.read<Map>('shortcuts');
    for (final entry in shortcutConfigs.entries) {
      shortcuts[entry.key] =
          storedShortcuts?[entry.key]?.toString() ?? entry.value.defaultValue;
    }
  }

  /// 写入某项并持久化
  void setValue(String key, String value) {
    values[key] = value;
    _box.write(key, value);
    final item = getItem(key);
    if (item != null && item.showRefreshHint) {
      refreshHints.add(key);
    }
    // 语言切换实时生效（已迁移 tr() 的文本即时更新）
    if (key == 'language') _applyLanguage(value);
  }

  /// 语言设置值 → Locale；'en' 需显式补国家码才能命中 en_US 词典
  static Locale? localeFromLanguage(String value) {
    if (value.isEmpty) return null;
    if (value == 'en') return const Locale('en', 'US');
    final parts = value.split('-');
    return Locale(parts[0], parts.length > 1 ? parts[1] : null);
  }

  /// 应用语言设置：空值恢复跟随系统语言
  void _applyLanguage(String value) {
    final locale = localeFromLanguage(value);
    if (locale != null) {
      Get.updateLocale(locale);
    } else {
      final deviceLocale = Get.deviceLocale;
      if (deviceLocale != null) Get.updateLocale(deviceLocale);
    }
    // updateLocale 只切换本地化环境，不会重建路由内已构建的 .tr 文本，
    // 需强制整树重建才能让侧边栏等已渲染文本立即切换
    Get.forceAppUpdate();
  }

  /// 切换 on/off 项
  void toggle(SettingItem item) {
    final next = values[item.key] == 'on' ? 'off' : 'on';
    setValue(item.key, next);
  }

  /// 保存快捷键映射
  void saveShortcuts(Map<String, String> newShortcuts) {
    shortcuts.assignAll(newShortcuts);
    _box.write('shortcuts', Map<String, String>.from(newShortcuts));
  }

  /// 恢复出厂设置
  Future<void> resetAll() async {
    await _box.erase();
    refreshHints.clear();
    _loadAll();
    values.refresh();
  }

  // ==================== 查询辅助 ====================

  SettingItem? getItem(String key) {
    for (final section in sections) {
      for (final item in section.items) {
        if (item.key == key) return item;
      }
    }
    return null;
  }

  /// 某设置项当前值对应的显示文字
  String displayTextOf(SettingItem item) {
    final value = values[item.key] ?? '';
    if (item.customText != null) return item.customText!;
    if (item.type == SettingItemType.font) {
      if (value.isEmpty) return '默认字体'.tr;
      return fontOptions
          .firstWhere(
            (o) => o.value == value,
            orElse: () => SettingOption(value, value),
          )
          .displayText;
    }
    final option = item.options.cast<SettingOption?>().firstWhere(
          (o) => o!.value == value,
          orElse: () => null,
        );
    if (option != null) return option.displayText;
    return item.defaultDisplayText ?? value;
  }

  /// 平台可见性过滤
  bool isItemVisible(SettingItem item) {
    switch (item.availability) {
      case SettingAvailability.all:
        return true;
      case SettingAvailability.client:
        return true; // 本应用即客户端
      case SettingAvailability.win32:
        return Platform.isWindows;
      case SettingAvailability.darwin:
        return Platform.isMacOS;
      case SettingAvailability.web:
        return false; // 非 Web 端
    }
  }

  // ==================== 主题联动 ====================

  ThemeMode get themeMode {
    switch (values['theme']) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  Color get primaryColor =>
      themeColors[values['themeColor']] ?? themeColors['pink']!;

  String? get fontFamily {
    final f = values['font'] ?? '';
    return f.isEmpty ? null : f;
  }

  // ==================== 网络测试 ====================

  /// 测试代理连通性，返回 (是否成功, 结果文案)
  Future<(bool, String)> testProxy(String proxyUrl) async {
    final url = proxyUrl.trim();
    if (url.isEmpty) return (false, '请输入代理地址'.tr);
    Uri? uri;
    try {
      uri = Uri.parse(url);
      if (uri.scheme != 'http' && uri.scheme != 'https') {
        return (false, '仅支持 http/https 代理'.tr);
      }
    } catch (_) {
      return (false, '请输入有效的 URL'.tr);
    }

    final client = HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..findProxy = (_) =>
          'PROXY ${uri!.host}:${uri.hasPort ? uri.port : 80}';
    try {
      final request = await client
          .getUrl(Uri.parse('https://api.ipify.org?format=json'))
          .timeout(const Duration(seconds: 10));
      final response = await request.close();
      final body = await response.transform(const SystemEncoding().decoder).join();
      if (response.statusCode == 200) {
        final ip = RegExp(r'"ip"\s*:\s*"([^"]+)"').firstMatch(body)?.group(1);
        return (true, '代理连接成功: ${ip ?? body}'.tr);
      }
      return (false, '代理连接失败: HTTP ${response.statusCode}'.tr);
    } on TimeoutException {
      return (false, '连接超时'.tr);
    } catch (e) {
      return (false, '连接错误: $e'.tr);
    } finally {
      client.close(force: true);
    }
  }

  /// 测试 RPC 地址连通性，返回 (是否成功, 结果文案)
  Future<(bool, String)> testApiBaseUrl(String baseUrl) async {
    final url = baseUrl.trim();
    if (url.isEmpty) return (false, '请输入 RPC 地址'.tr);
    Uri? uri;
    try {
      uri = Uri.parse(url);
      if (!uri.hasScheme || uri.host.isEmpty) {
        return (false, '请输入有效的 URL'.tr);
      }
    } catch (_) {
      return (false, '请输入有效的 URL'.tr);
    }

    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 6),
      receiveTimeout: const Duration(seconds: 6),
      validateStatus: (_) => true, // 任意 HTTP 响应都视为端点可达
    ));
    try {
      final response = await dio.getUri(uri);
      return (true, '连接成功 (HTTP ${response.statusCode})'.tr);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return (false, '连接超时'.tr);
      }
      return (false, '连接错误: ${e.message ?? e.type.name}'.tr);
    } catch (e) {
      return (false, '连接错误: $e'.tr);
    } finally {
      dio.close();
    }
  }
}

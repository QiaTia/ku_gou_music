import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

/// 应用翻译：以中文原文为 key。
///
/// 词典组成（在 main 中通过 [loadAppTranslations] 合并后注册）：
/// 1. 基础词典：托盘菜单等 runApp 前就需要 .tr 的键（下方静态表）；
/// 2. JSON 词典：assets/i18n/*.json，由 tool/i18n_extract.dart 从源码
///    提取全部中文字符串后人工翻译生成，键与源码原文一一对应。
///
/// zh_CN 无需词典：key 即中文原文，GetX 查不到时回退返回 key 本身。
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'showMainWindow': '显示主界面',
          'playPause': '播放/暂停',
          'previousTrack': '上一首',
          'nextTrack': '下一首',
          'exitApp': '退出',
          '首页': '首页',
          '发现': '发现',
          '最近播放': '最近播放',
          '我的': '我的',
        },
        'zh_TW': {
          'showMainWindow': '顯示主介面',
          'playPause': '播放/暫停',
          'previousTrack': '上一首',
          'nextTrack': '下一首',
          'exitApp': '離開',
          '首页': '首頁',
          '发现': '發現',
          '最近播放': '最近播放',
          '我的': '我的',
        },
        'en_US': {
          'showMainWindow': 'Show Main Window',
          'playPause': 'Play/Pause',
          'previousTrack': 'Previous',
          'nextTrack': 'Next',
          'exitApp': 'Exit',
          '首页': 'Home',
          '发现': 'Discover',
          '最近播放': 'Recently Played',
          '我的': 'My Music',
        },
      };
}

/// 加载 assets/i18n/ 下的 JSON 词典并与基础词典合并。
///
/// 必须在 runApp 之前 await 调用（托盘菜单构建依赖 .tr）。
/// JSON 值优先级高于基础词典；单个文件缺失/损坏时保留基础词典继续启动。
Future<Map<String, Map<String, String>>> loadAppTranslations() async {
  final merged = AppTranslations()
      .keys
      .map((locale, map) => MapEntry(locale, Map<String, String>.of(map)));

  const dictionaries = {
    'zh_TW': 'assets/i18n/zh_TW.json',
    'en_US': 'assets/i18n/en.json',
  };
  for (final entry in dictionaries.entries) {
    try {
      final raw = await rootBundle.loadString(entry.value);
      final dict = (jsonDecode(raw) as Map).cast<String, String>();
      merged.putIfAbsent(entry.key, () => {}).addAll(dict);
    } catch (e) {
      // 资源缺失或解析失败时回退到基础词典，保证应用可用
      // ignore: avoid_print
      print('⚠️ 加载词典 ${entry.value} 失败: $e');
    }
  }
  return merged;
}

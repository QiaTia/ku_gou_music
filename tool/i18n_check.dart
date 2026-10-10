// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

/// 多语言词典校验脚本
///
/// 对比源码提取出的 assets/i18n/keys.json 与各语言词典 JSON 的键一致性：
/// - 缺失键：该语言下会回退显示中文原文
/// - 多余键：词典中存在但源码已不再使用的翻译
///
/// 用法：dart run tool/i18n_check.dart [词典.json ...]
/// 不带参数时默认校验全部已知词典文件。
void main(List<String> args) {
  final keysFile = File('assets/i18n/keys.json');
  if (!keysFile.existsSync()) {
    print('未找到 assets/i18n/keys.json，请先运行: dart run tool/i18n_extract.dart');
    exit(1);
  }
  final keys =
      (jsonDecode(keysFile.readAsStringSync()) as List).cast<String>().toSet();

  final targets = args.isNotEmpty
      ? args
      : const ['assets/i18n/zh_TW.json', 'assets/i18n/en.json'];

  var hasError = false;
  for (final path in targets) {
    final file = File(path);
    if (!file.existsSync()) {
      print('[$path] 文件不存在');
      hasError = true;
      continue;
    }
    final map =
        (jsonDecode(file.readAsStringSync()) as Map).keys.cast<String>().toSet();
    final missing = keys.difference(map).toList()..sort();
    final extra = map.difference(keys).toList()..sort();

    print('== $path ==');
    print('  词典键数: ${map.length} / 源码键数: ${keys.length}');
    if (missing.isEmpty) {
      print('  缺失键: 无');
    } else {
      hasError = true;
      print('  缺失键 (${missing.length} 个):');
      for (final k in missing) {
        print('    - $k');
      }
    }
    if (extra.isEmpty) {
      print('  多余键: 无');
    } else {
      print('  多余键 (${extra.length} 个，通常为托盘等非源码提取键):');
      for (final k in extra) {
        print('    - $k');
      }
    }
  }
  exit(hasError ? 1 : 0);
}

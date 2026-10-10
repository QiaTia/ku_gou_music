// 多语言文本提取脚本：
// 扫描 lib/ 下所有 Dart 源码中的中文字符串字面量（含插值字符串），
// 去重排序后写入 assets/i18n/keys.json，作为翻译词典的 key 来源。
//
// 用法: dart run tool/i18n_extract.dart
import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:path/path.dart' as p;

final cjkPattern = RegExp(r'[\u4e00-\u9fff]');
final libDir = Directory('lib');

// 与 wrap 脚本保持一致的排除范围
bool isExcluded(FileSystemEntity entity) {
  final path = p.normalize(entity.path).replaceAll('\\', '/');
  if (path.endsWith('.g.dart') || path.endsWith('.freezed.dart')) return true;
  if (path.startsWith('lib/i18n/')) return true;
  return false;
}

void main() {
  final keys = <String>{};
  final perFile = <String, int>{};

  final files = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart') && !isExcluded(f))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  for (final file in files) {
    final source = file.readAsStringSync();
    final unit = parseString(content: source, path: file.path).unit;

    final visitor = _StringCollector();
    unit.accept(visitor);

    final found = visitor.literals.where((s) => cjkPattern.hasMatch(s));
    if (found.isEmpty) continue;
    keys.addAll(found);
    perFile[file.path] = found.length;
  }

  final sortedKeys = keys.toList()..sort();
  final out = File('assets/i18n/keys.json');
  out.parent.createSync(recursive: true);
  out.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(sortedKeys),
  );

  print('扫描文件: ${files.length} 个');
  print('唯一中文 key: ${sortedKeys.length} 个 -> ${out.path}');
  print('--- 分布 ---');
  for (final e in perFile.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value))) {
    print('${e.value.toString().padLeft(4)}  ${e.key}');
  }
}

class _StringCollector extends RecursiveAstVisitor<void> {
  final literals = <String>[];

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    literals.add(node.value);
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    // 插值字符串取原始文本作为 key（翻译时整段匹配）
    literals.add(node.toSource().substring(1, node.toSource().length - 1));
    super.visitStringInterpolation(node);
  }

  @override
  void visitAdjacentStrings(AdjacentStrings node) {
    literals.add(node.stringValue ?? node.toSource());
    super.visitAdjacentStrings(node);
  }
}

// 多语言源码迁移脚本：
// 将 lib/ 下（排除生成文件与词典文件）的中文字符串字面量自动包裹为 `.tr`，
// 使其接入 GetX 运行时翻译（中文原文即词典 key，zh_CN 下显示不变）。
//
// 安全策略（基于 AST，不做盲目文本替换）：
// - const 上下文中的字面量必须去掉 const 才能用 .tr：
//   自动剥离**最外层** const 构造/集合的 const 关键字后再包裹
// - 不可修复位置直接跳过：函数默认参数值、switch case、注解、
//   const 构造函数内的 assert 消息
// - 文件缺少 get 导入时自动补上
// - lib/models/settings/settings_model.dart 跳过（模型在启动时构建一次，
//   由 settings.dart 在展示时动态 .tr）
//
// 用法: dart run tool/i18n_wrap.dart
import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:path/path.dart' as p;

final cjkPattern = RegExp(r'[\u4e00-\u9fff]');

// 不做改写的文件
bool isExcluded(String path) {
  final norm = p.normalize(path).replaceAll('\\', '/');
  if (norm.endsWith('.g.dart') || norm.endsWith('.freezed.dart')) return true;
  if (norm.startsWith('lib/i18n/')) return true;
  if (norm == 'lib/models/settings/settings_model.dart') return true;
  if (norm.startsWith('tool/')) return true;
  return false;
}

class _Edit {
  final int offset;
  final int end;
  final String replacement;
  _Edit(this.offset, this.end, this.replacement);
}

void main() {
  final files = Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart') && !isExcluded(f.path))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  var totalWrapped = 0;
  var filesChanged = 0;

  for (final file in files) {
    final source = file.readAsStringSync();
    final unit = parseString(content: source, path: file.path).unit;

    final collector = _CjkLiteralCollector();
    unit.accept(collector);
    if (collector.literals.isEmpty) continue;

    final edits = <_Edit>[];
    var wrapped = 0;
    var skipped = 0;

    for (final node in collector.literals) {
      final verdict = _classify(node, source);
      if (verdict == null) {
        skipped++;
        continue;
      }
      // 剥离最外层 const 关键字
      final outerConst = verdict;
      if (outerConst > 0) {
        final kw = _constKeywordOffset(node, source);
        if (kw != null) {
          edits.add(_Edit(kw, kw + 5, ''));
        }
      }
      // 字面量尾部追加 .tr；相邻字符串需整体括起
      final raw = source.substring(node.offset, node.end);
      final replacement =
          node is AdjacentStrings ? '($raw).tr' : '$raw.tr';
      edits.add(_Edit(node.offset, node.end, replacement));
      wrapped++;
    }

    if (wrapped == 0) {
      if (skipped > 0) {
        print('跳过 ${file.path}（$skipped 处不可安全改写）');
      }
      continue;
    }

    var newSource = _applyEdits(source, edits);

    // 确保有 get 导入（.tr 扩展来自 get 包）
    if (!newSource.contains("import 'package:get/get.dart';")) {
      final importMatch =
          RegExp(r"^import\s[^;]+;", multiLine: true).firstMatch(newSource);
      if (importMatch != null) {
        final insertAt = importMatch.end;
        newSource = newSource.replaceRange(
            insertAt, insertAt, "\nimport 'package:get/get.dart';");
      } else {
        newSource = "import 'package:get/get.dart';\n\n$newSource";
      }
    }

    file.writeAsStringSync(newSource);
    totalWrapped += wrapped;
    filesChanged++;
    print('改写 ${file.path}: 包裹 $wrapped 处' +
        (skipped > 0 ? '，跳过 $skipped 处' : ''));
  }

  print('--- 完成：$filesChanged 个文件，共包裹 $totalWrapped 处 ---');
}

/// 判定字面量能否包裹 .tr；返回需要剥离的 const 层级深度（0=无需）
int? _classify(AstNode node, String source) {
  int constDepth = 0;
  AstNode? cur = node.parent;
  while (cur != null) {
    if (cur is InstanceCreationExpression &&
        cur.keyword?.lexeme == 'const') {
      constDepth++;
    } else if ((cur is ListLiteral || cur is SetOrMapLiteral) &&
        cur is TypedLiteral &&
        cur.constKeyword != null) {
      constDepth++;
    } else if (cur is DefaultFormalParameter) {
      // 默认参数值必须是常量，无法包裹
      return null;
    } else if (cur is SwitchCase || cur is ConstantPattern) {
      // case 表达式必须是常量
      return null;
    } else if (cur is Annotation) {
      // 注解参数必须常量
      return null;
    } else if (cur is AssertStatement) {
      // const 构造函数里的 assert 消息必须常量
      if (_insideConstConstructor(cur)) return null;
    } else if (cur is ConstructorDeclaration && cur.constKeyword != null) {
      // const 构造函数初始化列表中的字面量必须常量
      if (_inInitializerList(node, cur)) return null;
    }
    cur = cur.parent;
  }
  return constDepth;
}

bool _insideConstConstructor(AstNode node) {
  AstNode? cur = node.parent;
  while (cur != null) {
    if (cur is ConstructorDeclaration && cur.constKeyword != null) {
      return true;
    }
    cur = cur.parent;
  }
  return false;
}

bool _inInitializerList(AstNode literal, ConstructorDeclaration ctor) {
  final init = ctor.initializers;
  for (final i in init) {
    if (i.offset <= literal.offset && literal.end <= i.end) return true;
  }
  // super/this 参数之外，直接判断是否在初始化列表范围内
  final bodyStart = ctor.body.offset;
  return literal.end <= bodyStart && literal.offset >= ctor.offset;
}

/// 找到从该字面量向上的最外层 const 节点的 const 关键字偏移
int? _constKeywordOffset(AstNode node, String source) {
  Token? kw;
  AstNode? cur = node.parent;
  while (cur != null) {
    if (cur is InstanceCreationExpression &&
        cur.keyword?.lexeme == 'const') {
      kw = cur.keyword;
    } else if ((cur is ListLiteral || cur is SetOrMapLiteral) &&
        cur is TypedLiteral &&
        cur.constKeyword != null) {
      kw = cur.constKeyword;
    }
    cur = cur.parent;
  }
  return kw?.offset;
}

String _applyEdits(String source, List<_Edit> edits) {
  final sorted = edits.toList()..sort((a, b) => b.offset.compareTo(a.offset));
  var out = source;
  for (final e in sorted) {
    out = out.replaceRange(e.offset, e.end, e.replacement);
  }
  return out;
}

class _CjkLiteralCollector extends RecursiveAstVisitor<void> {
  /// 收集含中文的字符串节点（相邻字符串取整体）
  final literals = <StringLiteral>[];

  bool _hasCjk(StringLiteral node) =>
      cjkPattern.hasMatch(node.toSource());

  @override
  void visitSimpleStringLiteral(SimpleStringLiteral node) {
    if (_hasCjk(node)) literals.add(node);
    super.visitSimpleStringLiteral(node);
  }

  @override
  void visitStringInterpolation(StringInterpolation node) {
    if (_hasCjk(node)) literals.add(node);
    super.visitStringInterpolation(node);
  }

  @override
  void visitAdjacentStrings(AdjacentStrings node) {
    if (_hasCjk(node)) literals.add(node);
    // 不深入子串，避免整体与局部重复包裹
  }
}

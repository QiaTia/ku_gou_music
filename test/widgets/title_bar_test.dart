import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

void main() {
  setUpAll(() {
    // 注册 LocalRouterController
    Get.put(LocalRouterController(
      initialRoute: '/',
      routes: {'/': (context) => const SizedBox.shrink()},
    ));
  });

  group('TitleBar Widget Tests', () {
    testWidgets('应该显示标题', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: TitleBar(title: '测试标题'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('测试标题'), findsOneWidget);
    });

    testWidgets('应该显示搜索框', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: TitleBar(
              searchField: TitleSearchField(hintText: '搜索'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TitleSearchField), findsOneWidget);
    });

    testWidgets('应该显示自定义actions', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: TitleBar(
              title: '测试',
              actions: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('没有actions时应该显示默认设置按钮', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: TitleBar(title: '测试'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.settings_outlined), findsOneWidget);
    });

    testWidgets('有actions时不应该显示默认设置按钮', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            appBar: TitleBar(
              title: '测试',
              actions: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.settings_outlined), findsNothing);
      expect(find.byIcon(Icons.edit), findsOneWidget);
    });

    testWidgets('应该实现PreferredSizeWidget', (WidgetTester tester) async {
      final titleBar = TitleBar(title: '测试');
      expect(titleBar.preferredSize, isNotNull);
    });
  });

  group('TitleSearchField Widget Tests', () {
    testWidgets('应该显示提示文字', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: TitleSearchField(hintText: '搜索歌曲'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('搜索歌曲'), findsOneWidget);
    });
  });
}

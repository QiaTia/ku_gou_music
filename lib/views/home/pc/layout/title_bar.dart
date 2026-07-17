import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

bool isTyping = false;
final searchFieldColor = Color(0xFF1E1E1E);

class TitleSearchField extends StatefulWidget {
  final String hintText;
  final String? initialKeyword;

  const TitleSearchField({
    super.key,
    required this.hintText,
    this.initialKeyword = '',
  });

  @override
  State<StatefulWidget> createState() => _TitleSearchFieldState();
}

class _TitleSearchFieldState extends State<TitleSearchField> {
  late String hintText;
  TextEditingController textController = TextEditingController();
  final displayCancelNotifier = ValueNotifier(false);
  final FocusNode focusNode = FocusNode();

  void displayCancelOrNot() {
    if (textController.text != '') {
      displayCancelNotifier.value = true;
    } else {
      displayCancelNotifier.value = false;
    }
  }

  @override
  void initState() {
    super.initState();
    hintText = widget.hintText;
    textController.text = widget.initialKeyword ?? '';
    textController.addListener(displayCancelOrNot);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isTyping = true;
      } else {
        isTyping = false;
      }
    });
  }

  @override
  void dispose() {
    textController.removeListener(displayCancelOrNot);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LocalRouterController controller = Get.find();

    return Center(
      child: SizedBox(
        width: 260,
        height: 40,
        child: TextField(
          controller: textController,
          focusNode: focusNode,
          style: TextStyle(fontSize: 14),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              controller.navigateTo('/search', {'initialKeyword': value.trim()});
              // Get.to(() => SearchPage(initialKeyword: value.trim()));
            }
          },

          decoration: InputDecoration(
            hint: Text(
              hintText,
              style: TextStyle(fontSize: 14),
            ),

            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search),
            suffixIcon: ValueListenableBuilder(
              valueListenable: displayCancelNotifier,
              builder: (context, value, child) {
                return value
                    ? IconButton(
                        onPressed: () {
                          textController.clear();
                        },
                        icon: Icon(Icons.close, size: 20),
                      )
                    : SizedBox.shrink();
              },
            ),
            filled: true,
            // fillColor: searchFieldColor,
            // hoverColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String? title;
  final Widget? searchField;
  /// 右侧自定义操作按钮列表
  final List<Widget>? actions;
  final displayCancelNotifier = ValueNotifier(false);

  TitleBar({
    super.key,
    this.title,
    this.searchField,
    this.actions,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    LocalRouterController controller = Get.find();
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;
    final paddingTop = MediaQuery.of(context).padding.top;

    return LayoutBuilder(
      builder: (context, constraints) => ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 75 + paddingTop,
            padding: EdgeInsets.only(top: paddingTop),
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.7),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.15),
                  width: 0.5,
                ),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Obx(() => controller.canBack.value && !isMobile ?
                      IconButton(onPressed: controller.goBack, icon: Icon(Icons.arrow_back))
                    : SizedBox.shrink()
                  ),
                  // 标题区域
                  if (title != null)
                    Expanded(child: Text(
                      title!,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  // 搜索框
                  if (searchField != null)
                  Expanded(child:
                    SizedBox(child: searchField)),
                  // 占位或actions
                  if (actions != null && actions!.isNotEmpty) ...[
                    Spacer(),
                    ...actions!,
                  ] else if (searchField == null) ...[
                    Spacer(),
                  ],
                  // 默认设置按钮（如果没有自定义actions时显示）
                  if (actions == null)
                    IconButton(
                      onPressed: () {
                      // panelManager.pushPanel('settings');
                      },
                      icon: Icon(Icons.settings_outlined, size: 20),
                    ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

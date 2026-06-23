import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

bool isTyping = false;
final searchFieldColor = Color(0xFF1E1E1E);

class TitleSearchField extends StatefulWidget {
  final String hintText;
  final TextEditingController textController;

  const TitleSearchField({
    super.key,
    required this.hintText,
    required this.textController,
  });

  @override
  State<StatefulWidget> createState() => _TitleSearchFieldState();
}

class _TitleSearchFieldState extends State<TitleSearchField> {
  late String hintText;
  late TextEditingController textController;
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
    textController = widget.textController;

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
    return Center(
      child: SizedBox(
        width: 260,
        height: 40,
        child: TextField(
          controller: textController,
          focusNode: focusNode,
          style: TextStyle(fontSize: 14),

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

  @override
  Size get preferredSize => Size.fromHeight(height);

  final Widget? searchField;
  final displayCancelNotifier = ValueNotifier(false);

  TitleBar({super.key, this.title, this.searchField, this.height = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    LocalRouterController controller = Get.find();
    
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: 75,
        width: constraints.maxWidth,
        child: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              // onPanStart: (details) => windowManager.startDragging(),
              // onDoubleTap: () async {
              //   if (isFullScreenNotifier.value) {
              //     return;
              //   }
              //   isMaximizedNotifier.value
              //       ? windowManager.unmaximize()
              //       : windowManager.maximize();
              // },
              child: SizedBox(),
            ),

            Center(
              child: Row(
                children: [
                  SizedBox(width: 10),
                  // IconButton(onPressed: controller.goBack, icon: Icon(Icons.arrow_back)),
                  Obx(() => controller.canBack.value ? 
                      IconButton(onPressed: controller.goBack, icon: Icon(Icons.arrow_back))
                    : SizedBox.shrink()
                  ),
                  Expanded(child: Text(title ?? '')),
                  SizedBox(child: searchField),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      // panelManager.pushPanel('settings');
                    },
                    icon: Icon(Icons.settings_outlined, size: 20),
                  ),
                  // windowControls(),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

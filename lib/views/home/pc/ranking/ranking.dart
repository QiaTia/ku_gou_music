import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:ku_gou_music/views/home/pc/ranking/discover_new_album_content.dart';
import 'package:ku_gou_music/views/home/pc/ranking/discover_new_song_content.dart';
import 'package:ku_gou_music/views/home/pc/ranking/discover_playlist_content.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.controller.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking_content.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking_layout.dart';

/// 发现页（对应 MoeKoeMusic 的 Discover.vue）
///
/// 四个内容 Tab：发现歌单 / 音乐榜单 / 新碟上架 / 新歌速递
/// 头部随滚动折叠：
/// - 未滚动：两行（图标行 + 整行 Tab 切换器）
/// - 滚动后：单行（返回图标 + 居中紧凑 Tab + 设置图标）
class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  late final DiscoverController controller;

  @override
  void initState() {
    super.initState();
    // permanent：Navigator 栈中可能共存多个本页实例（push 多次），
    // 全局单例避免被某个实例的 dispose 误删导致其他实例失效
    controller = Get.put(DiscoverController(), permanent: true);
  }

  @override
  void dispose() {
    // DiscoverController 为 permanent 注册，不在此删除
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _CollapsingHeader(),
            Expanded(
              child: Padding(
                padding: DiscoverLayout.contentPadding(context),
                child: Stack(
                  children: [
                    Obx(() {
                      switch (controller.activeTab.value) {
                        case DiscoverTab.playlist:
                          return const DiscoverPlaylistContent();
                        case DiscoverTab.ranking:
                          return const RankingContent();
                        case DiscoverTab.newAlbum:
                          return const DiscoverNewAlbumContent();
                        case DiscoverTab.newSong:
                          return const DiscoverNewSongContent();
                      }
                    }),
                    Positioned(
                      right: 0,
                      // 移动端底部有悬浮 TabBar（外层 extendBody），按钮需上移避让
                      bottom: DiscoverLayout.isCompact(context) ? 76 : 0,
                      child: const _BackToTopButton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 折叠吸顶头部
class _CollapsingHeader extends StatelessWidget {
  const _CollapsingHeader();

  /// 触发折叠的滚动偏移阈值
  static const double _collapseThreshold = 50;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    final router = Get.find<LocalRouterController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;

    // 返回图标（沿用 TitleBar 逻辑：桌面端且可返回时显示）
    Widget backIcon() => SizedBox(
          width: 48,
          height: 48,
          child: Obx(() => router.canBack.value && !isMobile
              ? IconButton(
                  onPressed: router.goBack,
                  icon: const Icon(Icons.arrow_back),
                )
              : const SizedBox.shrink()),
        );

    // 设置图标
    Widget setIcon() => IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings_outlined,
            size: 20,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
        );

    return Obx(() {
      final collapsed = controller.scrollOffset.value > _collapseThreshold;

      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 250),
        reverseDuration: const Duration(milliseconds: 250),
        sizeCurve: Curves.easeOutCubic,
        firstCurve: Curves.easeOut,
        secondCurve: Curves.easeOut,
        crossFadeState:
            collapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        // 未滚动：图标行 + 整行 Tab
        firstChild: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
          child: Column(
            children: [
              Row(
                children: [
                  backIcon(),
                  const Spacer(),
                  setIcon(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                child: _DiscoverSwitch(),
              ),
            ],
          ),
        ),
        // 滚动后：单行（返回 + 居中紧凑 Tab + 设置）
        secondChild: Padding(
          padding: const EdgeInsets.fromLTRB(12, 2, 12, 6),
          child: Row(
            children: [
              backIcon(),
              Expanded(
                // 窄屏（手机）下 420 固定宽会顶破行约束，按可用宽度收敛
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width =
                        constraints.maxWidth < 420 ? constraints.maxWidth : 420.0;
                    return Center(
                      child: SizedBox(
                        width: width,
                        child: const _DiscoverSwitch(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 48, child: Center(child: setIcon())),
            ],
          ),
        ),
      );
    });
  }
}

/// Tab 切换器（带滑动指示块）
class _DiscoverSwitch extends StatelessWidget {
  const _DiscoverSwitch();

  // getter 每次访问时求值，.tr 随当前语言动态翻译
  static List<(DiscoverTab, String)> get _tabs => [
    (DiscoverTab.playlist, '发现歌单'.tr),
    (DiscoverTab.ranking, '音乐榜单'.tr),
    (DiscoverTab.newAlbum, '新碟上架'.tr),
    (DiscoverTab.newSong, '新歌速递'.tr),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;
    // 窄屏收窄字号，保证四个 Tab 文字不挤爆
    final compact = DiscoverLayout.isCompact(context);
    final fontSize = compact ? 12.5 : 14.0;

    return Obx(() {
      final activeIndex =
          _tabs.indexWhere((t) => t.$1 == controller.activeTab.value).clamp(0, 3);

      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1D1F24) : const Color(0xFFF3F4F7),
          border: Border.all(
            color: isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFE8EAF0),
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final pillWidth = (constraints.maxWidth - 10) / _tabs.length;
            return SizedBox(
              height: 34,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeOutCubic,
                    left: 5 + activeIndex * pillWidth,
                    top: 0,
                    child: SizedBox(
                      width: pillWidth,
                      height: 34,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDark ? const Color(0xFF2A2D35) : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (final (index, tab) in _tabs.indexed)
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => controller.switchTab(tab.$1),
                              child: SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text(
                                    tab.$2,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: fontSize,
                                      fontWeight: FontWeight.w600,
                                      color: index == activeIndex
                                          ? primary
                                          : isDark
                                              ? Colors.white.withValues(alpha: 0.62)
                                              : const Color(0xFF8B8F9C),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

/// 回到顶部悬浮按钮
class _BackToTopButton extends StatelessWidget {
  const _BackToTopButton();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Obx(() {
      final visible = controller.scrollOffset.value > 400;
      return AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: IgnorePointer(
          ignoring: !visible,
          child: Material(
            color: isDark ? const Color(0xFF2A2D35) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: controller.backToTop,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_upward, size: 16, color: primary),
                    const SizedBox(width: 6),
                    Text(
                      '回到顶部'.tr,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

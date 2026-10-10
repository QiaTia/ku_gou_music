import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/discover/discover.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.controller.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking_layout.dart';

/// 新歌速递内容（对应 DiscoverNewSongContent.vue）
class DiscoverNewSongContent extends StatefulWidget {
  const DiscoverNewSongContent({super.key});

  @override
  State<DiscoverNewSongContent> createState() => _DiscoverNewSongContentState();
}

class _DiscoverNewSongContentState extends State<DiscoverNewSongContent> {
  late final DiscoverNewSongController controller;

  /// 组件私有滚动控制器：每个滚动视图独占一个，避免跨视图共享
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscoverNewSongController());
    Get.find<DiscoverController>().attachScroll(_scrollController);
  }

  @override
  void dispose() {
    Get.find<DiscoverController>().detachScroll(_scrollController);
    _scrollController.dispose();
    Get.delete<DiscoverNewSongController>();
    super.dispose();
  }

  Future<void> _playSong(DiscoverNewSong song) async {
    final ok = await controller.playSong(song);
    if (!ok && mounted) {
      Get.snackbar('无法播放'.tr, '《${song.songname}》暂时无法播放'.tr);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.newSongs.isEmpty) {
        return const _NewSongPlaceholder();
      }
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: DiscoverLayout.bottomInset(context)),
              itemCount: controller.newSongs.length,
              separatorBuilder: (_, _) => const SizedBox(height: 4),
              itemBuilder: (context, index) => _NewSongItem(
                song: controller.newSongs[index],
                onTap: () => _playSong(controller.newSongs[index]),
              ),
            ),
          ),
          if (controller.totalSongPages.value > 1)
            // 分页器在滚动区之外，移动端会被悬浮 TabBar 盖住，需要单独避让
            Padding(
              padding: EdgeInsets.only(
                bottom: DiscoverLayout.isCompact(context)
                    ? DiscoverLayout.mobileTabBarHeight
                    : 0,
              ),
              child: _SongPagination(controller: controller),
            ),
        ],
      );
    });
  }
}

/// 单曲行
class _NewSongItem extends StatefulWidget {
  final DiscoverNewSong song;
  final VoidCallback onTap;

  const _NewSongItem({required this.song, required this.onTap});

  @override
  State<_NewSongItem> createState() => _NewSongItemState();
}

class _NewSongItemState extends State<_NewSongItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final song = widget.song;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Material(
        color: _hovering
            ? (isDark ? const Color(0xFF26282F) : const Color(0xFFF8F9FA))
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: song.cover,
                          fit: BoxFit.cover,
                          placeholder: (_, _) =>
                              Container(color: Colors.grey.withValues(alpha: 0.2)),
                          errorWidget: (_, _, _) => Container(
                            color: Colors.grey.withValues(alpha: 0.2),
                            child: const Icon(Icons.music_note,
                                color: Colors.grey, size: 20),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _hovering ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.4),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.songname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.86)
                                    : const Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              song.authorName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.62)
                                    : const Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: Text(
                          song.albumName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.42)
                                : const Color(0xFF999999),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        formatMilliseconds(song.timelength),
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.42)
                              : const Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 分页器：上一页 / 页码（含省略号）/ 下一页
class _SongPagination extends StatelessWidget {
  final DiscoverNewSongController controller;

  const _SongPagination({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentPage = controller.currentSongPage.value;
      final totalPages = controller.totalSongPages.value;
      final pageNumbers = controller.buildPageNumbers(totalPages, currentPage);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        // 单行横向排列，空间不足时横向滑动
        child: Center(
          child: SizedBox(
            height: 36,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  _PageNavButton(
                    label: '上一页'.tr,
                    enabled: currentPage > 1,
                    onPressed: controller.prevSongPage,
                  ),
                  const SizedBox(width: 10),
                  for (final (index, page) in pageNumbers.indexed) ...[
                    if (index > 0) const SizedBox(width: 5),
                    page is int
                        ? _PageNumberButton(
                            page: page,
                            active: page == currentPage,
                            onPressed: () => controller.goToSongPage(page),
                          )
                        : _Ellipsis(),
                  ],
                  const SizedBox(width: 10),
                  _PageNavButton(
                    label: '下一页'.tr,
                    enabled: currentPage < totalPages,
                    onPressed: controller.nextSongPage,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _PageNumberButton extends StatelessWidget {
  final int page;
  final bool active;
  final VoidCallback onPressed;

  const _PageNumberButton({
    required this.page,
    required this.active,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Material(
      color: active
          ? primary
          : isDark
              ? const Color(0xFF2A2A2A)
              : const Color(0xFFF5F5F5),
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onPressed,
        child: Container(
          constraints: const BoxConstraints(minWidth: 40),
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.center,
          child: Text(
            '$page',
            style: TextStyle(
              fontSize: 13,
              color: active
                  ? Colors.white
                  : isDark
                      ? Colors.white.withValues(alpha: 0.86)
                      : const Color(0xFF333333),
            ),
          ),
        ),
      ),
    );
  }
}

class _Ellipsis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 30,
      height: 36,
      alignment: Alignment.center,
      child: Text(
        '...',
        style: TextStyle(
          fontSize: 13,
          color: isDark ? Colors.white.withValues(alpha: 0.42) : const Color(0xFF999999),
        ),
      ),
    );
  }
}

class _PageNavButton extends StatelessWidget {
  final String label;
  final bool enabled;
  final VoidCallback onPressed;

  const _PageNavButton({
    required this.label,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: isDark ? const Color(0xFF1D1D1D) : Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: enabled ? onPressed : null,
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDark ? const Color(0xFF333333) : const Color(0xFFDDDDDD),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: enabled
                  ? (isDark ? Colors.white.withValues(alpha: 0.86) : const Color(0xFF333333))
                  : (isDark ? Colors.white.withValues(alpha: 0.42) : const Color(0xFF999999)),
            ),
          ),
        ),
      ),
    );
  }
}

/// 暂无数据占位
class _NewSongPlaceholder extends StatelessWidget {
  const _NewSongPlaceholder();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1D1D1D) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.08),
              blurRadius: isDark ? 28 : 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '新歌速递'.tr,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '暂无数据'.tr,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white.withValues(alpha: 0.6) : const Color(0xFF8B8F9C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

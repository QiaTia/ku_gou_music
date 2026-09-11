import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/top/top.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.controller.dart';

/// 发现歌单内容（对应 DiscoverPlaylistContent.vue）
class DiscoverPlaylistContent extends StatefulWidget {
  const DiscoverPlaylistContent({super.key});

  @override
  State<DiscoverPlaylistContent> createState() => _DiscoverPlaylistContentState();
}

class _DiscoverPlaylistContentState extends State<DiscoverPlaylistContent> {
  late final DiscoverPlaylistController controller;

  /// 组件私有滚动控制器：每个滚动视图独占一个，避免跨视图共享导致
  /// "ScrollController attached to multiple scroll views"
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscoverPlaylistController());
    Get.find<DiscoverController>().attachScroll(_scrollController);
  }

  @override
  void dispose() {
    Get.find<DiscoverController>().detachScroll(_scrollController);
    _scrollController.dispose();
    Get.delete<DiscoverPlaylistController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const _PlaylistSkeleton();
      }
      if (controller.isFailed.value && controller.playlists.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.grey),
              const SizedBox(height: 12),
              const Text('获取歌单失败'),
              TextButton(
                onPressed: controller.ensurePlaylistData,
                child: const Text('重试'),
              ),
            ],
          ),
        );
      }
      return Column(
        children: [
          const _CategoryBar(),
          const SizedBox(height: 24),
          Expanded(
            child: _PlaylistGrid(
              controller: controller,
              scrollController: _scrollController,
            ),
          ),
        ],
      );
    });
  }
}

/// 分类选择：主分类 + 子分类
class _CategoryBar extends StatelessWidget {
  const _CategoryBar();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverPlaylistController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Obx(() {
      if (controller.categories.isEmpty) return const SizedBox.shrink();
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF1D1D1D).withValues(alpha: 0.74)
              : Colors.white.withValues(alpha: 0.72),
          border: Border.all(
            color: isDark ? Colors.white.withValues(alpha: 0.08) : const Color(0xFFECEFF5),
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.22 : 0.06),
              blurRadius: isDark ? 30 : 28,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            // 主分类
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF25272E) : const Color(0xFFF3F5F8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final (index, category) in controller.categories.indexed)
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            onTap: () => controller.selectMainCategory(index),
                            child: Container(
                              height: 34,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: controller.selectedMain.value == index
                                    ? primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                category.tagName,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: controller.selectedMain.value == index
                                      ? Colors.white
                                      : isDark
                                          ? Colors.white.withValues(alpha: 0.6)
                                          : const Color(0xFF6B7280),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 子分类（单行横向滑动）
            Obx(() {
              final subs = controller.currentSubCategories;
              if (subs.isEmpty) return const SizedBox.shrink();
              // 在 Obx 作用域内读取，itemBuilder 是延迟执行的闭包
              final selectedSub = controller.selectedSub.value;
              return SizedBox(
                height: 32,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  itemCount: subs.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) => _SubCategoryChip(
                    label: subs[index].tagName,
                    active: selectedSub == index,
                    onTap: () => controller.selectSubCategory(index),
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}

class _SubCategoryChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _SubCategoryChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
            color: active
                ? primary.withValues(alpha: 0.1)
                : isDark
                    ? const Color(0xFF2A2A2A)
                    : const Color(0xFFF7F8FB),
            border: Border.all(
              color: active
                  ? primary.withValues(alpha: 0.32)
                  : isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : const Color(0xFFEDF0F5),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: active
                  ? primary
                  : isDark
                      ? Colors.white.withValues(alpha: 0.82)
                      : const Color(0xFF555F6F),
            ),
          ),
        ),
      ),
    );
  }
}

/// 歌单卡片网格
class _PlaylistGrid extends StatelessWidget {
  final DiscoverPlaylistController controller;
  final ScrollController scrollController;

  const _PlaylistGrid({required this.controller, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final items = controller.playlists;
      if (items.isEmpty) {
        return const Center(
          child: Text('暂无歌单', style: TextStyle(color: Colors.grey)),
        );
      }
      return GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.only(bottom: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 210,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: 0.72,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => _PlaylistCard(item: items[index]),
      );
    });
  }
}

class _PlaylistCard extends StatelessWidget {
  final PlaylistModel item;

  const _PlaylistCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final name = item.specialname ?? '';
    final intro = item.intro ?? '';
    final cover = item.flexibleCover ?? '';
    final gid = item.globalCollectionId ?? '';
    final specialid = item.specialid ?? 0;
    final detailId = gid.isNotEmpty ? gid : (specialid > 0 ? specialid.toString() : '');

    return Material(
      color: isDark ? const Color(0xFF1D1D1D) : Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: isDark ? 0.28 : 0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: detailId.isEmpty
            ? null
            : () => Get.toNamed(
                  '/playlist/detail',
                  arguments: {'id': detailId, 'name': name, 'pic': cover},
                ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: cover,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => Container(color: Colors.grey.withValues(alpha: 0.2)),
                    errorWidget: (_, _, _) => Container(
                      color: Colors.grey.withValues(alpha: 0.2),
                      child: const Icon(Icons.music_note, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white.withValues(alpha: 0.86) : Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: Text(
                  intro,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.6,
                    color: isDark ? Colors.white.withValues(alpha: 0.62) : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 加载骨架屏
class _PlaylistSkeleton extends StatelessWidget {
  const _PlaylistSkeleton();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF0F1F5);
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 210,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        childAspectRatio: 0.72,
      ),
      itemCount: 12,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1D1D1D) : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(height: 14, width: double.infinity, color: color),
            const SizedBox(height: 8),
            Container(height: 10, width: 100, color: color),
          ],
        ),
      ),
    );
  }
}

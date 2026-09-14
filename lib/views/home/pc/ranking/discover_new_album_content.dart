import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/discover/discover.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.controller.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking_layout.dart';

/// 新碟上架内容（对应 DiscoverNewAlbumContent.vue）
class DiscoverNewAlbumContent extends StatefulWidget {
  const DiscoverNewAlbumContent({super.key});

  @override
  State<DiscoverNewAlbumContent> createState() => _DiscoverNewAlbumContentState();
}

class _DiscoverNewAlbumContentState extends State<DiscoverNewAlbumContent> {
  late final DiscoverNewAlbumController controller;

  /// 组件私有滚动控制器：每个滚动视图独占一个，避免跨视图共享
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscoverNewAlbumController());
    Get.find<DiscoverController>().attachScroll(_scrollController);
  }

  @override
  void dispose() {
    Get.find<DiscoverController>().detachScroll(_scrollController);
    _scrollController.dispose();
    Get.delete<DiscoverNewAlbumController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const _AlbumSkeleton();
      }
      return Column(
        children: [
          const _AlbumTypeBar(),
          const SizedBox(height: 24),
          Expanded(
            child: _AlbumGrid(
              controller: controller,
              scrollController: _scrollController,
            ),
          ),
        ],
      );
    });
  }
}

/// 专辑类型选择：推荐 / 华语 / 欧美 / 日本 / 韩国
class _AlbumTypeBar extends StatelessWidget {
  const _AlbumTypeBar();

  static const _types = [
    ('', '推荐'),
    ('1', '华语'),
    ('2', '欧美'),
    ('3', '日本'),
    ('4', '韩国'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverNewAlbumController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      // 在 Obx 作用域内读取，itemBuilder 是延迟执行的闭包，不能在内部首次读取可观察变量
      final selectedType = controller.selectedType.value;
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
              blurRadius: 28,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            itemCount: _types.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final (value, label) = _types[index];
              return _AlbumTypeChip(
                label: label,
                active: selectedType == value,
                onTap: () => controller.selectAlbumType(value),
              );
            },
          ),
        ),
      );
    });
  }
}

class _AlbumTypeChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _AlbumTypeChip({
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

/// 专辑卡片网格
class _AlbumGrid extends StatelessWidget {
  final DiscoverNewAlbumController controller;
  final ScrollController scrollController;

  const _AlbumGrid({required this.controller, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final albums = controller.albums;
      if (albums.isEmpty) {
        return const Center(
          child: Text('暂无新碟', style: TextStyle(color: Colors.grey)),
        );
      }
      return GridView.builder(
        controller: scrollController,
        padding: EdgeInsets.only(bottom: DiscoverLayout.bottomInset(context)),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: DiscoverLayout.gridMaxExtent(context),
          mainAxisSpacing: DiscoverLayout.gridSpacing(context),
          crossAxisSpacing: DiscoverLayout.gridSpacing(context),
          childAspectRatio: DiscoverLayout.gridAspectRatio(context),
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) => _AlbumCard(album: albums[index]),
      );
    });
  }
}

class _AlbumCard extends StatelessWidget {
  final DiscoverAlbum album;

  const _AlbumCard({required this.album});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final description = [
      album.singername,
      album.publishtime.split(' ').first,
      if (album.songcount > 0) '${album.songcount}首',
    ].where((e) => e.isNotEmpty).join(' · ');

    return Material(
      color: isDark ? const Color(0xFF1D1D1D) : Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: isDark ? 0.28 : 0.1),
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
                  imageUrl: album.imgurl,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => Container(color: Colors.grey.withValues(alpha: 0.2)),
                  errorWidget: (_, _, _) => Container(
                    color: Colors.grey.withValues(alpha: 0.2),
                    child: const Icon(Icons.album, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              album.albumname,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white.withValues(alpha: 0.86) : Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            // Expanded 让简介自适应剩余空间，避免固定高度在小宽度卡片下溢出
            Expanded(
              child: Text(
                description,
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
    );
  }
}

/// 加载骨架屏
class _AlbumSkeleton extends StatelessWidget {
  const _AlbumSkeleton();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF0F1F5);
    return GridView.builder(
      padding: EdgeInsets.only(bottom: DiscoverLayout.bottomInset(context)),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: DiscoverLayout.gridMaxExtent(context),
        mainAxisSpacing: DiscoverLayout.gridSpacing(context),
        crossAxisSpacing: DiscoverLayout.gridSpacing(context),
        childAspectRatio: DiscoverLayout.gridAspectRatio(context),
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
            Container(height: 10, width: 120, color: color),
          ],
        ),
      ),
    );
  }
}

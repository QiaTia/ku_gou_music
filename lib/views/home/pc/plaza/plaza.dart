import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'package:ku_gou_music/views/home/pc/plaza/plaza.controller.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:layout/layout.dart';

const _pinkColor = Color(0xFFFF5E8A);
const _pinkBgColor = Color(0xFFFFEEF3);
const _greyBgColor = Color(0xFFF5F5F5);
const _greyBorderColor = Color(0xFFE8E8E8);

class PlazaPage extends StatelessWidget {
  const PlazaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlazaController());
    final double spacing = context.layout.value(xs: 6, sm: 8, md: 10);
    final int crossAxisCount = context.layout.value(xs: 2, sm: 3, md: 4, lg: 5);
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;

    return Scaffold(
      appBar: isMobile ? null : TitleBar(),
      body: Obx(() {
        if (controller.isLoadingTags.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.isFailed.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                const SizedBox(height: 12),
                const Text('获取分类失败'),
                TextButton(
                  onPressed: controller.loadTags,
                  child: const Text('重试'),
                ),
              ],
            ),
          );
        }
        return Column(
          children: [
            _ParentTagBar(controller: controller),
            const SizedBox(height: 4),
            _ChildTagBar(controller: controller),
            const SizedBox(height: 8),
            Expanded(
              child: _PlaylistGrid(
                controller: controller,
                spacing: spacing,
                crossAxisCount: crossAxisCount,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _ParentTagBar extends StatelessWidget {
  final PlazaController controller;
  const _ParentTagBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.parentTags.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12),
            child: _ParentTagChip(
              controller: controller,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class _ParentTagChip extends StatelessWidget {
  final PlazaController controller;
  final int index;
  const _ParentTagChip({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    final tag = controller.parentTags[index];
    return Obx(() {
      final isSelected = controller.selectedParentIndex.value == index;
      return GestureDetector(
        onTap: () => controller.selectParent(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? _pinkColor : _greyBgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            tag.tagName,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }
}

class _ChildTagBar extends StatelessWidget {
  final PlazaController controller;
  const _ChildTagBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.childTags.isEmpty) return const SizedBox.shrink();
      return SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: controller.childTags.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return _ChildTagChip(controller: controller, index: index);
          },
        ),
      );
    });
  }
}

class _ChildTagChip extends StatelessWidget {
  final PlazaController controller;
  final int index;
  const _ChildTagChip({required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    final tag = controller.childTags[index];
    return Obx(() {
      final isSelected = controller.selectedChildIndex.value == index;
      return GestureDetector(
        onTap: () => controller.selectChild(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          decoration: BoxDecoration(
            color: isSelected ? _pinkBgColor : _greyBgColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? _pinkColor : _greyBorderColor,
              width: 1,
            ),
          ),
          child: Text(
            tag.tagName,
            style: TextStyle(
              color: isSelected ? _pinkColor : Colors.black54,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }
}

class _PlaylistGrid extends StatelessWidget {
  final PlazaController controller;
  final double spacing;
  final int crossAxisCount;

  const _PlaylistGrid({
    required this.controller,
    required this.spacing,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingPlaylist.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.playlistResults.isEmpty) {
        return const Center(child: Text('暂无歌单', style: TextStyle(color: Colors.grey)));
      }
      return GridView.builder(
        padding: EdgeInsets.all(spacing),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: 0.82,
        ),
        itemCount: controller.playlistResults.length,
        itemBuilder: (context, index) {
          final item = controller.playlistResults[index];
          return _PlaylistCard(item: item);
        },
      );
    });
  }
}

class _PlaylistCard extends StatelessWidget {
  final dynamic item;
  const _PlaylistCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final LocalRouterController routerController = Get.find();
    final String name = (item.specialname ?? '').replaceAll(RegExp('\\s+'), ' ');
    final String cover = item.flexibleCover ?? '';
    final String intro = item.intro ?? '';

    return InkWell(
      onTap: () {
        routerController.navigateTo('/playlist/detail', {
          'id': item.globalCollectionId,
          'name': name,
          'pic': cover,
        });
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: SizedBox(
                  width: double.infinity,
                  child: cover.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: cover,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: _greyBgColor,
                            child: const Center(child: Icon(Icons.music_note, color: Colors.grey)),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: _greyBgColor,
                            child: const Center(child: Icon(Icons.music_note, color: Colors.grey)),
                          ),
                        )
                      : Container(
                          color: _greyBgColor,
                          child: const Center(child: Icon(Icons.music_note, color: Colors.grey)),
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        intro,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[500],
                          height: 1.3,
                        ),
                      ),
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

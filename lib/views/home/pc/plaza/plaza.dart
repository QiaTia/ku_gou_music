import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'package:ku_gou_music/views/home/pc/plaza/plaza.controller.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:layout/layout.dart';

const _greyBgColor = Color(0xFFF5F5F5);

class PlazaPage extends StatelessWidget {
  const PlazaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlazaController());
    final double spacing = context.layout.value(xs: 6, sm: 8, md: 10);
    final int crossAxisCount = context.layout.value(xs: 2, sm: 3, md: 4, lg: 5);
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;
    final paddingTop = MediaQuery.of(context).padding.top;

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
            SizedBox(height: paddingTop),
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

class _ParentTagBar extends StatefulWidget {
  final PlazaController controller;
  const _ParentTagBar({required this.controller});

  @override
  State<_ParentTagBar> createState() => _ParentTagBarState();
}

class _ParentTagBarState extends State<_ParentTagBar> {
  final List<GlobalKey> _keys = [];

  GlobalKey _keyFor(int index) {
    while (_keys.length <= index) {
      _keys.add(GlobalKey());
    }
    return _keys[index];
  }

  /// 点击后把激活项滚动到可视区域中间
  void _scrollToCenter(int index) {
    final key = _keyFor(index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = key.currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          alignment: 0.5,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.controller.parentTags.length,
        itemBuilder: (context, index) {
          return _ParentTagChip(
            key: _keyFor(index),
            controller: widget.controller,
            index: index,
            onActivate: () => _scrollToCenter(index),
          );
        },
      ),
    );
  }
}

/// 液态玻璃风格的标签药丸，与底部 TabBar 的玻璃质感保持一致。
class _LiquidGlassChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color themeColor;
  final double radius;
  final EdgeInsets padding;
  final double fontSize;

  const _LiquidGlassChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.themeColor,
    required this.radius,
    required this.padding,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: padding,
            decoration: BoxDecoration(
              // 选中态：主题色玻璃；未选中：半透明白色磨砂玻璃
              color: isSelected
                  ? themeColor.withValues(alpha: 0.85)
                  : const Color(0x33FFFFFF),
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: isSelected
                    ? themeColor.withValues(alpha: 0.9)
                    : Colors.white.withValues(alpha: 0.35),
                width: 0.8,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.9),
                fontSize: fontSize,
                fontWeight:
                    isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ParentTagChip extends StatelessWidget {
  final PlazaController controller;
  final int index;
  final VoidCallback onActivate;
  const _ParentTagChip({
    super.key,
    required this.controller,
    required this.index,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    final tag = controller.parentTags[index];
    final themeColor = Theme.of(context).colorScheme.primary;
    return Obx(() {
      final isSelected = controller.selectedParentIndex.value == index;
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: _LiquidGlassChip(
          label: tag.tagName,
          isSelected: isSelected,
          onTap: () {
            controller.selectParent(index);
            onActivate();
          },
          themeColor: themeColor,
          radius: 20,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          fontSize: 14,
        ),
      );
    });
  }
}

class _ChildTagBar extends StatefulWidget {
  final PlazaController controller;
  const _ChildTagBar({required this.controller});

  @override
  State<_ChildTagBar> createState() => _ChildTagBarState();
}

class _ChildTagBarState extends State<_ChildTagBar> {
  final List<GlobalKey> _keys = [];

  GlobalKey _keyFor(int index) {
    while (_keys.length <= index) {
      _keys.add(GlobalKey());
    }
    return _keys[index];
  }

  /// 点击后把激活项滚动到可视区域中间
  void _scrollToCenter(int index) {
    final key = _keyFor(index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = key.currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(
          ctx,
          alignment: 0.5,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.controller.childTags.isEmpty) return const SizedBox.shrink();
      return SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: widget.controller.childTags.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return _ChildTagChip(
              key: _keyFor(index),
              controller: widget.controller,
              index: index,
              onActivate: () => _scrollToCenter(index),
            );
          },
        ),
      );
    });
  }
}

class _ChildTagChip extends StatelessWidget {
  final PlazaController controller;
  final int index;
  final VoidCallback onActivate;
  const _ChildTagChip({
    super.key,
    required this.controller,
    required this.index,
    required this.onActivate,
  });

  @override
  Widget build(BuildContext context) {
    final tag = controller.childTags[index];
    final themeColor = Theme.of(context).colorScheme.primary;
    return Obx(() {
      final isSelected = controller.selectedChildIndex.value == index;
      return _LiquidGlassChip(
        label: tag.tagName,
        isSelected: isSelected,
        onTap: () {
          controller.selectChild(index);
          onActivate();
        },
        themeColor: themeColor,
        radius: 18,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        fontSize: 13,
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
        return const Center(
          child: Text('暂无歌单', style: TextStyle(color: Colors.grey)),
        );
      }
      return GridView.builder(
        padding: EdgeInsets.all(spacing),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: 0.82,
        ),
        itemCount: controller.playlistResults.length + 1,
        itemBuilder: (context, index) {
          if (index == controller.playlistResults.length) {
            return SizedBox(height: 4);
          }
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
    final String name = (item.specialname ?? '').replaceAll(
      RegExp('\\s+'),
      ' ',
    );
    final String cover = item.flexibleCover ?? '';
    final String intro = item.intro ?? '';

    return InkWell(
      onTap: () {
        Get.toNamed(
          '/playlist/detail',
          arguments: {
            'id': item.globalCollectionId,
            'name': name,
            'pic': cover,
          },
        );
        // routerController.navigateTo('/playlist/detail', {
        //   'id': item.globalCollectionId,
        //   'name': name,
        //   'pic': cover,
        // });
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: cover.isNotEmpty
                      ? Hero(
                          tag: item.globalCollectionId,
                          child: CachedNetworkImage(
                            imageUrl: cover,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: _greyBgColor,
                              child: const Center(
                                child: Icon(
                                  Icons.music_note,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: _greyBgColor,
                              child: const Center(
                                child: Icon(
                                  Icons.music_note,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          color: _greyBgColor,
                          child: const Center(
                            child: Icon(Icons.music_note, color: Colors.grey),
                          ),
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

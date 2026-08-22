import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/views/music/player_screen.dart';
import 'package:ku_gou_music/widgets/rotating_album_cover.dart';

/// 液态玻璃风格悬浮 TabBar
///
/// 参考样式：胶囊形磨砂玻璃底栏，内部选项卡为固定宽度（选中不会变宽），
/// 右侧为当前播放歌曲的旋转封面组件，与左侧选项卡垂直居中对齐。
class LiquidGlassBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final MusicController musicController;

  const LiquidGlassBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.musicController,
  });

  static const _items = [
    _BarItem(icon: Icons.home, label: '首页'),
    _BarItem(icon: Icons.all_inclusive_sharp, label: '广场'),
    _BarItem(icon: Icons.trending_up, label: '排行榜'),
    _BarItem(icon: Icons.playlist_play, label: '我的'),
  ];

  /// 单个选项卡固定宽度（选中态不再加横向内边距，宽度保持不变）
  static const double _itemWidth = 60.0;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 主胶囊容器
        ClipRRect(
          borderRadius: BorderRadius.circular(34),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              height: 66,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x40FFFFFF),
                    Color(0x1AFFFFFF),
                  ],
                ),
                borderRadius: BorderRadius.circular(34),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.32),
                  width: 0.8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(_items.length, (i) {
                  return _BarItemWidget(
                    item: _items[i],
                    isSelected: i == currentIndex,
                    activeBg: themeColor,
                    onTap: () => onTap(i),
                  );
                }),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // 右侧：当前播放歌曲的旋转封面组件（取代原搜索按钮）
        _AlbumCoverButton(controller: musicController),
      ],
    );
  }
}

class _BarItem {
  final IconData icon;
  final String label;

  const _BarItem({
    required this.icon,
    required this.label,
  });
}

class _BarItemWidget extends StatelessWidget {
  final _BarItem item;
  final bool isSelected;
  final Color activeBg;
  final VoidCallback onTap;

  const _BarItemWidget({
    required this.item,
    required this.isSelected,
    required this.activeBg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor =
        isSelected ? Colors.white : Colors.white.withValues(alpha: 0.75);

    // 固定宽度容器：选中态的药丸背景尺寸恒定，不会撑宽整项
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: LiquidGlassBottomBar._itemWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              width: 48,
              height: 38,
              alignment: Alignment.center,
              decoration: isSelected
                  ? BoxDecoration(
                      color: activeBg.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: activeBg.withValues(alpha: 0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    )
                  : null,
              child: Icon(
                item.icon,
                size: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 1),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: labelColor,
                letterSpacing: 0.2,
                height: 1.1,
              ),
              child: Text(item.label),
            ),
          ],
        ),
      ),
    );
  }
}

/// 右侧当前播放歌曲封面组件（液态玻璃圆形）
///
/// 复刻原始中间 FAB 的 [RotatingAlbumCover]，置于右侧并与左侧选项卡垂直对齐。
class _AlbumCoverButton extends StatelessWidget {
  final MusicController controller;

  const _AlbumCoverButton({required this.controller});

  void _openPlayer() {
    Get.to(() => const MusicPlayerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          width: 58,
          height: 58,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x40FFFFFF),
                Color(0x1AFFFFFF),
              ],
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.32),
              width: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: _openPlayer,
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: RotatingAlbumCover(
                    musicController: controller,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

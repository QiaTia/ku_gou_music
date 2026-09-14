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
    _BarItem(icon: Icons.explore, label: '发现'),
    _BarItem(icon: Icons.history, label: '最近播放'),
    _BarItem(icon: Icons.playlist_play, label: '我的'),
  ];

  /// 单个选项卡的最大宽度（窄屏会按可用宽度收敛，避免溢出）
  static const double _maxItemWidth = 60.0;

  /// 右侧圆形封面直径
  static const double _albumCoverSize = 58.0;

  /// 胶囊与封面之间的间隔
  static const double _gap = 12.0;

  /// 胶囊左右内边距
  static const double _pillPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.primary;

    // 窄屏收敛：4 项 + 右侧封面在 360px 级屏幕上按最大宽度会溢出，
    // 这里按可用宽度反推每项宽度（下限 46，保证图标 22 + 文字可容纳）。
    final available = MediaQuery.sizeOf(context).width;
    final pillChrome = _pillPadding * 2 + _gap + _albumCoverSize;
    final itemWidth = ((available - pillChrome - 16) / _items.length)
        .clamp(46.0, _maxItemWidth)
        .toDouble();

    // 选项卡药丸背景宽度（比单元格窄，居中显示）
    final pillWidth = (itemWidth - 12).clamp(36.0, 48.0).toDouble();

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
              padding: const EdgeInsets.symmetric(horizontal: _pillPadding),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x40FFFFFF), Color(0x1AFFFFFF)],
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
                    width: itemWidth,
                    pillWidth: pillWidth,
                    onTap: () => onTap(i),
                  );
                }),
              ),
            ),
          ),
        ),
        const SizedBox(width: _gap),
        // 右侧：当前播放歌曲的旋转封面组件（取代原搜索按钮）
        _AlbumCoverButton(controller: musicController, size: _albumCoverSize),
      ],
    );
  }
}

class _BarItem {
  final IconData icon;
  final String label;

  const _BarItem({required this.icon, required this.label});
}

class _BarItemWidget extends StatelessWidget {
  final _BarItem item;
  final bool isSelected;
  final Color activeBg;
  final double width;
  final double pillWidth;
  final VoidCallback onTap;

  const _BarItemWidget({
    required this.item,
    required this.isSelected,
    required this.activeBg,
    required this.width,
    required this.pillWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor = isSelected
        ? Colors.white
        : Colors.white.withValues(alpha: 0.75);

    // 固定宽度容器：选中态的药丸背景尺寸恒定，不会撑宽整项
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: width,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          width: pillWidth,
          height: 40,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2,
            children: [
              Icon(item.icon, size: 22, color: Colors.white),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                style: TextStyle(
                  fontSize: item.label.length > 2 ? 9 : 10,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: labelColor,
                  letterSpacing: 0.2,
                  height: 1.1,
                ),
                child: Text(
                  item.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 1),
            ],
          ),
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
  final double size;

  const _AlbumCoverButton({required this.controller, required this.size});

  void _openPlayer() {
    Get.to(() => const MusicPlayerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x40FFFFFF), Color(0x1AFFFFFF)],
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
                  width: size - 8,
                  height: size - 8,
                  child: RotatingAlbumCover(musicController: controller),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

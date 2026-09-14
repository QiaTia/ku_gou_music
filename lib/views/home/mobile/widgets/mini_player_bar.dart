import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/views/music/player_screen.dart';
import 'package:ku_gou_music/widgets/rotating_album_cover.dart';

/// 底部迷你播放信息条
///
/// 从 TabBar 中抽离出的歌曲播放信息，作为独立层级置于悬浮 TabBar 后方。
/// 当没有正在播放歌曲时返回空占位，不占用布局空间。
class MiniPlayerBar extends StatelessWidget {
  final MusicController controller;

  const MiniPlayerBar({
    super.key,
    required this.controller,
  });

  void _openPlayer() {
    Get.to(() => const MusicPlayerScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final song = controller.currentSong;
      if (song == null) return const SizedBox.shrink();

      return GestureDetector(
        onTap: _openPlayer,
        behavior: HitTestBehavior.opaque,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A).withValues(alpha: 0.82),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  // 专辑封面
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: RotatingAlbumCover(
                      musicController: controller,
                      ignoreHero: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 歌曲信息
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          song.author,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[400],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  // 播放控制
                  _PlayControlButton(controller: controller),
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white, size: 26),
                    onPressed: controller.nextSong,
                  ),
                  IconButton(
                    icon: const Icon(Icons.playlist_play, color: Colors.white, size: 26),
                    onPressed: () => Get.toNamed('/playlist'),
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

class _PlayControlButton extends StatelessWidget {
  final MusicController controller;

  const _PlayControlButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: Icon(
          controller.isBuffering
              ? Icons.hourglass_bottom
              : (controller.isPlaying ? Icons.pause : Icons.play_arrow),
          color: Colors.white,
          size: 30,
        ),
        onPressed: controller.togglePlayPause,
      ),
    );
  }
}

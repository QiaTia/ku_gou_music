import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/widgets/rotating_album_cover.dart';

final iconColor = Color(0xFFBDBDBD);

/// 液态玻璃风格底部控制栏
///
/// 与移动端 LiquidGlassBottomBar 保持一致的材质配方：
/// BackdropFilter 高斯模糊 + 半透明深色渐变 + 顶部白色高光描边，
/// 页面内容在底栏下方滚动时可透出磨砂玻璃质感。
class BottomControl extends GetView<MusicController> {
  const BottomControl({super.key});

  void onPlayerPage() {
    Get.toNamed('/player');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
            // 深色半透明玻璃：顶部高光过渡到深色主体，保证白色图标可读
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.15, 1.0],
              colors: [
                Colors.white.withValues(alpha: 0.14),
                Color(0x8C37333F),
                Color(0xD9262330),
              ],
            ),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.22),
                width: 0.8,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .center,
            children: [
              currentSongTile(context),
              playControls(context),
              otherControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumCover() {
    return RotatingAlbumCover(musicController: controller);
  }

  Widget currentSongTile(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Obx(() {
        final song = controller.currentSong;
        return InkWell(
          onTap: onPlayerPage,
          child: Row(
            spacing: 8,
            children: [
              SizedBox(width: 8),
              SizedBox(width: 58, height: 58, child: _buildAlbumCover()),
              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      song?.name ?? '无',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                      textAlign: .left,
                    ),
                    Text(
                      song?.author ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: .left,
                      style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget playControls(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: 'playControls',
        child: Row(
          mainAxisAlignment: .center,
          children: [
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.white, size: 25),
              // tooltip: '收藏',
              onPressed: () {
                Get.snackbar('收藏', '暂未实现');
              },
            ),
            IconButton(
              color: iconColor,
              icon: Icon(Icons.skip_previous, color: Colors.white, size: 25),
              onPressed: controller.previousSong,
              tooltip: '上一曲',
            ),
            IconButton(
              color: iconColor,
              icon: Obx(
                () => Icon(
                  controller.isBuffering
                      ? Icons.hourglass_bottom
                      : (controller.isPlaying ? Icons.pause : Icons.play_arrow),
                  color: Colors.white,
                  size: 32,
                ),
              ),
              tooltip: '播放 / 暂停',
              onPressed: controller.togglePlayPause,
            ),
            IconButton(
              color: iconColor,
              icon: Icon(Icons.skip_next, color: Colors.white, size: 25),
              onPressed: controller.nextSong,
              tooltip: '下一曲',
            ),
            Obx(() {
              IconData icon;
              String tooltip;
              switch (controller.loopMode) {
                case LoopMode.one:
                  icon = Icons.repeat_one;
                  tooltip = '单曲循环';
                  break;
                case LoopMode.all:
                  icon = Icons.repeat;
                  tooltip = '列表循环';
                  break;
                default:
                  icon = Icons.shuffle;
                  tooltip = '随机播放';
              }
              return IconButton(
                color: iconColor,
                icon: Icon(icon, color: Colors.white, size: 25),
                tooltip: tooltip,
                onLongPress: () {
                  /// ...
                },
                onPressed: () {
                  final current = controller.loopMode;
                  if (current == LoopMode.off) {
                    controller.setLoopMode(LoopMode.all);
                  } else if (current == LoopMode.all) {
                    controller.setLoopMode(LoopMode.one);
                  } else {
                    controller.setLoopMode(LoopMode.off);
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget otherControls() {
    return SizedBox(
      width: 220,
      child: Row(
        children: [
          Spacer(),
          IconButton(
            color: iconColor,
            icon: Icon(Icons.list_alt, color: Colors.white, size: 25),
            tooltip: '播放列表',
            onPressed: () {
              Get.toNamed('/playlist');
            },
          ),

          /// 音量控制
          // Speaker(color: iconColor),
          // Center(
          //   child: SizedBox(
          //     height: 20,
          //     width: 120,
          //     child: ValueListenableBuilder(
          //       valueListenable: volumeNotifier,
          //       builder: (context, value, child) {
          //         return SliderTheme(
          //           data: SliderTheme.of(context).copyWith(
          //             trackHeight: 2,
          //             trackShape: const FullWidthTrackShape(),
          //             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
          //             overlayColor: Colors.transparent,
          //             activeTrackColor: volumeBarColor,
          //             inactiveTrackColor: Colors.black12,
          //             thumbColor: Colors.black,
          //           ),
          //           child: Slider(
          //             value: value,
          //             min: 0,
          //             max: 1,
          //             onChanged: (value) {
          //               volumeNotifier.value = value;
          //               audioHandler.setVolume(value);
          //             },
          //             onChangeEnd: (value) {
          //               audioHandler.savePlayState();
          //             },
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}

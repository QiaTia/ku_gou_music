import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';

final bgColor = const Color.fromARGB(255, 44, 41, 51);

final iconColor = Color(0xFFBDBDBD);

class BottomControl extends GetView<MusicController> {
  const BottomControl({super.key});

  void onPlayerPage() {
    Get.toNamed('/player');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        color: bgColor,
        width: constraints.maxWidth,
        height: 75,
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
    );
  }

  Widget _buildAlbumCover() {
    return Obx(() {
      final song = controller.currentSong;
      return Hero(
        tag: '_buildAlbumCover',
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child:
              ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: song == null
                        ? Container(
                            color: Colors.grey[800],
                            child: Center(
                              child: Icon(
                                Icons.music_note,
                                size: 100,
                                color: Colors.grey[600],
                              ),
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: song.cover,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.music_note),
                          ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .rotate(
                    duration: Duration(milliseconds: 500), // 旋转一圈用时2秒
                    begin: 360, // 开始角度
                    end: 0, // 结束角度（360度）
                    curve: Curves.linear, // 线性曲线（匀速旋转）)
                  ),
        ),
      );
    });
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
              tooltip: '收藏',
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
              }
            ),
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

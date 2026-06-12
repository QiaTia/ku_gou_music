import 'package:flutter/material.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ku_gou_music/api/song/song.dart';
import 'package:ku_gou_music/widgets/rotating_album_cover.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../controllers/music_controller.dart';

class MusicPlayerScreen extends GetView<MusicController> {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 41, 51),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            isMobile
                ? _buildContent(_SongLyric(height: 88))
                : Expanded(
                    child: Row(children: [
                      _buildContent(),
                      Expanded(child: _SongLyric()),
                    ]),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildContent([Widget? child]) {
    return Expanded(
      child: Column(
        children: [
          Expanded(child: _buildAlbumCover()),
          if (child != null) child,
          _buildSongInfo(),
          _buildProgressBar(),
          _buildControlButtons(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              switch (value) {
                case 'playlist':
                  Get.toNamed('/playlist');
                  break;
                case 'share':
                  break;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'playlist',
                child: Row(
                  children: [
                    Icon(Icons.queue_music),
                    SizedBox(width: 8),
                    Text('播放列表'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'share',
                child: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(width: 8),
                    Text('分享'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumCover() {
    return RotatingAlbumCover(musicController: controller);
  }

  Widget _buildSongInfo() {
    return Obx(() {
      final song = controller.currentSong;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              song?.name ?? '暂无播放',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(
              song?.author ?? '未知艺术家',
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildProgressBar() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            LinearPercentIndicator(
              animation: false,
              lineHeight: 4,
              percent: controller.progress.clamp(0.0, 1.0),
              backgroundColor: Colors.grey[800]!,
              progressColor: Colors.blueAccent,
              barRadius: Radius.circular(2),
              padding: EdgeInsets.zero,
              onPercentValue: (value) {
                print(value);
              },
              onAnimationEnd: () {
                if (controller.isPlaying) {
                  controller.togglePlayPause();
                }
              },
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.currentTime,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                  Text(
                    controller.totalTime,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildControlButtons() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        child: Hero(
          tag: 'playControls',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.grey[400],
                  size: 24,
                ),
                tooltip: '收藏',
                onPressed: () {
                  Get.snackbar('收藏', '暂未实现');
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_previous, color: Colors.white, size: 32),
                onPressed: controller.previousSong,
                tooltip: '上一曲',
              ),
              IconButton(
                icon: Icon(
                  controller.isBuffering
                      ? Icons.hourglass_bottom
                      : (controller.isPlaying ? Icons.pause : Icons.play_arrow),
                  color: Colors.white,
                  size: 32,
                ),
                tooltip: '播放 / 暂停',
                onPressed: controller.togglePlayPause,
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color: Colors.white, size: 32),
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
                  icon: Icon(icon, color: Colors.white, size: 32),
                  tooltip: tooltip,
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
    });
  }
}


class _SongLyric extends StatefulWidget {
  final double? height;
  const _SongLyric({this.height});

  @override
  State<StatefulWidget> createState() => _SongLyricState();
}

class _SongLyricState extends State<_SongLyric> {
  final lrcController = LyricController();
  final controller = Get.find<MusicController>();
  String loadHash = '';
  late Worker worker;

  @override
  void initState() {
    super.initState();
    if (loadHash != controller.currentSong?.hash) onInitLyric();
    worker = ever(controller.audioService.currentSong, (val) {
      onInitLyric();
    });
  }

  void onInitLyric() async {
    final song = controller.currentSong;
    if (song != null) {
      final lrcPre =
          ((await searchLyrics(hash: song.hash)).body!['candidates'] ?? [])[0];
      final lrcContent = await getMusicLyrics(
          accesskey: lrcPre['accesskey'], id: lrcPre['id'], fmt: 'lrc');
      lrcController.loadLyric(lrcContent['content'] ?? '[00:00.000] 暂无歌词');
      loadHash = song.hash;
    }
  }

  @override
  void dispose() {
    lrcController.dispose();
    worker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.currentSong != null) {
        lrcController.setProgress(controller.position);
      }
      return LyricView(
        controller: lrcController,
        style: LyricStyles.default1,
        width: double.infinity,
        height: widget.height ?? double.infinity,
      );
    });
  }
}

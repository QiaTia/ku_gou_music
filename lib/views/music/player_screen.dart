import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ku_gou_music/api/song/song.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../controllers/music_controller.dart';

class MusicPlayerScreen extends GetView<MusicController> {
  const MusicPlayerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    /// 获取屏幕尺寸
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 41, 51),
      body: SafeArea(
        child: Column(
          children: [
            // 顶部栏
            _buildAppBar(),
            isMobile ?
              _buildContent(_SongLyric(height: 88,)):
              Expanded(child: 
                Row(children: [
                  _buildContent(),
                  Expanded(child: _SongLyric()),
                ]))
          ],
        ),
      ),
    );
  }
  /// 内容区域
  Widget _buildContent([Widget? child]) {
    return Expanded(child: Column(
      children: [
        // 专辑封面区域
        Expanded(child: _buildAlbumCover()),
        // 歌词预留容器
        ?child,
        // 歌曲信息
        _buildSongInfo(),
        // 进度条
        _buildProgressBar(),
        // 控制按钮
        _buildControlButtons(),
        // 附加控制
        // _buildExtraControls(),
        SizedBox(height: 20),
      ],
    ));
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
              // 处理菜单选择
              switch (value) {
                case 'playlist':
                  Get.toNamed('/playlist');
                  break;
                case 'share':
                  // 分享
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
    return Obx(() {
      final song = controller.currentSong;
      return Hero(tag: '_buildAlbumCover', child: Container(
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
        child: ClipRRect(
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
          )
        ));
    });
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
                // fontWeight: FontWeight.bold,
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
        child: Hero(tag: 'playControls', child: Row(
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
            // 随机播放
            // IconButton(
            //   icon: Icon(
            //     Icons.shuffle,
            //     color: controller.isShuffled ? Colors.blueAccent : Colors.grey[400],
            //     size: 28,
            //   ),
            //   onPressed: controller.toggleShuffle,
            // ),
            // 上一曲
            IconButton(
              icon: Icon(Icons.skip_previous, color: Colors.white, size: 32),
              onPressed: controller.previousSong,
              tooltip: '上一曲',
            ),
            // 播放/暂停
            IconButton(
              icon: Icon(
                controller.isBuffering
                    ? Icons.hourglass_bottom
                    : (controller.isPlaying ? Icons.pause : Icons.play_arrow),
                color: Colors.white,
                size: 32
              ),
              tooltip: '播放 / 暂停',
              onPressed: controller.togglePlayPause,
            ),
            // 下一曲
            IconButton(
              icon: Icon(Icons.skip_next, color: Colors.white, size: 32),
              onPressed: controller.nextSong,
              tooltip: '下一曲',
            ),
            // 循环模式
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
        )),
      );
    });
  }

  Widget _buildExtraControls() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey[400],
                size: 24,
              ),
              onPressed: () {},
            ),
            // 音量控制
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.volume_down, color: Colors.grey[400], size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 2,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 8,
                          disabledThumbRadius: 6,
                        ),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                        activeTrackColor: Colors.blueAccent,
                        inactiveTrackColor: Colors.grey[700],
                        thumbColor: Colors.white,
                      ),
                      child: Slider(
                        value: controller.volume,
                        onChanged: (value) {
                          controller.setVolume(value);
                        },
                        min: 0.0,
                        max: 1.0,
                        divisions: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.volume_up, color: Colors.grey[400], size: 20),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.playlist_play,
                color: Colors.grey[400],
                size: 24,
              ),
              onPressed: () {
                Get.toNamed('/playlist');
              },
            ),
          ],
        ),
      );
    });
  }
}


class _SongLyric extends StatefulWidget {
  final double? height;
  const _SongLyric({ this.height });

  @override
  State<StatefulWidget> createState() => _SongLyricState();
}

class _SongLyricState extends State<_SongLyric> {
  final lrcController = LyricController();
  final controller = Get.find<MusicController>();
  String loadHash = '';
  /// 监听歌曲切换
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
      final lrcPre = ((await searchLyrics(hash: song.hash)).body!['candidates'] ?? [])[0];
      final lrcContent = await getMusicLyrics(accesskey: lrcPre['accesskey'], id: lrcPre['id'], fmt: 'lrc');
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
        style: LyricStyles.default1, // 可选，默认使用 LyricStyles.default1
        width: double.infinity,
        height: widget.height ?? double.infinity,
      );
    });
  }
}


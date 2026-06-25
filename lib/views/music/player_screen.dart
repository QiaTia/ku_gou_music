import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/flutter_lyric.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ku_gou_music/api/song/song.dart';
import 'package:ku_gou_music/widgets/rotating_album_cover.dart';
import '../../controllers/music_controller.dart';

class MusicPlayerScreen extends GetView<MusicController> {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
            ],
          ),
        ),
        child: Stack(
          children: [
            _buildGlassParticles(),
            SafeArea(
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
          ],
        ),
      ),
    );
  }

  Widget _buildGlassParticles() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.4,
        child: CustomPaint(
          painter: GlassParticlePainter(),
        ),
      ),
    );
  }

  Widget _buildContent([Widget? child]) {
    return Expanded(
      child: Column(
        children: [
          Expanded(flex: 4,child: _buildAlbumCover(),),
          if (child != null) Expanded(flex: 3, child: child),
          _buildGlassCard(
            child: Builder(
              builder: (context) => Column(
                children: [
                  _buildSongInfo(),
                  _buildProgressBar(context),
                  _buildControlButtons(),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildGlassCard({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  blurRadius: 30,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: child,
          ),
        ),
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
        padding: const EdgeInsets.only(bottom: 8),
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

  Widget _buildProgressBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: _GlassThumbShape(),
              trackShape: _GlassTrackShape(),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 12),
              overlayColor: Colors.blue.withValues(alpha: 0.3),
            ),
            child: Obx(() {
              return Slider(
                value: controller.progress.clamp(0.0, 1.0),
                min: 0.0,
                max: 1.0,
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.white.withValues(alpha: 0.2),
                onChangeStart: (_) {},
                onChangeEnd: (value) {
                  controller.seekTo(value);
                },
                onChanged: (value) {
                  controller.seekTo(value);
                },
              );
            }),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Obx(() => Text(
                  controller.currentTime,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12),
                )),
                Obx(() => Text(
                  controller.totalTime,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12),
                )),
              ],
            ),
          ),
        ],
      ),
    );
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

class _GlassThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(16, 16);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final rect = Rect.fromCircle(center: center, radius: 8);

    final gradient = RadialGradient(
      colors: [
        Colors.white.withOpacity(0.9),
        Colors.blueAccent.withOpacity(0.6),
      ],
      stops: [0.3, 1.0],
    );

    final shadowPaint = Paint()
      ..color = Colors.blueAccent.withValues(alpha: 0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(center, 12, shadowPaint);

    canvas.drawCircle(
      center,
      8,
      Paint()..color = Colors.white.withOpacity(0.2),
    );

    canvas.drawCircle(
      center,
      7,
      Paint()..shader = gradient.createShader(rect),
    );

    canvas.drawCircle(
      center - Offset(2, 2),
      3,
      Paint()..color = Colors.white.withOpacity(0.8),
    );
  }
}

class _GlassTrackShape extends RoundedRectSliderTrackShape {
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    double? additionalActiveTrackHeight,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
  }) {
    final canvas = context.canvas;
    final trackHeight = sliderTheme.trackHeight ?? 4;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;

    final activeRect = Rect.fromLTWH(
      trackLeft,
      trackTop,
      thumbCenter.dx - trackLeft,
      trackHeight,
    );

    final inactiveRect = Rect.fromLTWH(
      thumbCenter.dx,
      trackTop,
      trackWidth - (thumbCenter.dx - trackLeft),
      trackHeight,
    );

    final radius = Radius.circular(trackHeight / 2);

    final activeGradient = LinearGradient(
      colors: [
        Colors.blueAccent,
        Colors.purpleAccent,
      ],
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(inactiveRect, radius),
      Paint()..color = Colors.white.withOpacity(0.1),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(activeRect, radius),
      Paint()..shader = activeGradient.createShader(activeRect),
    );
  }
}

class GlassParticlePainter extends CustomPainter {
  final List<Particle> particles = [];
  final Random random = Random();

  GlassParticlePainter() {
    for (int i = 0; i < 20; i++) {
      particles.add(Particle.random(random));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.update(size);
      particle.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Particle {
  double x, y, vx, vy, radius;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.color,
  });

  factory Particle.random(Random random) {
    return Particle(
      x: random.nextDouble() * 1000,
      y: random.nextDouble() * 1000,
      vx: (random.nextDouble() - 0.5) * 0.5,
      vy: (random.nextDouble() - 0.5) * 0.5,
      radius: (50 + 150 * random.nextDouble()).toDouble(),
      color: [
        Colors.blue.withOpacity(0.3),
        Colors.purple.withOpacity(0.3),
        Colors.cyan.withOpacity(0.2),
        Colors.pink.withOpacity(0.2),
      ][random.nextInt(4)],
    );
  }

  void update(Size size) {
    x += vx;
    y += vy;

    if (x < -radius) x = size.width + radius;
    if (x > size.width + radius) x = -radius;
    if (y < -radius) y = size.height + radius;
    if (y > size.height + radius) y = -radius;
  }

  void draw(Canvas canvas) {
    final gradient = RadialGradient(
      colors: [
        color,
        Colors.transparent,
      ],
      radius: 1,
    );

    canvas.drawCircle(
      Offset(x, y),
      radius,
      Paint()..shader = gradient.createShader(Rect.fromCircle(center: Offset(x, y), radius: radius)),
    );
  }
}

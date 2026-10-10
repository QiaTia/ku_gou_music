import 'package:flutter/material.dart';
import 'package:ku_gou_music/api/mv/mv.dart';
import 'package:video_player/video_player.dart';

/// MV 播放页（对应 MoeKoe 的 VideoPlayer.vue）
///
/// 路由参数：{'hash': mvhash, 'title': 歌名}
/// 流程：/video/url 取 backupdownurl（数组取首个）或 downurl → mp4 直链播放
class MvScreen extends StatefulWidget {
  final String hash;
  final String title;

  const MvScreen({super.key, required this.hash, this.title = '视频播放'});

  @override
  State<MvScreen> createState() => _MvScreenState();
}

class _MvScreenState extends State<MvScreen> {
  VideoPlayerController? _controller;
  bool _isLoading = true;
  String? _error;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _fetchVideoUrl();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _fetchVideoUrl() async {
    if (widget.hash.isEmpty) {
      setState(() {
        _error = '缺少视频参数';
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await getMvUrl(hash: widget.hash);
      final body = response.body;
      final data = body?['data'];
      if (body?['status'] == 1 && data is Map && data.isNotEmpty) {
        // data 以 mvhash 为键（动态键），取第一个条目
        final videoData = data.values.first;
        String? url;
        if (videoData is Map) {
          final backup = videoData['backupdownurl'];
          if (backup is List && backup.isNotEmpty) {
            url = backup.first?.toString();
          } else if (backup is String && backup.isNotEmpty) {
            url = backup;
          }
          url ??= videoData['downurl']?.toString();
        }
        if (url != null && url.isNotEmpty) {
          await _initPlayer(url);
          return;
        }
      }
      setState(() {
        _error = '获取视频播放地址失败';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = '加载视频失败，请稍后重试';
        _isLoading = false;
      });
    }
  }

  Future<void> _initPlayer(String url) async {
    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    try {
      await controller.initialize();
      controller.play();
      controller.setLooping(false);
      setState(() {
        _controller = controller;
        _initialized = true;
        _isLoading = false;
      });
    } catch (e) {
      controller.dispose();
      setState(() {
        _error = '视频播放失败，可能是视频格式不支持或网络问题';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _buildBody(isDark),
    );
  }

  Widget _buildBody(bool isDark) {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Color(0xFF42B983)),
            SizedBox(height: 16),
            Text('正在加载视频...', style: TextStyle(color: Colors.white70)),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Color(0xFFFF6B6B)),
            const SizedBox(height: 16),
            Text(_error!, style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchVideoUrl,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF42B983),
                foregroundColor: Colors.white,
              ),
              child: const Text('重试'),
            ),
          ],
        ),
      );
    }

    if (!_initialized || _controller == null) {
      return const SizedBox.shrink();
    }

    return Center(
      child: AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _controller!.value.isPlaying
                  ? _controller!.pause()
                  : _controller!.play();
            });
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(_controller!),
              // 视频控制条：播放/暂停 + 进度
              _VideoControls(controller: _controller!),
            ],
          ),
        ),
      ),
    );
  }
}

/// 简易视频控制条（播放/暂停 + 进度条，对应 Vue 的 video controls）
class _VideoControls extends StatefulWidget {
  final VideoPlayerController controller;
  const _VideoControls({required this.controller});

  @override
  State<_VideoControls> createState() => _VideoControlsState();
}

class _VideoControlsState extends State<_VideoControls> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onUpdate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onUpdate);
    super.dispose();
  }

  void _onUpdate() {
    if (mounted) setState(() {});
  }

  String _fmt(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final value = controller.value;
    final durationMs = value.duration.inMilliseconds;
    final positionMs = value.position.inMilliseconds;
    final isWide = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black54],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              value.isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                value.isPlaying ? controller.pause() : controller.play();
              });
            },
          ),
          Expanded(
            child: VideoProgressIndicator(
              controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Color(0xFF42B983),
                bufferedColor: Colors.white24,
              ),
            ),
          ),
          if (isWide)
            Text(
              '${_fmt(positionMs ~/ 1000)} / ${_fmt(durationMs ~/ 1000)}',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
        ],
      ),
    );
  }
}

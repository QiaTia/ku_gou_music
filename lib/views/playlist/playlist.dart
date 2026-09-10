import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/services/play_history_service.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/widgets/add_to_playlist_dialog.dart';
import 'playlist.controller.dart';
import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

class PlaylistScreen extends GetWidget {
  final String id;
  final String name;
  final String pic;
  const PlaylistScreen({
    super.key,
    required this.id,
    this.pic = '',
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final PlaylistController controller = Get.put(PlaylistController());
    final MusicController musicController = Get.find();

    final width = MediaQuery.of(context).size.width;
    final isWide = width > 800;

    final bgCardColor = Theme.of(context).cardColor;

    /// 播放歌单全部歌曲
    void onPlayPlaylist() async {
      // 记录歌单播放历史
      final historyService = PlayHistoryService();
      await historyService.addPlaylist(PlaylistPlayHistory(
        id: id,
        name: name,
        cover: pic,
        playTime: DateTime.now().millisecondsSinceEpoch,
        intro: controller.playListInfo.value.intro,
      ));

      await musicController.loadPlaylistMusic(controller.playlist);
      musicController.audioService.play();
      Get.toNamed('/player');
    }

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true, // 允许头部浮动
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // PC 端固定横幅高度，避免超高方图；移动端保持方形封面
              expandedHeight: isWide ? 260.0 : width,
              pinned: true, // 固定顶部
              title: isWide
                  ? Text(name, style: Theme.of(context).textTheme.titleSmall)
                  : null,
              flexibleSpace: isWide
                  ? FlexibleSpaceBar(
                      background: _buildWideBanner(
                        context,
                        controller,
                        onPlayPlaylist,
                      ),
                    )
                  // 移动端用自定义头部：标题左边距随折叠进度变化，
                  // 展开时贴左、折叠进工具栏时自动让开返回箭头
                  : _MobileFlexibleSpace(
                      background: _buildMobileBanner(context),
                      title: _buildMobileTitle(),
                    ),
            ),
            // 简介与操作按钮：仅移动端展示（PC 已整合进横幅）
            if (!isWide)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Obx(
                    () => ExpandText(
                      content: controller.playListInfo.value.intro ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
            if (!isWide)
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 8, top: 4, bottom: 12),
                  decoration: BoxDecoration(color: bgCardColor),
                  child: Row(
                    spacing: 8,
                    children: [
                      IconButton(
                        onPressed: onPlayPlaylist,
                        iconSize: 28,
                        tooltip: '播放全部',
                        icon: Icon(Icons.play_circle_outline_rounded),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 28,
                        tooltip: '收藏',
                        icon: Icon(Icons.favorite_outline_rounded),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 28,
                        tooltip: '下载',
                        icon: Icon(Icons.download_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 28,
                        tooltip: '分享',
                        icon: Icon(Icons.share_outlined),
                      ),
                    ],
                  ),
                ),
              ),
          ];
        },
        body: isWide
            ? Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: PlaylistView(id: id),
                ),
              )
            : PlaylistView(id: id),
      ),
    );
  }

  /// 移动端封面上的标题：白色粗体 + 投影，保证在任意封面上都可读
  Widget _buildMobileTitle() {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        height: 1.2,
        shadows: [
          Shadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }

  /// 移动端头部：方形封面 + 上下暗色蒙版（顶部保证返回箭头可读，底部保证标题可读）
  Widget _buildMobileBanner(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: id,
          child: CachedNetworkImage(
            imageUrl: pic.isEmpty ? 'https://picsum.photos/1200/600' : pic,
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.22, 0.5, 1.0],
              colors: [
                Colors.black38,
                Colors.transparent,
                Colors.black12,
                Colors.black87,
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// PC 端头部：模糊封面背景横幅 + 封面缩略图 + 歌单信息 + 操作按钮
  Widget _buildWideBanner(
    BuildContext context,
    PlaylistController controller,
    VoidCallback onPlay,
  ) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        // 模糊封面背景
        if (pic.isNotEmpty)
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: CachedNetworkImage(imageUrl: pic, fit: BoxFit.cover),
          )
        else
          Container(color: theme.colorScheme.surfaceContainerHighest),
        // 渐变压暗（顶部保证工具栏可读，底部保证文字可读）
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.45, 1.0],
              colors: [Colors.black45, Colors.transparent, Colors.black54],
            ),
          ),
        ),
        // 横幅内容
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Hero(
                      tag: id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: pic.isEmpty
                              ? Container(
                                  color: Colors.white24,
                                  child: const Icon(
                                    Icons.music_note,
                                    color: Colors.white,
                                    size: 42,
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: pic,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Obx(
                            () => Text(
                              (controller.playListInfo.value.intro ?? '')
                                  .replaceAll(RegExp(r'\s+'), ' '),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: Colors.white.withValues(alpha: 0.75),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              FilledButton.icon(
                                onPressed: onPlay,
                                icon: const Icon(Icons.play_arrow_rounded),
                                label: Obx(
                                  () => Text(
                                    '播放全部 (${controller.playlist.length})',
                                  ),
                                ),
                                style: FilledButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              _bannerButton(
                                Icons.favorite_outline_rounded,
                                '收藏',
                              ),
                              const SizedBox(width: 10),
                              _bannerButton(Icons.download_outlined, '下载'),
                              const SizedBox(width: 10),
                              _bannerButton(Icons.share_outlined, '分享'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// PC 横幅中的次级操作按钮
  Widget _bannerButton(IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withValues(alpha: 0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}

/// 移动端自定义折叠头部
///
/// 系统 [FlexibleSpaceBar] 在指定了 `titlePadding` 后，展开与折叠全程都用同一个
/// 左边距，导致标题折叠进工具栏时压住返回箭头。这里读取 [FlexibleSpaceBarSettings]
/// 拿到折叠进度 t，让标题左边距从「展开贴左 16」过渡到「折叠让开箭头的 66」，
/// 同时顶部蒙版随折叠加深，保证白色标题在工具栏中依然清晰。
class _MobileFlexibleSpace extends StatelessWidget {
  final Widget background;
  final Widget title;

  const _MobileFlexibleSpace({required this.background, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final settings =
            context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        final maxExtent = settings?.maxExtent ?? constraints.maxHeight;
        final minExtent = settings?.minExtent ?? constraints.minHeight;
        final delta = math.max(maxExtent - minExtent, 1.0);
        // t: 0 = 完全展开，1 = 完全折叠
        final t = ((maxExtent - (settings?.currentExtent ?? maxExtent)) / delta)
            .clamp(0.0, 1.0);

        // 有返回箭头时折叠态让开箭头（Material 规范为 72，取 66 更紧凑）
        final collapsedStart = (settings?.hasLeading ?? true) ? 66.0 : 16.0;
        final start = 16.0 + (collapsedStart - 16.0) * t;
        // 展开时标题略大，折叠时回到常规字号
        final scale = 1.2 + (1.0 - 1.2) * t;
        // 展开时标题贴封面底部；折叠进工具栏后垂直居中，与返回箭头保持同一水平线
        final titleAlignment =
            Alignment.lerp(Alignment.bottomLeft, Alignment.centerLeft, t)!;
        // 顶部蒙版随折叠加深：black38 -> 约 black70
        final topScrim = Color.lerp(
          const Color(0x61000000), // black38
          const Color(0xB3000000), // black70
          t,
        )!;

        return Stack(
          fit: StackFit.expand,
          children: [
            background,
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.38],
                    colors: [topScrim, Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              left: start,
              right: 56.0 + (16.0 - 56.0) * t,
              // 展开时距底 14（贴封面底部）；折叠时贴底且高度=工具栏，
              // 配合居中对齐即可与返回箭头垂直居中对齐
              bottom: 14.0 * (1 - t),
              height: kToolbarHeight,
              child: Align(
                alignment: titleAlignment,
                child: Transform.scale(
                  alignment: titleAlignment,
                  scale: scale,
                  child: title,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class PlaylistView extends GetView<PlaylistController> {
  final String id;
  const PlaylistView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final MusicController musicController = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 800;

    /// 重载加载歌单详情
    if (controller.playlist.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.reset();
      });
    }
    controller.getPlaylist(id);

    return Obx(() {
      final len = controller.playlist.length;
      // 当前播放歌曲 hash（用于行高亮）
      final playingHash = musicController.currentSong?.hash;
      return CustomScrollView(
        slivers: [
          // 表头 - 使用 SliverPersistentHeader 实现悬浮（仅 PC 宽屏展示，移动端隐藏避免占位与假排序箭头）
          if (len > 0 && isWide)
            SliverPersistentHeader(
              pinned: true,
              delegate: _PlaylistHeaderDelegate(
                isWide: isWide,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (len == 0) {
                return SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final item = controller.playlist[index];
              return _PlaylistSongRow(
                index: index,
                song: item,
                isWide: isWide,
                isPlaying: item.hash == playingHash,
                onTap: () async {
                  await musicController.loadPlaylistMusic(controller.playlist);
                  await musicController.playSong(index);
                  musicController.audioService.play();
                  Get.toNamed('/player');
                },
                onLongPress: () => _showSongOptions(context, item, index),
              );
            }, childCount: math.max(len, 1)),
          )
        ],
      );
    });
  }

  void _showSongOptions(BuildContext context, SongItemStruct song, int index) {
    final MusicController musicController = Get.find();

    Get.bottomSheet(
      Container(
        height: 500,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 歌曲信息头部
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: song.cover.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: song.cover,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 48,
                              height: 48,
                              color: Colors.grey[300],
                              child: Icon(Icons.music_note, color: Colors.grey[600]),
                            ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            song.author,
                            style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1),
              Expanded(child: 
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                  // 操作选项
                  _buildOptionTile(context,
                    icon: Icons.play_arrow,
                    label: '立即播放',
                    onTap: () async {
                      Get.back();
                      await musicController.loadPlaylistMusic(controller.playlist);
                      await musicController.playSong(index);
                      musicController.audioService.play();
                      Get.toNamed('/player');
                    },
                  ),
                  _buildOptionTile(context,
                    icon: Icons.queue_music,
                    label: '下一首播放',
                    onTap: () {
                      Get.back();
                      // TODO: 添加到下一首播放
                    },
                  ),
                  _buildOptionTile(context,
                    icon: Icons.playlist_add,
                    label: '添加到歌单',
                    onTap: () {
                      Get.back();
                      showAddToPlaylistDialog(context, song);
                    },
                  ),
                  _buildOptionTile(context,
                    icon: Icons.favorite_border,
                    label: '收藏',
                    onTap: () {
                      Get.back();
                    },
                  ),
                  _buildOptionTile(context,
                    icon: Icons.share,
                    label: '分享',
                    onTap: () {
                      Get.back();
                    },
                  ),
                  _buildOptionTile(context,
                    icon: Icons.delete_outline,
                    label: '从列表中移除',
                    textColor: Colors.red,
                    iconColor: Colors.red,
                    onTap: () {
                      Get.back();
                    },
                )])
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
    );
  }

  Widget _buildOptionTile(BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Theme.of(context).iconTheme.color),
        title: Text(
          label,
          style: TextStyle(color: textColor),
        ),
        onTap: onTap,
      ),
    );
  }
}

/// 表头组件
class _PlaylistTableHeader extends StatelessWidget {
  final bool isWide;

  const _PlaylistTableHeader({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodySmall?.color;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // 序号列
          SizedBox(
            width: 40,
            child: Center(
              child: Text('#', style: TextStyle(fontSize: 13, color: textColor)),
            ),
          ),
          // 歌名
          Expanded(
            flex: 3,
            child: Text(
              '歌名',
              style: TextStyle(fontSize: 13, color: textColor),
            ),
          ),
          // 歌手
          if (isWide)
            Expanded(
              flex: 2,
              child: Text(
                '歌手',
                style: TextStyle(fontSize: 13, color: textColor),
              ),
            ),
          // 专辑（宽屏模式）
          if (isWide)
            Expanded(
              flex: 2,
              child: Text(
                '专辑',
                style: TextStyle(fontSize: 13, color: textColor),
              ),
            ),
          // 时间
          SizedBox(
            width: 60,
            child: Text(
              '时间',
              style: TextStyle(fontSize: 13, color: textColor),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

/// SliverPersistentHeader 代理，实现表头悬浮
class _PlaylistHeaderDelegate extends SliverPersistentHeaderDelegate {
  final bool isWide;
  final Color backgroundColor;

  _PlaylistHeaderDelegate({
    required this.isWide,
    required this.backgroundColor,
  });

  @override
  double get minExtent => 40;

  @override
  double get maxExtent => 40;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: _PlaylistTableHeader(isWide: isWide),
    );
  }

  @override
  bool shouldRebuild(covariant _PlaylistHeaderDelegate oldDelegate) {
    return oldDelegate.isWide != isWide || oldDelegate.backgroundColor != backgroundColor;
  }
}

/// 歌曲角标标签
class _SongBadge extends StatelessWidget {
  final String text;
  final Color color;

  const _SongBadge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 0.8),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 9,
          color: color,
          fontWeight: FontWeight.w500,
          height: 1.0,
        ),
      ),
    );
  }
}

/// 歌曲行组件
class _PlaylistSongRow extends StatelessWidget {
  final int index;
  final SongItemStruct song;
  final bool isWide;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _PlaylistSongRow({
    required this.index,
    required this.song,
    required this.isWide,
    required this.isPlaying,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final playingColor = theme.colorScheme.primary;
    final subColor = theme.textTheme.bodySmall?.color;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      hoverColor: theme.colorScheme.primary.withValues(alpha: 0.08),
      child: Container(
        padding: isWide
            ? const EdgeInsets.only(right: 10, top: 10, bottom: 10)
            : const EdgeInsets.only(left: 4, right: 4, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor.withValues(alpha: 0.3),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            // 序号列
            SizedBox(
              width: isWide ? 40 : 36,
              child: Center(
                child: isPlaying
                    ? Icon(
                        Icons.volume_up,
                        size: 16,
                        color: playingColor,
                      )
                    : Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 13, color: subColor),
                      ),
              ),
            ),
            // 歌名 + 角标
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          song.name,
                          style: TextStyle(
                            fontSize: isWide ? 14 : 15,
                            fontWeight: FontWeight.w400,
                            color: isPlaying ? playingColor : null,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // 角标标签
                      if (isWide) _buildBadges(),
                    ],
                  ),
                  if (!isWide)
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Row(children: [
                        Expanded(
                          child: Text(
                            song.author,
                            style: TextStyle(fontSize: 12, color: subColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _buildBadges()
                      ]),
                    )
                ],
              ),
            ),
            // 歌手
            if (isWide)
              Expanded(
                flex: 2,
                child: Text(
                  song.author,
                  style: TextStyle(fontSize: 13, color: subColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            // 专辑（宽屏模式）
            if (isWide)
              Expanded(
                flex: 2,
                child: Text(
                  song.origin_name.split('-').first.trim(),
                  style: TextStyle(fontSize: 13, color: subColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            // 时间（仅宽屏）；移动端用更多按钮替代，释放横向空间
            if (isWide)
              SizedBox(
                width: 60,
                child: Text(
                  formatMilliseconds(song.timelen),
                  style: TextStyle(fontSize: 13, color: subColor),
                  textAlign: TextAlign.right,
                ),
              )
            else
              IconButton(
                onPressed: onLongPress,
                icon: Icon(Icons.more_vert, size: 20, color: subColor),
                tooltip: '更多',
                visualDensity: VisualDensity.compact,
              ),
          ],
        ),
      ),
    );
  }

  /// 构建角标标签
  Widget _buildBadges() {
    final badges = <Widget>[];

    // VIP 角标（根据privilege判断）
    if (song.privilege > 0) {
      badges.add(_SongBadge(
        text: 'VIP',
        color: Colors.orange,
      ));
    }

    // SQ 角标
    if (song.is_sq) {
      badges.add(_SongBadge(
        text: 'SQ',
        color: Colors.blue,
      ));
    }

    // HQ 角标
    if (song.is_hq) {
      badges.add(_SongBadge(
        text: 'HQ',
        color: Colors.blue,
      ));
    }

    // MV 角标
    if (song.mvhash.isNotEmpty) {
      badges.add(_SongBadge(
        text: 'MV',
        color: Colors.pink,
      ));
    }

    if (badges.isEmpty) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(left: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: badges,
      ),
    );
  }
}

class ExpandText extends GetView {
  final String content;
  final TextStyle? style;
  final int numLines;
  const ExpandText({
    super.key,
    required this.content,
    this.style,
    this.numLines = 3,
  });
  final maxWidth = 950.0;

  @override
  Widget build(BuildContext context) {
    final maxHight = numLines * 16.0;
    var fullIntro = false.obs;
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: content);
        final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
        tp.layout(maxWidth: constraints.maxWidth);
        final nl = tp.computeLineMetrics().length;
        if (nl > numLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => SizedBox(
                  // make intro expandable
                  height: fullIntro.value ? null : maxHight,
                  width: MediaQuery.sizeOf(context).width > maxWidth
                      ? maxWidth
                      : MediaQuery.sizeOf(context).width - 32,
                  child: SelectableText(
                    content,
                    textAlign: TextAlign.start,
                    scrollBehavior: const ScrollBehavior().copyWith(
                      scrollbars: false,
                    ),
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    // selectionHeightStyle: ui.BoxHeightStyle.max,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  fullIntro.value = !fullIntro.value;
                },
                child: Text(fullIntro.value ? '加载更少' : '加载更多'),
              ),
            ],
          );
        } else {
          return SelectableText(
            content,
            textAlign: TextAlign.start,
            scrollPhysics: NeverScrollableScrollPhysics(),
            // selectionHeightStyle: ui.BoxHeightStyle.max,
          );
        }
      },
    );
  }
}

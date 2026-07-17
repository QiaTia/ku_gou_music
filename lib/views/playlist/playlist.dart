import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/services/play_history_service.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/widgets/add_to_playlist_dialog.dart';
import 'playlist.controller.dart';
import 'dart:math' as math;

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

    final mobileWidth = MediaQuery.of(context).size.width;

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
      // appBar: TitleBar(title: name),
      body: NestedScrollView(
        floatHeaderSlivers: true, // 允许头部浮动
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // leading : IconButton(
              //   onPressed: routerController.goBack,
              //   icon: Icon(Icons.arrow_back_ios_new_rounded),
              // ),
              expandedHeight: mobileWidth,
              pinned: true, // 固定顶部
              // floating: true,
              // snap: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(name, style: Theme.of(context).textTheme.titleSmall),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(tag: id, child: CachedNetworkImage(
                      imageUrl: pic.isEmpty ? 'https://picsum.photos/1200/600' : pic,
                      fit: .fitHeight,
                      repeat: .noRepeat,
                    )),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: .bottomCenter,
                          end: .topCenter,
                          colors: [Colors.white54, Colors.transparent],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                spacing: 8,
                crossAxisAlignment: .start,
                children: [
                  SizedBox(width: 10),
                  // SizedBox(
                  //   width: 100,
                  //   height: 100,
                  //   child: Hero(
                  //     tag: id,
                  //     child: pic.isEmpty
                  //         ? Icon(Icons.music_note)
                  //         : CachedNetworkImage(imageUrl: pic),
                  //   ),
                  // ),
                  Expanded(
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .start,
                      children: [
                        SizedBox(height: 10),
                        // Text(
                        //   name.replaceAll(RegExp('\\s+'), ' '),
                        //   style: Theme.of(context).textTheme.titleLarge,
                        // ),
                        Obx(
                          () => ExpandText(
                            content: controller.playListInfo.value.intro ?? '',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 8, top: 8, bottom: 20),
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
        body: PlaylistView(id: id),
      ),
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
      return CustomScrollView(
        slivers: [
          // 表头 - 使用 SliverPersistentHeader 实现悬浮
          if (len > 0)
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
                isPlaying: false, // TODO: 可以从musicController获取当前播放状态
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
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Theme.of(context).iconTheme.color),
      title: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      onTap: onTap,
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
              child: Icon(Icons.music_note, size: 14, color: textColor),
            ),
          ),
          // 歌名
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  '歌名',
                  style: TextStyle(fontSize: 13, color: textColor),
                ),
                SizedBox(width: 2),
                Icon(Icons.arrow_drop_down, size: 16, color: textColor),
              ],
            ),
          ),
          // 歌手
          if (isWide)
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(
                    '歌手',
                    style: TextStyle(fontSize: 13, color: textColor),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.arrow_drop_down, size: 16, color: textColor),
                ],
              ),
            ),
          // 专辑（宽屏模式）
          if (isWide)
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Text(
                    '专辑',
                    style: TextStyle(fontSize: 13, color: textColor),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.arrow_drop_down, size: 16, color: textColor),
                ],
              ),
            ),
          // 时间
          SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '时间',
                  style: TextStyle(fontSize: 13, color: textColor),
                ),
                SizedBox(width: 2),
                Icon(Icons.arrow_drop_down, size: 16, color: textColor),
              ],
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
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      hoverColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.08),
      child: Container(
        padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            // 序号列
            SizedBox(
              width: 40,
              child: Center(
                child: isPlaying
                    ? Icon(
                        Icons.volume_up,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
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
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
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
                    Row(children: [
                      Expanded(child: 
                        Text(
                          song.author,
                          style: TextStyle(
                            fontSize: 13,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                      _buildBadges()
                    ])
                ],
              ),
            ),
            // 歌手
            if (isWide)
              Expanded(
                flex: 2,
                child: Text(
                  song.author,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
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
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            // 时间
            SizedBox(
              width: 60,
              child: Text(
                formatMilliseconds(song.timelen),
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.right,
              ),
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

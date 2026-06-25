import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/utils/utils.dart';
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
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (len == 0) {
                return SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()
                ));
              }
              final item = controller.playlist[index];
              return ListTile(
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: item.cover.isNotEmpty
                      ? CachedNetworkImage(imageUrl: item.cover)
                      : Icon(Icons.music_note),
                ),
                title: Text(item.name),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(item.author, overflow: .ellipsis)),
                    Text(formatMilliseconds(item.timelen)),
                  ],
                ),
                onTap: () async {
                  await musicController.loadPlaylistMusic(controller.playlist);
                  await musicController.playSong(index);
                  musicController.audioService.play();
                  Get.toNamed('/player');
                },
                onLongPress: () => _showSongOptions(item, index),
              );
            }, childCount: math.max(len, 1)),
          )
        ],
      );
    });
  }

  void _showSongOptions(SongItemStruct song, int index) {
    // final MusicController musicController = Get.find();

    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.play_arrow, color: Colors.white),
              title: Text('立即播放', style: TextStyle(color: Colors.white)),
              onTap: () async {
                // await musicController.playSong(index);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.queue_music, color: Colors.white),
              title: Text('下一首播放', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.playlist_add, color: Colors.white),
              title: Text('添加到播放列表', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border, color: Colors.white),
              title: Text('喜欢', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('从列表中移除', style: TextStyle(color: Colors.red)),
              onTap: () {
                Get.back();
              },
            ),
            SizedBox(height: 20),
          ],
        ),
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

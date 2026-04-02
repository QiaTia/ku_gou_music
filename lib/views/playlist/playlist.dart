import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'playlist.controller.dart';

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

    final bgCardColor = Theme.of(context).cardColor;

    /// 播放歌单全部歌曲
    void onPlayPlaylist() async {
      await musicController.loadPlaylistMusic(controller.playlist);
      musicController.audioService.play();
      Get.toNamed('/player');
    }

    return Scaffold(
      // appBar: AppBar(title: Text(name)),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: 8,
            children: [
              SizedBox(width: 18),
              SizedBox(
                width: 100,
                height: 100,
                child: Hero(
                  tag: id,
                  child: pic.isEmpty ? Icon(Icons.music_note) : CachedNetworkImage(imageUrl: pic),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      name.replaceAll(RegExp('\\s+'), ' '),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Obx(() => Text(
                      controller.playListInfo.value.intro ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                  ],
                ),
              )
          ]),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
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
          const SizedBox(height: 12),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(color: bgCardColor),
              child: PlaylistView(id: id),
            ),
          ),
        ],
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
      if (controller.playlist.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: controller.playlist.length,
        itemBuilder: (context, index) {
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
        },
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

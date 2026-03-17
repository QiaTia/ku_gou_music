import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/views/music/player_screen.dart';
import 'playlist.controller.dart';

class PlaylistScreen extends GetView<PlaylistController> {
  final String id;
  final String name;
  const PlaylistScreen({ super.key, required this.id, required this.name });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PlaylistController(id));
    final MusicController musicController = Get.find();

    final bgCardColor = Theme.of(context).cardColor;

    /// 播放歌单全部歌曲
    void onPlayPlaylist() async {
      await musicController.loadPlaylistMusic(controller.playlist);
      await musicController.audioService.play();
      Get.to(() => const MusicPlayerScreen());
    }

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
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
                  icon: Icon(Icons.play_circle_outline_rounded)),
                IconButton(
                  onPressed: () {}, 
                  iconSize: 28,
                  tooltip: '收藏',
                  icon: Icon(Icons.favorite_outline_rounded)),
                IconButton(
                  onPressed: () {}, 
                  iconSize: 28,
                  tooltip: '下载',
                  icon: Icon(Icons.download_outlined)),
                IconButton(
                  onPressed: () {}, 
                  iconSize: 28,
                  tooltip: '分享',
                  icon: Icon(Icons.share_outlined)),
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
              child: item.cover.isNotEmpty ?
                Image.network(item.cover.replaceFirst('{size}', '480'))
                : Icon(Icons.music_note)
            ),
            title: Text(item.name),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.author),
                Text(formatMilliseconds(item.timelen)),
              ],
            ),
            onTap: () async {
              await musicController.loadPlaylistMusic(controller.playlist);
              await musicController.playSong(index);
              await musicController.audioService.play();
              Get.to(() => const MusicPlayerScreen());
            },
          );
        });
    });
  }
}

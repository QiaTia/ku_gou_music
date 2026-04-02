import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';
import '../../controllers/music_controller.dart';


class PlaylistScreen extends GetView<MusicController> {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listViewController = ScrollController();
    void scrollToIndex(int index, [int ms = 100]) {
      final targetOffset = index * 64.0;
      if (ms == 0) {
        listViewController.jumpTo(targetOffset);
      } else {
        listViewController.animateTo(
          targetOffset,
          duration: Duration(milliseconds: ms),
          curve: Curves.easeIn);
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToIndex(controller.currentSongIndex, 0);
    });
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (controller.playlist.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.queue_music,
                  size: 80,
                ),
                SizedBox(height: 20),
                Text(
                  '播放列表为空',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),],
            ),
          );
        }
        return ListView.builder(
          controller: listViewController,
          itemCount: controller.playlist.length,
          itemBuilder: (context, index) {
            final song = controller.playlist[index];
            final isPlaying = index == controller.currentSongIndex;
            return ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: song.cover.isEmpty ?
                      AssetImage('') :
                      NetworkImage(song.cover),
                    fit: BoxFit.cover,
                  ),
                ),
                child: isPlaying
                    ? Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Icon(
                          Icons.music_note,
                          color: Colors.blueAccent,
                          size: 20,
                        ),
                      )
                    : null,
              ),
              title: Text(
                song.name,
                style: TextStyle(
                  color: isPlaying ? Colors.blueAccent : null,
                  fontWeight: isPlaying ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              subtitle: Text(
                song.author,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey[400]),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isPlaying)
                    Icon(
                      Icons.equalizer,
                      color: Colors.blueAccent,
                    ),
                  SizedBox(width: 8),
                  Text(
                    formatMilliseconds(song.timelen),
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              onTap: () async {
                await controller.playSong(index);
                Get.back();
              },
              onLongPress: () =>  _showSongOptions(song, index),
            );
          },
        );
      }),
    );
  }

  void _showSongOptions(SongItemStruct song, int index) {
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
              onTap: ()async {
                await controller.playSong(index);
                Get.back();
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
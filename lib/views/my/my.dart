import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'playlist.controller.dart';

class MyScreen extends GetView {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bgCardColor = Theme.of(context).cardColor;
    return Scaffold(
      // appBar: AppBar(title: const Text('我的')),
      backgroundColor: bgCardColor,
      body: Column(
        children: [
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.symmetric(vertical: 20),
          //   decoration: BoxDecoration(color: bgCardColor),
          //   child: Row(
          //     children: [
          //       // Text(total.toString(), style: Theme.of(context).textTheme.titleLarge),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: bgCardColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('我创建的歌单', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(color: bgCardColor),
              child: MyPlaylist(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPlaylist extends GetView<MyPlaylistController> {
  const MyPlaylist({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>MyPlaylistController());
    final LocalRouterController routerController = Get.find();

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
              child: item.pic.isNotEmpty ?
                CachedNetworkImage(imageUrl: item.pic)
                : Icon(Icons.music_note)
            ),
            title: Text(item.name),
            subtitle: Text('${item.count}首'),
            onTap: () {
              routerController.navigateTo('/playlist/detail', { 'id': item.global_collection_id, 'pic': item.pic, 'name': item.name });
              // pageStackController.pushPage(
              //   'playlistDetail', 
              //   PlaylistScreen(name: item.name, id: item.global_collection_id), true);
              // Get.to(() => PlaylistScreen(name: item.name, id: item.global_collection_id));
            },
          );
        });
    });
  }
}

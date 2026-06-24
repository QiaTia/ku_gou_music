import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/models/song.dart';
import 'package:ku_gou_music/views/home/pc/home/home.controller.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';
import 'package:layout/layout.dart';
import 'package:flutter/material.dart';

class HomeTopPage extends StatefulWidget {
  const HomeTopPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeTopPage> {
  final HomeTopController controller = Get.put(HomeTopController());

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (controller.recommendPlayList.isEmpty) initPlayList();
  }

  void initPlayList() {
    controller.initPlayList();
    controller.initSongList();
  }

  SongItemStruct _songToItem(Song song) {
    return SongItemStruct(
      hash: song.hash,
      audio_id: song.songid,
      timelen: song.timeLength * 1000,
      mvhash: '',
      origin_name: '${song.authorName} - ${song.songname}',
      privilege: 0,
      name: song.songname,
      author: song.authorName,
      is_sq: false,
      is_hq: false,
      cover: song.coverUrl150,
    );
  }

  void _playSong(int index) async {
    final musicController = Get.find<MusicController>();
    final songs = controller.recommendSongList.map(_songToItem).toList();
    await musicController.loadPlaylistMusic(songs);
    await musicController.playSong(index);
    musicController.audioService.play();
    Get.toNamed('/player');
  }

  @override
  Widget build(BuildContext context) {
    final double padding = context.layout.value(
      xs: 8,
      md: 12,
      xl: 14,
    );

    final int crossAxisCount = context.layout.value(xs: 2, sm: 3, md: 4, lg: 6);
    final int songCrossAxisCount = context.layout.value(
      xs: 2,
      sm: 3,
      md: 4,
      lg: 5,
    );
    return Scaffold(
      appBar: TitleBar(searchField: TitleSearchField(textController: textController, hintText: '搜索歌曲',),),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                '推荐歌曲',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Obx(
            () => controller.recommendSongList.isEmpty
                ? SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: songCrossAxisCount,
                        mainAxisSpacing: padding,
                        crossAxisSpacing: padding,
                        childAspectRatio: 3.2,
                      ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final song = controller.recommendSongList[index];
                        return _SongGridItem(
                          song: song,
                          onTap: () => _playSong(index),
                        );
                      }, childCount: controller.recommendSongList.length),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                '推荐歌单',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          Obx(
            () => controller.recommendPlayList.isEmpty
                ? SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: !controller.isFailed.value
                            ? CircularProgressIndicator()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.error, size: 32),
                                  Text('获取歌单失败'),
                                  TextButton(
                                    onPressed: initPlayList,
                                    child: Text('重试'),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: padding,
                        crossAxisSpacing: padding,
                        childAspectRatio: 0.77,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = controller.recommendPlayList[index];
                          return _GridPhotoItem(item: item);
                        },
                        childCount: controller.recommendPlayList.length,
                      ),
                    ),
                  ),
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
    );
  }
}

class _GridPhotoItem extends StatelessWidget {
  const _GridPhotoItem({required this.item});

  final PlaylistModel item;

  @override
  Widget build(BuildContext context) {
    final LocalRouterController routerController = Get.find();

    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Hero(
        tag: item.globalCollectionId ?? '',
        child: CachedNetworkImage(
          imageUrl: item.flexibleCover ?? '',
          // httpHeaders: imageHeader,
          fit: BoxFit.fitHeight,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.music_note),
        ),
      ),
    );

    return InkWell(
      onTap: () {
        Get.toNamed('/playlist/detail', arguments: {
          'id': item.globalCollectionId,
          'name': item.specialname,
          'pic': item.flexibleCover,
        });
      //   routerController.navigateTo('/playlist/detail', {
      //     'id': item.globalCollectionId,
      //     'name': item.specialname,
      //     'pic': item.flexibleCover,
      //   });
      },
      child: GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
          clipBehavior: .hardEdge,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: _GridTitleText(
              text: (item.specialname ?? '').replaceAll(RegExp('\\s+'), ' '),
            ),
            subtitle: _GridTitleText(
              text: item.intro ?? '',
              style: TextStyle(fontSize: 10),
              maxLines: 2,
            ),
          ),
        ),
        child: image,
      ),
    );
  }
}

class _GridTitleText extends StatelessWidget {
  final TextStyle? style;
  final int maxLines;
  final String text;

  const _GridTitleText({required this.text, this.style, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: Text(
        text,
        maxLines: maxLines,
        style: style,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _SongGridItem extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;

  const _SongGridItem({required this.song, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                width: 48,
                height: 48,
                child: CachedNetworkImage(
                  imageUrl: song.coverUrl150,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.music_note, color: Colors.grey, size: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.songname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF5E8A),
                    ),
                  ),
                  // const SizedBox(height: 4),
                  Text(
                    song.authorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

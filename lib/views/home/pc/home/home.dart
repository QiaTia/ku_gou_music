import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/home/home.controller.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:layout/layout.dart';
import 'package:flutter/material.dart';

class HomeTopPage extends StatefulWidget {
  const HomeTopPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeTopPage> {
  final HomeTopController controller = Get.put(HomeTopController());

  @override
  void initState() {
    super.initState();
    if (controller.recommendPlayList.isEmpty) initPlayList();
  }

  void initPlayList() {
    controller.initPlayList();
    controller.initSongList();
  }

  @override
  Widget build(BuildContext context) {
    /// 计算间距
    final double padding = context.layout.value(
      xs: 8, // sm value will be like xs 0.0
      md: 12, // lg value will be like md 24.0
      xl: 14,
    );

    /// 计算列数
    final int crossAxisCount = context.layout.value(xs: 2, sm: 3, md: 4, lg: 6);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '推荐歌单',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Expanded(
            child: Obx(
              () => controller.recommendPlayList.isEmpty
                  ? Center(
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
                    )
                  : GridView.count(
                      restorationId: 'grid_view_demo_grid_offset',
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: padding,
                      crossAxisSpacing: padding,
                      padding: EdgeInsets.all(padding),
                      childAspectRatio: 0.77,
                      children: controller.recommendPlayList
                          .map((item) => _GridPhotoItem(item: item))
                          .toList(),
                    ),
            ),
          ),
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
        routerController.navigateTo('/playlist/detail', {
          'id': item.globalCollectionId,
          'name': item.specialname,
          'pic': item.flexibleCover,
        });
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

final dividerColor = Color(0xFFE5E5E5);
final iconColor = Color(0xFFA0A0A0);

class Sidebar extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  Sidebar({super.key});

  Widget sidebarItem({
    required BuildContext context,
    required String label,
    required Widget leading,
    required String content,
    bool isSelected = false,
    Widget? trailing,
    EdgeInsetsGeometry? contentPadding,
    void Function()? onTap,
  }) {
    final primary = Theme.of(context).colorScheme.primary;
    final color = isSelected ? primary : iconColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        color: isSelected ? primary.withValues(alpha: 0.08) : Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: IconTheme.merge(
            data: IconThemeData(color: color, size: 30),
            child: leading,
          ),
          title: Text(
            content,
            style: TextStyle(
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
              color: isSelected ? primary : null,
              fontWeight: isSelected ? FontWeight.w600 : null,
            ),
          ),
          contentPadding: contentPadding,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -3.65),
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).primaryColor.withAlpha(20);
    final LocalRouterController routerController = Get.find();

    final List<SidebarItemStruct> menuList = [
      SidebarItemStruct(
        label: 'home',
        content: '首页',
        leading: Icon(Icons.home, size: 30),
        route: '/home',
        onTap: () {
          routerController.navigateTo('/home');
        },
      ),
      // Divider
      SidebarItemStruct(
        label: 'divider_line',
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10),
          child: Divider(
            thickness: 0.5,
            height: 1,
            indent: 20,
            endIndent: 20,
            color: dividerColor,
          ),
        ),
      ),
      SidebarItemStruct(
        label: 'discover',
        content: '发现',
        leading: Icon(Icons.explore, size: 30),
        route: '/discover',
        onTap: () {
          routerController.navigateTo('/discover');
        },
      ),
      SidebarItemStruct(
        label: 'recently',
        content: '最近播放',
        leading: Icon(Icons.history, size: 30),
        route: '/recently',
        onTap: () {
          routerController.navigateTo('/recently');
        },
      ),
      // Divider2
      SidebarItemStruct(
        label: 'divider_line_2',
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10),
          child: Divider(
            thickness: 0.5,
            height: 1,
            indent: 20,
            endIndent: 20,
            color: dividerColor,
          ),
        ),
      ),
      SidebarItemStruct(
        label: 'playlists',
        content: '我的',
        leading: Icon(Icons.playlist_play, size: 30),
        route: '/my',
        onTap: () {
          if (userInstance.token.isEmpty) {
            Get.toNamed('/login');
          } else {
            routerController.navigateTo('/my');
          }
        },
      ),
    ];

    return Container(
      color: bgColor,
      width: 188,
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            // onPanStart: (details) => windowManager.startDragging(),
            // onDoubleTap: () async => await windowManager.isMaximized()
            //     ? windowManager.unmaximize()
            //     : windowManager.maximize(),
            child: SizedBox(
              height: 75,
              child: Center(
                child: Text(
                  'Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    // color: highlightTextColor,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Scrollbar(
              thickness: 5,
              controller: _scrollController,
              child: CustomScrollView(
                primary: false,
                controller: _scrollController,
                scrollBehavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                slivers: [
                  Obx(() {
                    final currentRoute = routerController.currentRoute;
                    return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final it = menuList[index];
                        if (it.child != null) return it.child;
                        final isSelected =
                            it.route != null && it.route == currentRoute;
                        return sidebarItem(
                          context: context,
                          label: it.label,
                          leading: it.leading ?? SizedBox.shrink(),
                          content: it.content ?? '',
                          isSelected: isSelected,
                          onTap: it.onTap,
                        );
                      }, childCount: menuList.length),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget playlistItem(BuildContext context, int index) {
  //   final l10n = AppLocalizations.of(context);
  //   return ValueListenableBuilder(
  //     valueListenable: playlistsManager.updateNotifier,
  //     builder: (context, value, child) {
  //       final playlist = playlistsManager.getPlaylistByIndex(index);
  //       return ContextMenuWidget(
  //         child: sidebarItem(
  //           label: '_${playlist.name}',
  //           leading: ValueListenableBuilder(
  //             valueListenable: playlist.updateNotifier,
  //             builder: (_, _, _) {
  //               final displaySong = playlist.getDisplaySong();
  //               if (displaySong == null) {
  //                 return CoverArtWidget(size: 30, borderRadius: 3, song: null);
  //               }
  //               return ValueListenableBuilder(
  //                 valueListenable: displaySong.updateNotifier,
  //                 builder: (_, _, _) {
  //                   return CoverArtWidget(
  //                     size: 30,
  //                     borderRadius: 3,
  //                     song: displaySong,
  //                   );
  //                 },
  //               );
  //             },
  //           ),
  //           content: index == 0 ? l10n.favorites : playlist.name,

  //           onTap: () {
  //             panelManager.pushPanel('_${playlist.name}');
  //           },
  //         ),
  //         menuProvider: (_) {
  //           return Menu(
  //             children: [
  //               MenuAction(
  //                 title: index == 0 ? l10n.favorites : playlist.name,
  //                 callback: () {},
  //               ),

  //               if (playlist.isNotFavorite) MenuSeparator(),
  //               if (playlist.isNotFavorite)
  //                 MenuAction(
  //                   title: l10n.delete,
  //                   image: MenuImage.icon(Icons.delete),
  //                   callback: () async {
  //                     if (await showConfirmDialog(context, l10n.delete)) {
  //                       panelManager.removePlaylistPanel(playlist);
  //                       playlistsManager.deletePlaylist(playlist);
  //                     }
  //                   },
  //                 ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
}

/// 侧边栏项结构
class SidebarItemStruct {
  final String label;
  final Widget? leading;
  final String? content;
  final Widget? child;
  final String? route;
  final VoidCallback? onTap;
  SidebarItemStruct({
    required this.label,
    this.leading,
    this.content,
    this.child,
    this.route,
    this.onTap,
  });
}

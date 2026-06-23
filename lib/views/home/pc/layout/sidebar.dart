import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

final dividerColor = Color(0xFFE5E5E5);
final iconColor = Color(0xFFA0A0A0);
const _selectedColor = Color(0xFFFF5E8A);
const _selectedBgColor = Color(0xFFFFEEF3);

class Sidebar extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  Sidebar({super.key});

  Widget sidebarItem({
    required String label,
    required Widget leading,
    required String content,
    bool isSelected = false,
    Widget? trailing,
    EdgeInsetsGeometry? contentPadding,
    void Function()? onTap,
  }) {
    final color = isSelected ? _selectedColor : iconColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? _selectedBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
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
              color: isSelected ? _selectedColor : null,
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
      SidebarItemStruct(
        label: 'albums',
        content: '广场',
        leading: Icon(Icons.all_inclusive_sharp, size: 30),
        route: '/plaza',
        onTap: () {
          routerController.navigateTo('/plaza');
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
        label: 'ranking',
        content: '排行榜',
        leading: Icon(Icons.trending_up, size: 30),
        route: '/ranking',
        onTap: () {
          routerController.navigateTo('/ranking');
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
        route: '/my_playlist',
        onTap: () {
          routerController.navigateTo('/my_playlist');
        },
      ),
      // SidebarItemStruct(
      //   label: 'divider_line_3',
      //   child: Padding(
      //     padding: EdgeInsetsGeometry.symmetric(vertical: 10),
      //     child: Divider(
      //       thickness: 0.5,
      //       height: 1,
      //       indent: 20,
      //       endIndent: 20,
      //       color: dividerColor,
      //     ),
      //   ),
      // ),
      // SidebarItemStruct(
      //   label: 'login',
      //   content: '登录',
      //   leading: Icon(Icons.login_rounded, size: 30),
      //   onTap: () {
      //     Get.toNamed('/login');
      //   },
      // ),
    ];

    if (userInstance.token.isEmpty) {
      menuList.add(
        SidebarItemStruct(
          label: 'login',
          content: '登录',
          leading: Icon(Icons.login_rounded, size: 30),
          onTap: () {
            Get.toNamed('/login');
          },
        ),
      );
    } else {
      menuList.add(
        SidebarItemStruct(
          label: 'playlists',
          content: '我的',
          leading: Icon(Icons.playlist_play, size: 30),
          route: '/my_playlist',
          onTap: () {
            routerController.navigateTo('/my_playlist');
          },
        ),
      );
    }

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

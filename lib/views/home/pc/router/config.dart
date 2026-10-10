
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/artist/artist.dart';
import 'package:ku_gou_music/views/home/pc/plaza/plaza.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.dart';
import 'package:ku_gou_music/views/my/my.dart';
import 'package:ku_gou_music/views/mv/mv.dart';
import 'package:ku_gou_music/views/playlist/playlist.dart';
import 'package:ku_gou_music/views/search/search.dart';
import 'package:ku_gou_music/views/settings/settings.dart';
import '../home/home.dart';

/// 路由注册表
Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeTopPage(),
  '/plaza': (_) => const PlazaPage(),
  '/artists': (context) => SizedBox.shrink(),
  '/settings': (context) => const SettingsPage(),
  '/albums': (context) => SizedBox.shrink(),
  '/discover': (context) => const RankingPage(),
  '/profile': (context) => SizedBox.shrink(),
  '/recently': (context) => const RecentlyPage(),
  '/my': (context) => const MyScreen(),
  '/my_favorite': (context) => SizedBox.shrink(),
  '/search': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return SearchPage(initialKeyword: args?['initialKeyword'],);
  },
  '/playlist/detail': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return PlaylistScreen(name: args?['name'], id: args?['id'], pic: args?['pic'],);
  },
  '/artist/detail': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return ArtistScreen(
      singerid: (args?['singerid'] is num) ? args!['singerid'].toInt() : 0,
      initialFollowed: args?['unfollow'] == true,
    );
  },
  '/mv': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return MvScreen(
      hash: args?['hash']?.toString() ?? '',
      title: args?['title']?.toString() ?? '视频播放'.tr,
    );
  },
};

/// 初始路由
const initialRoute = '/home';


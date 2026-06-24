
import 'package:flutter/widgets.dart';
import 'package:ku_gou_music/views/home/pc/plaza/plaza.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.dart';
import 'package:ku_gou_music/views/my/my.dart';
import 'package:ku_gou_music/views/playlist/playlist.dart';
import '../home/home.dart';

/// 路由注册表
Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeTopPage(),
  '/plaza': (_) => const PlazaPage(),
  '/artists': (context) => SizedBox.shrink(),
  '/settings': (context) => SizedBox.shrink(),
  '/albums': (context) => SizedBox.shrink(),
  '/ranking': (context) => const RankingPage(),
  '/profile': (context) => SizedBox.shrink(),
  '/recently': (context) => const RecentlyPage(),
  '/my': (context) => const MyScreen(),
  '/my_favorite': (context) => SizedBox.shrink(),
  '/playlist/detail': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return PlaylistScreen(name: args?['name'], id: args?['id'], pic: args?['pic'],);
  }
};

/// 初始路由
const initialRoute = '/home';


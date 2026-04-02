
import 'package:flutter/widgets.dart';
import 'package:ku_gou_music/views/my/my.dart';
import 'package:ku_gou_music/views/playlist/playlist.dart';
import '../home/home.dart';

/// 路由注册表
Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => const HomeTopPage(),
  '/artists': (context) => SizedBox.shrink(),
  '/settings': (context) => SizedBox.shrink(),
  '/my_playlist': (context) => const MyScreen(),
  '/albums': (context) => SizedBox.shrink(),
  '/ranking': (context) => SizedBox.shrink(),
  '/profile': (context) => SizedBox.shrink(),
  '/my_recently': (context) => SizedBox.shrink(),
  '/my_favorite': (context) => SizedBox.shrink(),
  '/playlist/detail': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return PlaylistScreen(name: args?['name'], id: args?['id'], pic: args?['pic'],);
  }
};

/// 初始路由
const initialRoute = '/home';


import 'package:get/get.dart';
import 'package:ku_gou_music/api/top/top.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';
export 'package:ku_gou_music/api/top/top.dart';

class HomeTopController extends GetxController {
  final RxBool isFailed = false.obs;
  /// 推荐歌单列表
  final RxList<PlaylistModel> recommendPlayList = <PlaylistModel>[].obs;
  /// 推荐歌曲列表
  final RxList<SongItemStruct> recommendSongList = <SongItemStruct>[].obs;

  /// 获取推荐歌曲列表
  void initSongList() {
    getTopCart()
      .then((t) {
        print(t);
      })
      .catchError((e) {
        print(e);
      });
  }

  /// 获取推荐歌单列表
  void initPlayList() {
    recommendPlayList.clear();
    isFailed.value = false;
    getTopPlaylist()
      .then((res) {
        recommendPlayList.value = res;
      })
      .catchError((e) {
        isFailed.value = true;
        print(e);
      });
  }
}
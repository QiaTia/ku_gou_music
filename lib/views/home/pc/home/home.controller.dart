import 'package:get/get.dart';
import 'package:ku_gou_music/api/playlist/playlist.dart';
import 'package:ku_gou_music/api/top/top.dart';
export 'package:ku_gou_music/api/top/top.dart';
import 'package:ku_gou_music/models/song.dart';

class HomeTopController extends GetxController {
  final RxBool isFailed = false.obs;

  /// 推荐歌单列表
  final RxList<PlaylistModel> recommendPlayList = <PlaylistModel>[].obs;

  /// 推荐歌曲列表
  final RxList<Song> recommendSongList = <Song>[].obs;

  /// 获取推荐歌曲列表
  void initSongList() {
    getTopCart()
        .then((result) {
          recommendSongList.value = result.songList;
        })
        .catchError((e) {
          print(e);
        });
  }

  /// 获取推荐歌单列表
  void initPlayList() {
    if ((recommendPlayList?.length ?? 0) > 0) recommendPlayList.clear();
    isFailed.value = false;
    getTopPlaylist()
        .then((res) {
          print(res);
          recommendPlayList.value = res;
        })
        .catchError((e) {
          isFailed.value = true;
          print(e);
        });
  }
}

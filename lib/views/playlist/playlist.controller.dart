import 'package:get/get.dart';
import 'package:ku_gou_music/api/playlist/playlist.dart';

class SongItemStruct {
  /// 歌曲hash
  String hash;
  /// 歌曲名
  String name;
  /// 歌曲id
  int audio_id;
  /// 歌曲封面
  String cover;
  /// 歌曲mvhash
  String mvhash;
  /// 歌曲时间
  int timelen;
  /// 原始名称
  String origin_name;
  /// 歌词作者
  String author;
  int privilege;
  /// SQ码率
  bool is_sq;
  /// HQ码率
  bool is_hq;

  SongItemStruct({ required this.hash, required this.audio_id, required this.timelen, required this.mvhash, required this.origin_name, required this.privilege, required this.author, required this.is_hq, required this.name, required this.is_sq, required this.cover });

  factory SongItemStruct.fromJson(Map<String, dynamic> json) {
    String origin_name = json['name'] ?? '';
    var names = origin_name.split('-');
    List<dynamic> goods = json['relate_goods'] ?? [];
    return SongItemStruct(
      hash: json['hash'],
      audio_id: json['audio_id'],
      timelen: json['timelen'] ?? 0,
      mvhash: json['mvhash'],
      origin_name: origin_name,
      privilege: json['privilege'] ?? 0,
      name: names.last.trim(),
      author: names.first.trim(),
      is_sq: goods.length > 2,
      is_hq: goods.length > 1,
      cover: json['cover'].replaceAll('{size}', '480'),
    );
  }

}

class PlaylistController extends GetxController {
  final String id;
  PlaylistController(this.id); 

  List<SongItemStruct> playlist = <SongItemStruct>[].obs;
  @override
  void onInit() {
    super.onInit();
      getPlaylistTrackAll(id, 1, 99)
        .then((res) {
          List<dynamic>? list = res.body!['data']['songs'] ?? [];
          if (list is List) {
            playlist.clear();
            list.forEach((tracks) {
              if (tracks is Map && tracks.containsKey('hash')) { 
                playlist.add(SongItemStruct.fromJson(tracks as Map<String, dynamic>));
              }
            });
          }
        });
  }
}


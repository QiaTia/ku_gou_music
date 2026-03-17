import 'package:get/get.dart';
import 'package:ku_gou_music/api/user/user.dart';

class PlaylistItemStruct {
  int count;
  int status;
  int create_time;
  String create_user_pic;
  String tags;
  int list_create_userid;
  String list_create_gid;
  int is_publish;
  String name;
  String pic;
  String global_collection_id;

  PlaylistItemStruct({ required this.count, required this.status, required this.create_time, required this.create_user_pic, required this.tags, required this.list_create_userid, required this.list_create_gid, required this.is_publish, required this.name, required this.global_collection_id, required this.pic });

  factory PlaylistItemStruct.fromJson(Map<String, dynamic> json) {
    return PlaylistItemStruct(
      count: json['count'] ?? 0,
      status: json['status'] ?? 1,
      create_time: json['create_time'],
      create_user_pic: json['create_user_pic'],
      tags: json['tags'] ?? '',
      list_create_userid: json['list_create_userid'],
      list_create_gid: json['list_create_gid'],
      is_publish: json['is_publish'],
      name: json['name'],
      pic: json['pic'],
      global_collection_id: json['global_collection_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'status': status,
      'create_time': create_time,
      'create_user_pic': create_user_pic,
      'tags': tags,
      'list_create_userid': list_create_userid,
      'list_create_gid': list_create_gid,
      'is_publish': is_publish,
      'name': name,
      'pic': pic,
      'global_collection_id': global_collection_id
    };
  }
}

class MyPlaylistController extends GetxController {
  List<PlaylistItemStruct> playlist = <PlaylistItemStruct>[].obs;
  @override
  void onInit() {
    super.onInit();
    getUserPlaylist()
      .then((res) {
        var list = res.body!['data']['info'] ?? [];
        if (list is List) {
          playlist.clear();
          list.forEach((e) {
            playlist.add(PlaylistItemStruct.fromJson(e));
          });
        }
      });
  }

}

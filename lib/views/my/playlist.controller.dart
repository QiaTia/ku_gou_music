import 'package:get/get.dart';
import 'package:ku_gou_music/api/user/user.dart';
import 'package:ku_gou_music/models/user/user_info.dart';
import 'package:ku_gou_music/utils/utils.dart';

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

  PlaylistItemStruct({
    required this.count,
    required this.status,
    required this.create_time,
    required this.create_user_pic,
    required this.tags,
    required this.list_create_userid,
    required this.list_create_gid,
    required this.is_publish,
    required this.name,
    required this.global_collection_id,
    required this.pic,
  });

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
      pic: json['pic'] is String ? getImageUri(json['pic']) : '',
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
      'global_collection_id': global_collection_id,
    };
  }
}

class MyPlaylistController extends GetxController {
  List<PlaylistItemStruct> playlist = <PlaylistItemStruct>[].obs;
  final Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);
  final RxInt selectedTab = 0.obs;
  final RxBool isLoading = true.obs;
  final RxList<Map<String, dynamic>> likedSongs = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    isLoading.value = true;
    await Future.wait([
      _loadUserDetail(),
      _loadPlaylist(),
    ]);
    isLoading.value = false;
  }

  Future<void> _loadUserDetail() async {
    try {
      final detail = await getUserDetail();
      userInfo.value = detail;
    } catch (e) {
      print('获取用户详情失败: $e');
    }
  }

  Future<void> _loadPlaylist() async {
    try {
      final res = await getUserPlaylist();
      if (!res.body!.containsKey('data')) {
        print('获取歌单失败');
        return;
      }
      var list = res.body!['data']['info'] ?? [];
      if (list is List) {
        playlist.clear();
        for (var e in list) {
          playlist.add(PlaylistItemStruct.fromJson(e));
        }
      }
      _extractLikedSongs();
    } catch (error) {
      print('获取歌单失败: $error');
    }
  }

  void _extractLikedSongs() {
    for (var p in playlist) {
      if (p.name == '我喜欢' || p.name.contains('喜欢')) {
        _loadLikedSongItems(p.global_collection_id);
        break;
      }
    }
  }

  Future<void> _loadLikedSongItems(String playlistId) async {
    try {
      final res = await getUserPlaylist(page: 1, pagesize: 12);
      if (res.body != null && res.body!['data'] != null) {
        var list = res.body!['data']['info'] ?? [];
        if (list is List) {
          likedSongs.value = List<Map<String, dynamic>>.from(list.take(12));
        }
      }
    } catch (e) {
      print('获取喜欢歌曲失败: $e');
    }
  }
}

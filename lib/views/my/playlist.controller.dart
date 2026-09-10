import 'package:get/get.dart';
import 'package:ku_gou_music/api/login/register_dev.dart';
import 'package:ku_gou_music/api/user/user.dart';
import 'package:ku_gou_music/models/user/user_info.dart';
import 'package:ku_gou_music/store/user.dart';
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

  bool _loginExpiredHandled = false;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    print('[My] 开始加载页面数据');
    isLoading.value = true;
    await Future.wait([
      _loadUserDetail(),
      _loadPlaylist(),
    ]);
    isLoading.value = false;
    print('[My] 页面数据加载完成');
  }

  /// 登录状态失效：清空登录信息，自动退出并跳转登录页
  Future<void> _handleLoginExpired() async {
    if (_loginExpiredHandled) return;
    _loginExpiredHandled = true;
    print('[My] 检测到登录状态失效，开始退出登录流程');
    // 清空登录状态（退出登录）
    userInstance.clearUser();
    // 重置页面数据
    userInfo.value = null;
    playlist.clear();
    likedSongs.clear();
    isLoading.value = false;
    Get.snackbar(
      '提示',
      '登录状态已失效，请重新登录',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
    // 跳转登录界面，登录成功后重新加载数据
    final result = await Get.toNamed('/login');
    print('[My] 登录页返回结果: $result');
    if (result == true) {
      _loginExpiredHandled = false;
      // dfid 为空时（如历史版本登出时被清空）重新注册设备，登录态接口依赖 dfid
      if (userInstance.dfid.isEmpty) {
        print('[My] dfid 为空，重新注册设备');
        try {
          final dev = await registerDevice();
          final dfid = dev['body']?['data']?['dfid'];
          if (dfid is String && dfid.isNotEmpty) {
            userInstance.setDfid(dfid);
          }
        } catch (e) {
          print('[My] 重新注册设备失败: $e');
        }
      }
      print('[My] 重新登录成功，重新加载数据');
      _loadData();
    }
  }

  Future<void> _loadUserDetail() async {
    try {
      final detail = await getUserDetail();
      print('[My] 用户详情获取成功: ${detail.nickname}');
      userInfo.value = detail;
    } catch (e) {
      print('[My] 获取用户详情失败: $e');
    }
  }

  Future<void> _loadPlaylist() async {
    try {
      final res = await getUserPlaylist();
      print('[My] 歌单接口响应 status=${res.body?['status']}');
      if (!res.body!.containsKey('data')) {
        print('[My] 获取歌单失败，响应内容: ${res.body}');
        // 内容识别失败：接口未返回数据，判定为登录状态失效
        _handleLoginExpired();
        return;
      }
      var list = res.body!['data']['info'] ?? [];
      if (list is List) {
        playlist.clear();
        for (var e in list) {
          playlist.add(PlaylistItemStruct.fromJson(e));
        }
        print('[My] 歌单加载成功，共 ${playlist.length} 个');
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

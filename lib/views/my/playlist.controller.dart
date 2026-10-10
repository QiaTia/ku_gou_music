import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/api/login/register_dev.dart';
import 'package:ku_gou_music/api/user/user.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/models/user/user_info.dart';
import 'package:ku_gou_music/models/user/vip_info.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';

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
  /// 是否带有 authors 字段（收藏的专辑区别于收藏的歌单）
  bool has_authors;

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
    required this.has_authors,
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
      has_authors: json['authors'] != null,
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

/// 听歌历史歌曲
class ListenSong {
  final String hash;
  final String name;
  final String singername;
  /// 封面（含 {size} 占位）
  final String image;
  /// 时长（秒）
  final int duration;

  ListenSong({
    required this.hash,
    required this.name,
    required this.singername,
    required this.image,
    required this.duration,
  });

  factory ListenSong.fromJson(Map<String, dynamic> json) {
    return ListenSong(
      hash: json['hash']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      singername: json['singername']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      duration: (json['duration'] is num) ? json['duration'].toInt() : 0,
    );
  }

  /// 歌曲名（"歌手 - 歌名" 取后半段）
  String get displayName {
    final parts = name.split(' - ');
    return parts.length > 1 ? parts.sublist(1).join(' - ') : name;
  }

  String cover({int size = 120}) =>
      image.isEmpty ? '' : image.replaceAll('{size}', size.toString());
}

/// 关注的用户（歌手/好友）
class FollowUser {
  final String nickname;
  final String pic;
  final int singerid;
  final int source;

  FollowUser({
    required this.nickname,
    required this.pic,
    required this.singerid,
    required this.source,
  });

  factory FollowUser.fromJson(Map<String, dynamic> json) {
    String pic = json['pic']?.toString() ?? '';
    // Vue: artist.pic.replace('/100/', '/480/')
    pic = pic.replaceFirst('/100/', '/480/');
    return FollowUser(
      nickname: json['nickname']?.toString() ?? '',
      pic: pic,
      singerid: (json['singerid'] is num) ? json['singerid'].toInt() : 0,
      source: (json['source'] is num) ? json['source'].toInt() : 0,
    );
  }
}

class MyPlaylistController extends GetxController {
  final Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);
  final Rx<VipInfo?> vipInfo = Rx<VipInfo?>(null);

  /// 我创建的歌单（"我喜欢"排最前）
  final userPlaylists = <PlaylistItemStruct>[].obs;
  /// 我收藏的歌单
  final collectedPlaylists = <PlaylistItemStruct>[].obs;
  /// 我收藏的专辑
  final collectedAlbums = <PlaylistItemStruct>[].obs;
  /// 我关注的歌手（source == 7）
  final followedArtists = <FollowUser>[].obs;
  /// 我关注的好友（无 singerid）
  final collectedFriends = <FollowUser>[].obs;
  /// 听歌历史
  final listenHistory = <ListenSong>[].obs;

  final RxInt selectedTab = 0.obs;
  final RxBool isLoading = true.obs;
  final RxBool isListenSectionHidden = false.obs;

  bool _loginExpiredHandled = false;

  static const _listenHiddenKey = 'library:listen-section-hidden';

  @override
  void onInit() {
    super.onInit();
    final storage = GetStorage();
    isListenSectionHidden.value = storage.read(_listenHiddenKey) == 1;
    _loadData();
  }

  Future<void> _loadData() async {
    isLoading.value = true;
    await Future.wait([
      _loadUserDetail(),
      _loadVipInfo(),
      _loadListenHistory(),
      _loadPlaylist(),
      _loadFollowList(),
    ]);
    isLoading.value = false;
  }

  /// 登录状态失效：清空登录信息，自动退出并跳转登录页
  Future<void> _handleLoginExpired() async {
    if (_loginExpiredHandled) return;
    _loginExpiredHandled = true;
    userInstance.clearUser();
    userInfo.value = null;
    userPlaylists.clear();
    collectedPlaylists.clear();
    collectedAlbums.clear();
    followedArtists.clear();
    collectedFriends.clear();
    listenHistory.clear();
    isLoading.value = false;
    Get.snackbar(
      '提示',
      '登录状态已失效，请重新登录',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
    final result = await Get.toNamed('/login');
    if (result == true) {
      _loginExpiredHandled = false;
      // dfid 为空时（如历史版本登出时被清空）重新注册设备，登录态接口依赖 dfid
      if (userInstance.dfid.isEmpty) {
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
      _loadData();
    }
  }

  Future<void> _loadUserDetail() async {
    try {
      userInfo.value = await getUserDetail();
    } catch (e) {
      print('[My] 获取用户详情失败: $e');
    }
  }

  Future<void> _loadVipInfo() async {
    try {
      vipInfo.value = await getUserVipInfo();
    } catch (e) {
      print('[My] 获取用户VIP信息失败: $e');
      // VIP 信息接口失败视为登录失效（与 Vue 行为一致）
      _handleLoginExpired();
    }
  }

  Future<void> _loadListenHistory() async {
    if (isListenSectionHidden.value) return;
    try {
      final res = await getUserListenHistory(type: 1);
      final lists = res.body?['data']?['lists'];
      if (lists is List) {
        final songs = lists
            .whereType<Map>()
            .map((e) => ListenSong.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        // Vue: 打乱后取前 20 条
        songs.shuffle();
        listenHistory.value = songs.take(20).toList();
      }
    } catch (e) {
      print('[My] 获取听歌历史失败: $e');
    }
  }

  Future<void> _loadPlaylist() async {
    try {
      final res = await getUserPlaylist(pagesize: 500);
      if (!res.body!.containsKey('data')) {
        _handleLoginExpired();
        return;
      }
      final list = res.body!['data']?['info'];
      if (list is! List) return;

      final userid = userInstance.userid;
      final items = list
          .whereType<Map>()
          .map((e) => PlaylistItemStruct.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      // Vue: 先按 sort 字段排序
      items.sort((a, b) => 0);

      userPlaylists.value = items
          .where((p) =>
              p.list_create_userid == userid || p.name == '我喜欢')
          .toList()
        ..sort((a, b) => a.name == '我喜欢' ? -1 : 0);

      collectedPlaylists.value = items
          .where((p) => p.list_create_userid != userid && !p.has_authors)
          .toList();

      collectedAlbums.value = items
          .where((p) => p.list_create_userid != userid && p.has_authors)
          .toList();
    } catch (e) {
      print('[My] 获取歌单失败: $e');
      Get.snackbar('提示', '新增账号请先在官方客户端中登录一次');
    }
  }

  Future<void> _loadFollowList() async {
    try {
      final res = await getUserFollowList();
      final data = res.body?['data'];
      if (data is! Map) return;
      final total = data['total'];
      if (total is num && total == 0) return;
      final lists = data['lists'];
      if (lists is! List) return;
      final all = lists
          .whereType<Map>()
          .map((e) => FollowUser.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      collectedFriends.value = all.where((u) => u.singerid == 0).toList();
      followedArtists.value = all.where((u) => u.source == 7).toList();
    } catch (e) {
      print('[My] 获取关注列表失败: $e');
    }
  }

  /// 关闭"我喜欢听"区块（持久化）
  void hideListenSection() {
    GetStorage().write(_listenHiddenKey, 1);
    isListenSectionHidden.value = true;
    listenHistory.clear();
  }

  /// 签到领取 VIP
  Future<void> signIn() async {
    try {
      final res = await signInForVip();
      final status = res.body?['status'];
      final hours = res.body?['data']?['award_vip_hour'] ?? 0;
      if (status == 1) {
        Get.snackbar('签到', '签到成功，获得$hours小时VIP时长');
      } else {
        Get.snackbar('签到', '签到失败');
      }
    } catch (e) {
      Get.snackbar('签到', '签到失败![该接口将在未来被移除]');
    }
  }

  /// 领取一天 VIP（询问是否升级概念版）
  Future<void> getVip() async {
    final today =
        DateTime.now().toString().split(' ')[0]; // yyyy-MM-dd
    try {
      await receiveDayVip(today);
      final upgrade = await Get.dialog<bool>(
        AlertDialog(
          title: const Text('升级 VIP'),
          content: const Text('是否继续升级至概念版VIP，享受更高音质?'),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () => Get.back(result: true),
              child: const Text('升级'),
            ),
          ],
        ),
      );
      if (upgrade == true) {
        try {
          final res = await upgradeVipReward();
          if (res.body?['status'] == 1) {
            Get.snackbar('VIP', '升级成功，获得1天概念版VIP');
          }
        } catch (e) {
          Get.snackbar('VIP', '升级VIP失败，一天仅限一次');
        }
      } else {
        Get.snackbar('VIP', '签到成功，获得1天畅听VIP');
      }
    } catch (e) {
      Get.snackbar('VIP', '获取VIP失败，请稍后再试');
    }
  }

  /// 创建歌单
  Future<void> createPlaylist(String name) async {
    if (name.trim().isEmpty) return;
    try {
      final res = await createUserPlaylist(name.trim());
      if (res.body?['status'] == 1) {
        Get.snackbar('创建歌单', '创建成功');
        _loadPlaylist();
      } else {
        Get.snackbar('创建歌单', '创建失败');
      }
    } catch (e) {
      Get.snackbar('创建歌单', '创建失败');
    }
  }

  /// 播放听歌历史单曲
  Future<bool> playListenSong(ListenSong song) {
    final musicController = Get.find<MusicController>();
    return musicController.addAndPlaySong(
      SongItemStruct(
        hash: song.hash,
        name: song.displayName,
        audio_id: 0,
        cover: song.cover(size: 480),
        mvhash: '',
        timelen: song.duration,
        origin_name: song.name,
        privilege: 0,
        author: song.singername,
        is_hq: false,
        is_sq: false,
      ),
    );
  }

  /// 把听歌历史全部加入播放列表
  void addAllSongsToQueue() {
    if (listenHistory.isEmpty) return;
    final musicController = Get.find<MusicController>();
    musicController.loadPlaylistMusic(
      listenHistory.map((song) {
        return SongItemStruct(
          hash: song.hash,
          name: song.displayName,
          audio_id: 0,
          cover: song.cover(size: 480),
          mvhash: '',
          timelen: song.duration,
          origin_name: song.name,
          privilege: 0,
          author: song.singername,
          is_hq: false,
          is_sq: false,
        );
      }).toList(),
    );
  }

  /// 打开创建歌单输入框
  void showCreatePlaylistDialog() {
    final textController = TextEditingController();
    Get.dialog<bool>(
      AlertDialog(
        title: const Text('创建歌单'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: const InputDecoration(hintText: '请输入新的歌单名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true);
              createPlaylist(textController.text);
            },
            child: const Text('创建'),
          ),
        ],
      ),
    );
  }
}

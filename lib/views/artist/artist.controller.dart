import 'package:get/get.dart';
import 'package:ku_gou_music/api/artist/artist.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';

/// 歌手详情控制器（对应 MoeKoe PlaylistDetail.vue 的歌手分支）
///
/// 不经 GetX 注册表（不 Get.put/Get.delete）：路由参数直接由构造函数传入，
/// 每次进入页面都是全新实例，避免复用旧实例导致 singerid 不刷新
class ArtistController extends GetxController {
  ArtistController({required this.singerid, bool initialFollowed = false}) {
    isFollowed.value = initialFollowed;
  }

  final int singerid;

  /// 详情：author_name / fansnums / intro / sizable_avatar
  final detail = <String, dynamic>{}.obs;

  final songs = <SongItemStruct>[].obs;

  /// 当前关注状态（从个人页带入初始值：已关注列表点击进入时为 true）
  final RxBool isFollowed = false.obs;

  /// 排序：'hot' 最热 / 'new' 最新
  final RxString sortType = 'hot'.obs;

  final RxBool isLoading = true.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool isFailed = false.obs;

  int _page = 1;
  bool _hasMore = true;

  @override
  void onInit() {
    super.onInit();
    if (singerid > 0) {
      loadData();
    } else {
      isFailed.value = true;
      isLoading.value = false;
    }
  }

  Future<void> loadData() async {
    _page = 1;
    _hasMore = true;
    isLoading.value = true;
    isFailed.value = false;
    songs.clear();

    await Future.wait([
      _loadDetail(),
      _loadSongs(reset: true),
    ]);
    isLoading.value = false;
  }

  Future<void> _loadDetail() async {
    try {
      final res = await getArtistDetail(id: singerid.toString());
      final body = res.body;
      if (body?['status'] == 1 && body?['data'] is Map) {
        detail.value = Map<String, dynamic>.from(body!['data']);
      }
    } catch (e) {
      print('[Artist] 获取歌手信息失败: $e'.tr);
    }
  }

  Future<void> _loadSongs({bool reset = false}) async {
    try {
      final res = await getArtistAudios(
        id: singerid.toString(),
        page: _page,
        pagesize: 30,
        sort: sortType.value,
      );
      final body = res.body;
      if (body?['status'] != 1) {
        if (reset) isFailed.value = true;
        _hasMore = false;
        return;
      }
      final list = body?['data'];
      final formatted = <SongItemStruct>[];
      if (list is List) {
        for (final track in list) {
          if (track is! Map) continue;
          final json = Map<String, dynamic>.from(track);
          final hash = json['hash']?.toString() ?? '';
          if (hash.isEmpty) continue;
          String cover = '';
          final transParam = json['trans_param'];
          if (transParam is Map && transParam['union_cover'] is String) {
            cover = transParam['union_cover'].replaceAll('{size}', '480');
          }
          final audioName = json['audio_name']?.toString() ?? '';
          final authorName = json['author_name']?.toString() ?? '';
          formatted.add(SongItemStruct(
            hash: hash,
            audio_id: 0,
            name: audioName,
            author: authorName,
            cover: cover,
            timelen: json['timelength'] is num ? json['timelength'].toInt() : 0,
            mvhash: json['mvhash']?.toString() ?? '',
            origin_name: '$audioName - $authorName',
            privilege: json['privilege'] is num ? json['privilege'].toInt() : 0,
            is_sq: json['hash_flac'] != null && json['hash_flac'].toString().isNotEmpty,
            is_hq: json['hash_320'] != null && json['hash_320'].toString().isNotEmpty,
          ));
        }
      }
      if (reset) songs.clear();
      songs.addAll(formatted);
      // 满页才认为还有更多
      _hasMore = formatted.length >= 30;
      if (reset && songs.isEmpty) isFailed.value = true;
    } catch (e) {
      print('[Artist] 获取歌手歌曲失败: $e'.tr);
      if (reset) isFailed.value = true;
      _hasMore = false;
    }
  }

  /// 切换排序（最热/最新）并重新加载
  Future<void> changeSort(String sort) async {
    if (sortType.value == sort || isLoading.value) return;
    sortType.value = sort;
    await loadData();
  }

  /// 滚动到底部时加载下一页
  Future<void> loadMore() async {
    if (!_hasMore || isLoadingMore.value || isLoading.value) return;
    isLoadingMore.value = true;
    _page += 1;
    await _loadSongs();
    isLoadingMore.value = false;
  }

  /// 关注/取消关注
  Future<void> toggleFollow() async {
    final followed = isFollowed.value;
    try {
      final res = followed
          ? await unfollowArtist(singerid: singerid)
          : await followArtist(singerid: singerid);
      if (res.body?['status'] == 1) {
        isFollowed.value = !followed;
        Get.snackbar('关注'.tr, followed ? '已取消关注'.tr : '关注成功'.tr);
      } else {
        Get.snackbar('关注'.tr, followed ? '取消关注失败'.tr : '关注失败'.tr);
      }
    } catch (e) {
      Get.snackbar('关注'.tr, followed ? '取消关注失败'.tr : '关注失败'.tr);
    }
  }

  /// 播放单曲
  Future<bool> playSong(SongItemStruct song) {
    return Get.find<MusicController>().addAndPlaySong(song);
  }

  /// 播放全部
  Future<void> playAll() async {
    if (songs.isEmpty) return;
    final musicController = Get.find<MusicController>();
    await musicController.loadPlaylistMusic(List<SongItemStruct>.from(songs));
    musicController.audioService.play();
    Get.toNamed('/player');
  }
}

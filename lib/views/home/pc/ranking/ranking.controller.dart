import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ku_gou_music/api/discover/discover.dart';
import 'package:ku_gou_music/api/top/top.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';

/// 发现页 Tab
enum DiscoverTab { playlist, ranking, newAlbum, newSong }

/// 发现页主控制器：Tab 切换 + 回到顶部
class DiscoverController extends GetxController {
  final activeTab = DiscoverTab.playlist.obs;

  /// 当前内容区滚动控制器（用于回到顶部）
  final Rxn<ScrollController> activeScrollController = Rxn<ScrollController>();

  /// 当前滚动偏移（决定回到顶部按钮显隐）
  final scrollOffset = 0.0.obs;

  void switchTab(DiscoverTab tab) {
    if (activeTab.value == tab) return;
    activeTab.value = tab;
    scrollOffset.value = 0.0;
  }

  void attachScroll(ScrollController controller) {
    activeScrollController.value?.removeListener(_onScroll);
    activeScrollController.value = controller;
    controller.addListener(_onScroll);
    // initState/dispose 发生在 build 阶段，直接写 Rx 会触发
    // "markNeedsBuild called during build"，推迟到帧结束后写入
    _syncScrollOffset(controller);
  }

  void detachScroll(ScrollController controller) {
    controller.removeListener(_onScroll);
    if (activeScrollController.value == controller) {
      activeScrollController.value = null;
    }
    _syncScrollOffset(controller);
  }

  void _syncScrollOffset(ScrollController controller) {
    final offset = controller.hasClients ? controller.offset : 0.0;
    if (offset == scrollOffset.value) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isClosed && offset != scrollOffset.value) {
        scrollOffset.value = offset;
      }
    });
  }

  void _onScroll() {
    scrollOffset.value = activeScrollController.value?.offset ?? 0.0;
  }

  void backToTop() {
    final controller = activeScrollController.value;
    if (controller != null && controller.hasClients) {
      controller.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void onClose() {
    activeScrollController.value?.removeListener(_onScroll);
    super.onClose();
  }
}

// ==================== 发现歌单 ====================

class DiscoverPlaylistController extends GetxController {
  final categories = <DiscoverTag>[].obs;
  final selectedMain = 0.obs;
  final selectedSub = 0.obs;
  final playlists = <PlaylistModel>[].obs;
  final isLoading = true.obs;
  final isFailed = false.obs;

  List<DiscoverTag> get currentSubCategories =>
      selectedMain.value < categories.length ? categories[selectedMain.value].son : <DiscoverTag>[];

  String get currentTagId {
    final subs = currentSubCategories;
    if (selectedSub.value < subs.length) return subs[selectedSub.value].tagId;
    return '0';
  }

  @override
  void onInit() {
    super.onInit();
    ensurePlaylistData();
  }

  Future<void> ensurePlaylistData() async {
    isLoading.value = true;
    isFailed.value = false;
    playlists.clear();

    if (categories.isEmpty) {
      try {
        categories.value = await getDiscoverPlaylistTags();
      } catch (e) {
        print('⚠️ 获取歌单分类失败: $e');
      }
    }
    await fetchPlaylistList();
    isLoading.value = false;
  }

  Future<void> fetchPlaylistList() async {
    try {
      final categoryId = int.tryParse(currentTagId) ?? 0;
      final list = await getTopPlaylist(categoryId, 0);
      playlists.value = list;
      isFailed.value = list.isEmpty;
    } catch (e) {
      print('⚠️ 获取发现歌单失败: $e');
      isFailed.value = true;
    }
  }

  void selectMainCategory(int index) {
    final subs = index < categories.length ? categories[index].son : <DiscoverTag>[];
    if (subs.isEmpty) return;
    selectedMain.value = index;
    selectedSub.value = 0;
    ensurePlaylistData();
  }

  void selectSubCategory(int index) {
    final subs = currentSubCategories;
    if (index >= subs.length) return;
    selectedSub.value = index;
    ensurePlaylistData();
  }
}

// ==================== 音乐榜单 ====================

/// 每页歌曲数
const int rankPageSize = 30;

/// 最多同时展示的榜单数
const int maxSelectedRanks = 6;

/// 单个已选榜单的运行时状态
class RankTabState {
  final DiscoverRank rank;
  final songs = <DiscoverRankSong>[].obs;
  final loading = false.obs;
  final hasMore = true.obs;
  int currentPage = 1;

  RankTabState(this.rank);
}

class DiscoverRankingController extends GetxController {
  final allRanks = <DiscoverRank>[].obs;
  final displayedRanks = <RankTabState>[].obs;
  final selectedRankIds = <int>[].obs;

  final _storage = GetStorage();

  List<DiscoverRank> get sortedRanks {
    if (selectedRankIds.isEmpty) return allRanks.toList();
    final order = {for (var i = 0; i < selectedRankIds.length; i++) selectedRankIds[i]: i};
    final selected = <DiscoverRank>[];
    final rest = <DiscoverRank>[];
    for (final rank in allRanks) {
      if (order.containsKey(rank.rankid)) {
        selected.add(rank);
      } else {
        rest.add(rank);
      }
    }
    selected.sort((a, b) => order[a.rankid]!.compareTo(order[b.rankid]!));
    return [...selected, ...rest];
  }

  @override
  void onInit() {
    super.onInit();
    _initRankData();
  }

  Future<void> _initRankData() async {
    try {
      final rankList = await getDiscoverRankList();
      allRanks.value = rankList;

      final saved = _storage.read<List<dynamic>>('selectedRankIds');
      final savedIds = saved?.whereType<int>().toList() ?? <int>[];
      if (savedIds.isNotEmpty) {
        await _loadSelectedRanks(rankList, savedIds);
      } else {
        await _loadRandomRanks(rankList, 4);
      }
    } catch (e) {
      print('⚠️ 获取榜单列表失败: $e');
    }
  }

  Future<void> _loadSelectedRanks(List<DiscoverRank> rankList, List<int> rankIds) async {
    for (final rankId in rankIds) {
      final matches = rankList.where((r) => r.rankid == rankId).toList();
      if (matches.isNotEmpty) {
        await _addDisplayedRank(matches.first);
      }
    }
    _saveSelectedRanks();
  }

  Future<void> _loadRandomRanks(List<DiscoverRank> rankList, int count) async {
    final shuffled = [...rankList]..shuffle(Random());
    for (final rank in shuffled.take(count)) {
      await _addDisplayedRank(rank);
    }
    _saveSelectedRanks();
  }

  Future<void> _addDisplayedRank(DiscoverRank rank) async {
    selectedRankIds.add(rank.rankid);
    final state = RankTabState(rank);
    displayedRanks.add(state);
    await loadRankSongs(state, 1, false);
  }

  Future<void> loadRankSongs(RankTabState state, int page, bool append) async {
    if (state.loading.value) return;
    state.loading.value = true;
    try {
      final result = await getDiscoverRankAudio(
        state.rank.rankid,
        page: page,
        pagesize: rankPageSize,
      );
      state.songs.value = append ? [...state.songs, ...result.songs] : result.songs;
      if (result.songs.length < rankPageSize) {
        state.hasMore.value = false;
      }
      state.currentPage = page;
    } catch (e) {
      print('⚠️ 加载排行榜歌曲失败: $e');
    } finally {
      state.loading.value = false;
    }
  }

  Future<void> toggleRank(DiscoverRank rank) async {
    final index = selectedRankIds.indexOf(rank.rankid);
    if (index == -1) {
      if (selectedRankIds.length >= maxSelectedRanks) {
        Get.snackbar('提示', '最多同时展示 $maxSelectedRanks 个榜单');
        return;
      }
      await _addDisplayedRank(rank);
    } else {
      selectedRankIds.removeAt(index);
      displayedRanks.removeWhere((s) => s.rank.rankid == rank.rankid);
    }
    _saveSelectedRanks();
  }

  void _saveSelectedRanks() {
    _storage.write('selectedRankIds', selectedRankIds.toList());
  }

  /// 解析 intro 中的排序方式与更新频率
  String formatIntro(String intro) {
    if (intro.isEmpty) return '';
    final parts = intro.split(RegExp(r'\r?\n'));
    String sortRule = '';
    String updateFreq = '';
    for (final p in parts) {
      if (p.contains('排序方式：')) {
        sortRule = p.replaceAll('排序方式：', '').trim();
      } else if (p.contains('更新频率：')) {
        updateFreq = p.replaceAll('更新频率：', '').trim();
      }
    }
    if (sortRule.isNotEmpty && updateFreq.isNotEmpty) {
      return '$sortRule ($updateFreq)';
    }
    return intro;
  }

  /// 播放整个榜单
  Future<void> playRank(RankTabState state) async {
    final songs = state.songs;
    if (songs.isEmpty) return;
    final musicController = Get.find<MusicController>();
    await musicController.loadPlaylistMusic(
      [for (final song in songs) _rankSongToItem(song)],
    );
    await musicController.playSong(0);
  }

  /// 播放单曲
  Future<bool> playSong(DiscoverRankSong song) {
    final musicController = Get.find<MusicController>();
    return musicController.addAndPlaySong(_rankSongToItem(song));
  }

  SongItemStruct _rankSongToItem(DiscoverRankSong song) {
    return SongItemStruct(
      hash: song.hash,
      name: song.songname,
      audio_id: song.audioId,
      cover: song.unionCover,
      mvhash: song.videoHash,
      timelen: song.duration,
      origin_name: song.filename.isNotEmpty ? song.filename : '${song.authorName} - ${song.songname}',
      privilege: 0,
      author: song.authorName,
      is_hq: false,
      is_sq: false,
    );
  }
}

// ==================== 新碟上架 ====================

class DiscoverNewAlbumController extends GetxController {
  /// '' = 推荐（全部地区合并）；1=华语 2=欧美 3=日本 4=韩国
  final selectedType = ''.obs;

  final albums = <DiscoverAlbum>[].obs;
  final isLoading = true.obs;

  final _typeKeyMap = {'1': 'chn', '2': 'eur', '3': 'jpn', '4': 'kor'};
  Map<String, List<DiscoverAlbum>> _allAlbums = {};

  @override
  void onInit() {
    super.onInit();
    fetchNewAlbums();
  }

  Future<void> fetchNewAlbums() async {
    isLoading.value = true;
    albums.clear();
    try {
      _allAlbums = await getDiscoverNewAlbums();
      _applyFilter();
    } catch (e) {
      print('⚠️ 获取新碟上架失败: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectAlbumType(String type) {
    if (selectedType.value == type) return;
    selectedType.value = type;
    _applyFilter();
  }

  void _applyFilter() {
    final key = _typeKeyMap[selectedType.value];
    if (key == null) {
      albums.value = [
        for (final k in ['chn', 'eur', 'jpn', 'kor']) ..._allAlbums[k] ?? [],
      ];
    } else {
      albums.value = _allAlbums[key] ?? [];
    }
  }
}

// ==================== 新歌速递 ====================

const int newSongPageSize = 20;

class DiscoverNewSongController extends GetxController {
  final newSongs = <DiscoverNewSong>[].obs;
  final isLoading = false.obs;
  final currentSongPage = 1.obs;
  final totalSongPages = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNewSongs();
  }

  /// 分页页码（含省略号），返回 int 或 '...'
  List<Object> buildPageNumbers(int total, int current) {
    const delta = 2;
    final pages = <Object>[];
    if (total <= 7) {
      return [for (var i = 1; i <= total; i++) i];
    }
    pages.add(1);
    final leftBound = max(2, current - delta);
    final rightBound = min(total - 1, current + delta);
    if (leftBound > 2) pages.add('...');
    for (var i = leftBound; i <= rightBound; i++) {
      pages.add(i);
    }
    if (rightBound < total - 1) pages.add('...');
    pages.add(total);
    return pages;
  }

  Future<void> fetchNewSongs() async {
    isLoading.value = true;
    newSongs.clear();
    try {
      final result = await getDiscoverNewSongs(
        page: currentSongPage.value,
        pagesize: newSongPageSize,
      );
      newSongs.value = result.songs;
      totalSongPages.value = max(1, (result.total / newSongPageSize).ceil());
    } catch (e) {
      print('⚠️ 获取新歌速递失败: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void goToSongPage(int page) {
    if (page < 1 || page == currentSongPage.value) return;
    currentSongPage.value = page;
    fetchNewSongs();
  }

  void nextSongPage() {
    if (currentSongPage.value < totalSongPages.value) {
      goToSongPage(currentSongPage.value + 1);
    }
  }

  void prevSongPage() {
    if (currentSongPage.value > 1) {
      goToSongPage(currentSongPage.value - 1);
    }
  }

  /// 播放单曲
  Future<bool> playSong(DiscoverNewSong song) {
    final musicController = Get.find<MusicController>();
    return musicController.addAndPlaySong(
      SongItemStruct(
        hash: song.hash,
        name: song.songname,
        audio_id: 0,
        cover: song.cover,
        mvhash: song.videoHash,
        timelen: song.timelength,
        origin_name: song.filename.isNotEmpty ? song.filename : '${song.authorName} - ${song.songname}',
        privilege: 0,
        author: song.authorName,
        is_hq: false,
        is_sq: false,
      ),
    );
  }
}

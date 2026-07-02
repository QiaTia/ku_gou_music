import 'package:get/get.dart';
import 'package:ku_gou_music/controllers/music_controller.dart';
import 'package:ku_gou_music/services/play_history_service.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';

/// 最近播放页面控制器
class RecentlyController extends GetxController {
  final _historyService = PlayHistoryService();
  final _musicController = Get.find<MusicController>();

  // 当前选中的Tab索引 0=歌曲 1=歌单 2=专辑
  final RxInt currentTab = 0.obs;

  // 是否处于编辑模式
  final RxBool isEditing = false.obs;

  // 选中的项目ID集合
  final RxSet<String> selectedIds = <String>{}.obs;

  // 播放记录列表
  final RxList<SongPlayHistory> songHistory = <SongPlayHistory>[].obs;
  final RxList<PlaylistPlayHistory> playlistHistory = <PlaylistPlayHistory>[].obs;
  final RxList<AlbumPlayHistory> albumHistory = <AlbumPlayHistory>[].obs;

  // Tab标题
  final List<String> tabTitles = ['歌曲', '歌单', '专辑'];

  @override
  void onInit() {
    super.onInit();
    loadHistory();
  }

  /// 加载播放记录
  void loadHistory() {
    songHistory.value = _historyService.getSongs();
    playlistHistory.value = _historyService.getPlaylists();
    albumHistory.value = _historyService.getAlbums();
  }

  /// 切换Tab
  void switchTab(int index) {
    if (currentTab.value == index) return;
    currentTab.value = index;
    // 切换Tab时退出编辑模式
    if (isEditing.value) {
      exitEditMode();
    }
  }

  /// 进入编辑模式
  void enterEditMode() {
    isEditing.value = true;
    selectedIds.clear();
  }

  /// 退出编辑模式
  void exitEditMode() {
    isEditing.value = false;
    selectedIds.clear();
  }

  /// 切换编辑模式
  void toggleEditMode() {
    if (isEditing.value) {
      exitEditMode();
    } else {
      enterEditMode();
    }
  }

  /// 选中/取消选中项目
  void toggleSelect(String id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
  }

  /// 全选当前Tab的项目
  void selectAll() {
    switch (currentTab.value) {
      case 0:
        selectedIds.addAll(songHistory.map((e) => e.id));
        break;
      case 1:
        selectedIds.addAll(playlistHistory.map((e) => e.id));
        break;
      case 2:
        selectedIds.addAll(albumHistory.map((e) => e.id));
        break;
    }
  }

  /// 取消全选
  void deselectAll() {
    selectedIds.clear();
  }

  /// 获取当前Tab是否全选
  bool get isAllSelected {
    switch (currentTab.value) {
      case 0:
        return selectedIds.length == songHistory.length && songHistory.isNotEmpty;
      case 1:
        return selectedIds.length == playlistHistory.length && playlistHistory.isNotEmpty;
      case 2:
        return selectedIds.length == albumHistory.length && albumHistory.isNotEmpty;
      default:
        return false;
    }
  }

  /// 删除选中的项目
  Future<void> deleteSelected() async {
    if (selectedIds.isEmpty) return;

    final ids = selectedIds.toList();
    switch (currentTab.value) {
      case 0:
        await _historyService.removeSongs(ids);
        songHistory.removeWhere((item) => ids.contains(item.id));
        break;
      case 1:
        await _historyService.removePlaylists(ids);
        playlistHistory.removeWhere((item) => ids.contains(item.id));
        break;
      case 2:
        await _historyService.removeAlbums(ids);
        albumHistory.removeWhere((item) => ids.contains(item.id));
        break;
    }
    selectedIds.clear();
  }

  /// 播放歌曲（点击后将歌曲移到最前面）
  Future<void> playSong(SongPlayHistory song) async {
    // 1. 将歌曲移到列表最前面
    final index = songHistory.indexWhere((item) => item.id == song.id);
    if (index > 0) {
      songHistory.removeAt(index);
      songHistory.insert(0, song);
    }

    // 2. 更新存储中的顺序
    final updatedList = List<SongPlayHistory>.from(songHistory);
    await _historyService.clearSongs();
    for (final item in updatedList) {
      await _historyService.addSong(item);
    }

    // 3. 实际播放歌曲
    final songItem = SongItemStruct(
      hash: song.hash,
      name: song.name,
      audio_id: int.tryParse(song.id) ?? 0,
      cover: song.cover,
      mvhash: song.mvhash,
      timelen: song.timelen,
      origin_name: song.name,
      privilege: song.privilege,
      author: song.author,
      is_hq: song.isHq,
      is_sq: song.isSq,
    );
    await _musicController.addToPlaylist(songItem);
    _musicController.audioService.play();
  }

  /// 播放歌单
  void playPlaylist(PlaylistPlayHistory playlist) {
    // 将歌单移到最前面
    final index = playlistHistory.indexWhere((item) => item.id == playlist.id);
    if (index > 0) {
      playlistHistory.removeAt(index);
      playlistHistory.insert(0, playlist);
    }
    // TODO: 导航到歌单详情页并播放
  }

  /// 播放专辑
  void playAlbum(AlbumPlayHistory album) {
    // 将专辑移到最前面
    final index = albumHistory.indexWhere((item) => item.id == album.id);
    if (index > 0) {
      albumHistory.removeAt(index);
      albumHistory.insert(0, album);
    }
    // TODO: 导航到专辑详情页并播放
  }

  /// 将选中的歌曲加入下一首播放
  Future<void> addSelectedToNextPlay() async {
    if (currentTab.value != 0 || selectedIds.isEmpty) return;

    // 获取选中的歌曲
    final selectedSongs = songHistory.where((s) => selectedIds.contains(s.id)).toList();

    for (final song in selectedSongs) {
      final songItem = SongItemStruct(
        hash: song.hash,
        name: song.name,
        audio_id: int.tryParse(song.id) ?? 0,
        cover: song.cover,
        mvhash: song.mvhash,
        timelen: song.timelen,
        origin_name: song.name,
        privilege: song.privilege,
        author: song.author,
        is_hq: song.isHq,
        is_sq: song.isSq,
      );
      await _musicController.addToPlaylist(songItem);
    }

    // 播放完成后退出编辑模式
    exitEditMode();
  }

  /// 清空当前Tab的所有记录
  Future<void> clearCurrentTab() async {
    switch (currentTab.value) {
      case 0:
        await _historyService.clearSongs();
        songHistory.clear();
        break;
      case 1:
        await _historyService.clearPlaylists();
        playlistHistory.clear();
        break;
      case 2:
        await _historyService.clearAlbums();
        albumHistory.clear();
        break;
    }
    selectedIds.clear();
  }
}

import 'package:get/get.dart';
import 'package:ku_gou_music/api/playlist/playlist.dart';
import 'package:ku_gou_music/api/top/top.dart' hide Tag;
import 'package:ku_gou_music/models/tag.dart';

class PlazaController extends GetxController {
  final RxList<Tag> parentTags = <Tag>[].obs;
  final RxList<Tag> childTags = <Tag>[].obs;
  final RxList<PlaylistModel> playlistResults = <PlaylistModel>[].obs;
  final RxInt selectedParentIndex = 0.obs;
  final RxInt selectedChildIndex = (-1).obs;
  final RxBool isLoadingTags = false.obs;
  final RxBool isLoadingPlaylist = false.obs;
  final RxBool isFailed = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTags();
  }

  Future<void> loadTags() async {
    isLoadingTags.value = true;
    isFailed.value = false;
    try {
      final tags = await getPlaylistTag();
      parentTags.value = tags;
      if (tags.isNotEmpty) {
        _selectParent(0);
      }
    } catch (e) {
      isFailed.value = true;
      print(e);
    } finally {
      isLoadingTags.value = false;
    }
  }

  void selectParent(int index) {
    if (selectedParentIndex.value == index) return;
    _selectParent(index);
  }

  void _selectParent(int index) {
    selectedParentIndex.value = index;
    selectedChildIndex.value = -1;
    final parent = parentTags[index];
    if (parent.son != null && parent.son!.isNotEmpty) {
      childTags.value = parent.son!;
      selectChild(0);
    } else {
      childTags.clear();
    }
    // loadPlaylistByCategory(parent.tagId);
  }

  void selectChild(int index) {
    if (selectedChildIndex.value == index) return;
    selectedChildIndex.value = index;
    final child = childTags[index];
    loadPlaylistByCategory(child.tagId);
  }

  Future<void> loadPlaylistByCategory(int categoryId) async {
    isLoadingPlaylist.value = true;
    try {
      final result = await getTopPlaylist(categoryId, 0);
      playlistResults.value = result;
    } catch (e) {
      playlistResults.clear();
      print(e);
    } finally {
      isLoadingPlaylist.value = false;
    }
  }
}

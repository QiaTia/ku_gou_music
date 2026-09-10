import 'package:get/get.dart';
import 'package:ku_gou_music/api/search/search.dart' as search_api;
import 'package:ku_gou_music/models/search/search_complex_response.dart';
import 'package:ku_gou_music/models/search/search_song_response.dart';
import 'package:ku_gou_music/models/search/search_special_response.dart';
import 'package:ku_gou_music/models/search/search_album_response.dart';
import 'package:ku_gou_music/models/search/search_mv_response.dart';
import 'package:ku_gou_music/models/search/search_author_response.dart';

/// 搜索控制器
///
/// 各类型搜索接口返回结构不同，因此按类型分别持有结果。
class SearchController extends GetxController {
  /// 搜索关键词
  final RxString keyword = ''.obs;

  /// 当前选中的 Tab 索引
  /// 0=综合, 1=单曲, 2=歌单, 3=专辑, 4=MV, 5=歌手
  final RxInt selectedTabIndex = 0.obs;

  /// 综合搜索结果
  final Rx<SearchComplexResponse?> complexResult = Rx<SearchComplexResponse?>(
    null,
  );

  /// 单曲搜索结果
  final Rx<SearchSongResponse?> songResult = Rx<SearchSongResponse?>(null);

  /// 歌单搜索结果
  final Rx<SearchSpecialResponse?> specialResult = Rx<SearchSpecialResponse?>(
    null,
  );

  /// 专辑搜索结果
  final Rx<SearchAlbumResponse?> albumResult = Rx<SearchAlbumResponse?>(null);

  /// MV搜索结果
  final Rx<SearchMvResponse?> mvResult = Rx<SearchMvResponse?>(null);

  /// 歌手搜索结果
  final Rx<SearchAuthorResponse?> authorResult = Rx<SearchAuthorResponse?>(
    null,
  );

  /// 加载状态
  final RxBool isLoading = false.obs;

  /// 错误状态
  final RxBool isFailed = false.obs;

  /// Tab 名称映射
  static const List<Map<String, String>> tabs = [
    {'key': 'complex', 'label': '综合'},
    {'key': 'song', 'label': '单曲'},
    {'key': 'special', 'label': '歌单'},
    {'key': 'album', 'label': '专辑'},
    {'key': 'mv', 'label': 'MV'},
    {'key': 'author', 'label': '歌手'},
  ];

  /// 执行综合搜索
  Future<void> search(String query) async {
    if (query.trim().isEmpty) return;

    keyword.value = query.trim();
    _resetTypeResults();
    isLoading.value = true;
    isFailed.value = false;

    try {
      final result = await search_api.searchComplex(keyword.value);
      complexResult.value = result;
    } catch (e) {
      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  /// 执行分类搜索（按类型分发到对应接口）
  Future<void> searchByType(String type) async {
    if (keyword.value.isEmpty) return;

    isLoading.value = true;
    isFailed.value = false;

    try {
      switch (type) {
        case 'song':
          songResult.value = await search_api.searchSong(keyword.value);
          break;
        case 'special':
          specialResult.value = await search_api.searchSpecial(keyword.value);
          break;
        case 'album':
          albumResult.value = await search_api.searchAlbum(keyword.value);
          break;
        case 'mv':
          mvResult.value = await search_api.searchMv(keyword.value);
          break;
        case 'author':
          authorResult.value = await search_api.searchAuthor(keyword.value);
          break;
      }
    } catch (e) {
      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  /// 指定类型是否已有结果
  bool hasTypeResult(String type) {
    switch (type) {
      case 'song':
        return songResult.value != null;
      case 'special':
        return specialResult.value != null;
      case 'album':
        return albumResult.value != null;
      case 'mv':
        return mvResult.value != null;
      case 'author':
        return authorResult.value != null;
      default:
        return false;
    }
  }

  /// 切换 Tab
  void selectTab(int index) {
    if (selectedTabIndex.value == index) return;
    selectedTabIndex.value = index;

    // 非综合 Tab 时，如果还没有加载过数据，则加载对应类型的数据
    if (index > 0) {
      final type = tabs[index]['key']!;
      if (!hasTypeResult(type)) {
        searchByType(type);
      }
    }
  }

  /// 清空各分类结果
  void _resetTypeResults() {
    songResult.value = null;
    specialResult.value = null;
    albumResult.value = null;
    mvResult.value = null;
    authorResult.value = null;
  }

  /// 重置搜索状态
  void reset() {
    keyword.value = '';
    selectedTabIndex.value = 0;
    complexResult.value = null;
    _resetTypeResults();
    isLoading.value = false;
    isFailed.value = false;
  }
}

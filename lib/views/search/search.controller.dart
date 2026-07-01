import 'package:get/get.dart';
import 'package:ku_gou_music/api/search/search.dart' as search_api;
import 'package:ku_gou_music/models/search/search_complex_response.dart';
import 'package:ku_gou_music/models/search/search_song_response.dart';

/// 搜索控制器
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

  /// 分类搜索结果（单曲/歌单/专辑/MV/歌手）
  final Rx<SearchSongResponse?> typedResult = Rx<SearchSongResponse?>(null);

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
    isLoading.value = true;
    isFailed.value = false;

    try {
      final result = await search_api.searchComplex(keyword.value);
      print(result);
      complexResult.value = result;
    } catch (e) {
      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  /// 执行分类搜索
  Future<void> searchByType(String type) async {
    if (keyword.value.isEmpty) return;

    isLoading.value = true;
    isFailed.value = false;

    try {
      final result = await search_api.search(keyword.value, type);
      typedResult.value = result;
    } catch (e) {
      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  /// 切换 Tab
  void selectTab(int index) {
    if (selectedTabIndex.value == index) return;
    selectedTabIndex.value = index;

    // 非综合 Tab 时，加载对应类型的数据
    if (index > 0) {
      final type = tabs[index]['key']!;
      searchByType(type);
    }
  }

  /// 重置搜索状态
  void reset() {
    keyword.value = '';
    selectedTabIndex.value = 0;
    complexResult.value = null;
    typedResult.value = null;
    isLoading.value = false;
    isFailed.value = false;
  }
}

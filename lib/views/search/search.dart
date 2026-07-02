import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/models/search/search_author_info.dart';
import 'package:ku_gou_music/models/search/search_collect_info.dart';
import 'package:ku_gou_music/models/search/search_complex_response.dart';
import 'package:ku_gou_music/models/search/search_mv_info.dart';
import 'package:ku_gou_music/models/search/search_song_info.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'search.controller.dart' as search_ctrl;

const _pinkColor = Color(0xFFFF5E8A);
const _greyBgColor = Color(0xFFF5F5F5);

class SearchPage extends StatelessWidget {
  final String? initialKeyword;

  const SearchPage({super.key, this.initialKeyword});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(search_ctrl.SearchController());

    // 如果有初始关键词，自动搜索
    if (initialKeyword != null && initialKeyword!.isNotEmpty) {
      controller.search(initialKeyword!);
    }

    return Scaffold(
      appBar: TitleBar(
        searchField: TitleSearchField(
          hintText: '搜索歌曲、歌手、歌单...',
          initialKeyword: initialKeyword,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.isFailed.value) {
          return _buildErrorWidget(controller);
        }
        if (controller.keyword.value.isEmpty) {
          return _buildEmptyWidget();
        }
        return _buildTabContent(controller, context);
      }),
    );
  }

  Widget _buildErrorWidget(search_ctrl.SearchController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          const Text('搜索失败'),
          TextButton(
            onPressed: () => controller.search(controller.keyword.value),
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('输入关键词开始搜索', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  /// Tab 栏（不含 Obx，由调用方包裹）
  Widget _buildTabBar(search_ctrl.SearchController controller) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: search_ctrl.SearchController.tabs.length,
        itemBuilder: (context, index) {
          final isSelected = controller.selectedTabIndex.value == index;
          final label = search_ctrl.SearchController.tabs[index]['label']!;
          return GestureDetector(
            onTap: () => controller.selectTab(index),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? _pinkColor : _greyBgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 根据当前 Tab 构建内容
  Widget _buildTabContent(search_ctrl.SearchController controller, BuildContext context) {
    return Obx(() {
      final index = controller.selectedTabIndex.value;
      switch (index) {
        case 0:
          return _buildComplexTab(controller, context);
        case 1:
          return _buildSongList(controller, isFullList: true);
        case 2:
          return _buildSpecialGrid(controller, isFullList: true);
        case 3:
          return _buildAlbumGrid(controller, isFullList: true);
        case 4:
          return _buildMvGrid(controller, isFullList: true);
        case 5:
          return _buildAuthorList(controller, isFullList: true);
        default:
          return const SizedBox.shrink();
      }
    });
  }

  // ==================== 综合 Tab ====================

  Widget _buildComplexTab(search_ctrl.SearchController controller, BuildContext context) {
    return Obx(() {
      final result = controller.complexResult.value;
      if (result == null) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }

      // 从 lists 中按 type 查找各分组
      final songGroup = _findGroup(result, 'song');
      final specialGroup = _findGroup(result, 'collect'); // 歌单在综合搜索中类型为 collect
      final mvGroup = _findGroup(result, 'mv');
      final authorGroup = _findGroup(result, 'author');

      return CustomScrollView(
        slivers: [
          // Tab 栏吸顶
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarSliverDelegate(
              child: _buildTabBar(controller),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          // 歌手区块
          if (authorGroup != null && authorGroup.authorList.isNotEmpty)
            SliverToBoxAdapter(child: _buildAuthorSection(authorGroup, controller)),
          // 单曲区块
          if (songGroup != null && songGroup.songList.isNotEmpty)
            SliverToBoxAdapter(child: _buildSongSection(songGroup, controller)),
          // 歌单区块
          if (specialGroup != null && specialGroup.collectList.isNotEmpty)
            SliverToBoxAdapter(child: _buildSpecialSection(specialGroup, controller, context)),
          // MV 区块
          if (mvGroup != null && mvGroup.mvList.isNotEmpty)
            SliverToBoxAdapter(child: _buildMvSection(mvGroup, controller, context)),
          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      );
    });
  }

  /// 从综合搜索结果中查找指定类型的分组
  SearchComplexGroup? _findGroup(SearchComplexResponse response, String type) {
    try {
      return response.lists.firstWhere((g) => g.type == type);
    } catch (_) {
      return null;
    }
  }

  // ==================== 歌手区块 ====================

  Widget _buildAuthorSection(SearchComplexGroup authorGroup, search_ctrl.SearchController controller) {
    final authors = authorGroup.authorList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('歌手', authorGroup.total, () => controller.selectTab(5)),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: authors.length,
            itemBuilder: (context, index) {
              return _AuthorCard(author: authors[index]);
            },
          ),
        ),
      ],
    );
  }

  // ==================== 单曲区块 ====================

  Widget _buildSongSection(SearchComplexGroup songGroup, search_ctrl.SearchController controller) {
    final songs = songGroup.songList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('单曲', songGroup.total, () => controller.selectTab(1)),
        ...songs.take(5).map((song) => _SongListItem(song: song)),
      ],
    );
  }

  // ==================== 歌单区块 ====================

  Widget _buildSpecialSection(SearchComplexGroup specialGroup, search_ctrl.SearchController controller, BuildContext context) {
    final collects = specialGroup.collectList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('歌单', specialGroup.total, () => controller.selectTab(2)),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: collects.length,
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                margin: const EdgeInsets.only(right: 12),
                child: _SpecialCard(collect: collects[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  // ==================== MV 区块 ====================

  Widget _buildMvSection(SearchComplexGroup mvGroup, search_ctrl.SearchController controller, BuildContext context) {
    final mvs = mvGroup.mvList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('MV', mvGroup.total, () => controller.selectTab(4)),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: mvs.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: 12),
                child: _MvCard(mv: mvs[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  // ==================== 区块标题 ====================

  Widget _buildSectionHeader(String title, int count, VoidCallback onTapMore) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onTapMore,
            child: Text(
              '查看更多($count)',
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== 单曲列表（完整） ====================

  Widget _buildSongList(search_ctrl.SearchController controller, {required bool isFullList}) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }

      final songs = isFullList
          ? (controller.typedResult.value?.lists ?? [])
          : (_findGroup(controller.complexResult.value!, 'song')?.songList ?? []);

      if (songs.isEmpty) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: Text('暂无单曲', style: TextStyle(color: Colors.grey))),
            ),
          ],
        );
      }

      return CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarSliverDelegate(
              child: _buildTabBar(controller),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _SongListItem(song: songs[index]),
              childCount: songs.length,
            ),
          ),
        ],
      );
    });
  }

  // ==================== 歌单网格（完整） ====================

  Widget _buildSpecialGrid(search_ctrl.SearchController controller, {required bool isFullList}) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }

      final collectGroup = _findGroup(controller.complexResult.value!, 'collect');
      final collects = collectGroup?.collectList ?? [];

      if (collects.isEmpty) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: Text('暂无歌单', style: TextStyle(color: Colors.grey))),
            ),
          ],
        );
      }

      return CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarSliverDelegate(
              child: _buildTabBar(controller),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.82,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _SpecialCard(collect: collects[index]),
                childCount: collects.length,
              ),
            ),
          ),
        ],
      );
    });
  }

  // ==================== 专辑网格（完整） ====================

  Widget _buildAlbumGrid(search_ctrl.SearchController controller, {required bool isFullList}) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }

      final songs = isFullList
          ? (controller.typedResult.value?.lists ?? [])
          : (_findGroup(controller.complexResult.value!, 'album')?.songList ?? []);

      if (songs.isEmpty) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: Text('暂无专辑', style: TextStyle(color: Colors.grey))),
            ),
          ],
        );
      }

      return CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarSliverDelegate(
              child: _buildTabBar(controller),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.82,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _AlbumCard(song: songs[index]),
                childCount: songs.length,
              ),
            ),
          ),
        ],
      );
    });
  }

  // ==================== MV 网格（完整） ====================

  Widget _buildMvGrid(search_ctrl.SearchController controller, {required bool isFullList}) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }

      final mvGroup = _findGroup(controller.complexResult.value!, 'mv');
      final mvs = mvGroup?.mvList ?? [];

      if (mvs.isEmpty) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: Text('暂无MV', style: TextStyle(color: Colors.grey))),
            ),
          ],
        );
      }

      return CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarSliverDelegate(
              child: _buildTabBar(controller),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _MvCard(mv: mvs[index]),
                childCount: mvs.length,
              ),
            ),
          ),
        ],
      );
    });
  }

  // ==================== 歌手列表（完整） ====================

  Widget _buildAuthorList(search_ctrl.SearchController controller, {required bool isFullList}) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }

      final authorGroup = _findGroup(controller.complexResult.value!, 'author');
      final authors = authorGroup?.authorList ?? [];

      if (authors.isEmpty) {
        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarSliverDelegate(
                child: _buildTabBar(controller),
              ),
            ),
            const SliverFillRemaining(
              child: Center(child: Text('暂无歌手', style: TextStyle(color: Colors.grey))),
            ),
          ],
        );
      }

      return CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarSliverDelegate(
              child: _buildTabBar(controller),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _AuthorListItem(author: authors[index]),
              childCount: authors.length,
            ),
          ),
        ],
      );
    });
  }
}

// ==================== Sliver 吸顶 Tab 栏委托 ====================

class _TabBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _TabBarSliverDelegate({required this.child});

  @override
  double get minExtent => 44;

  @override
  double get maxExtent => 44;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation: overlapsContent ? 2 : 0,
      color: Colors.white,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarSliverDelegate oldDelegate) {
    return true;
  }
}

// ==================== 子组件 ====================

/// 单曲列表项
class _SongListItem extends StatelessWidget {
  final SearchSongInfo song;

  const _SongListItem({required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: 跳转到歌曲详情页
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                width: 56,
                height: 56,
                child: CachedNetworkImage(
                  imageUrl: getImageUri(song.coverUrl150),
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: _greyBgColor,
                    child: const Icon(Icons.music_note, color: Colors.grey, size: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.songName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: _pinkColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.artistName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Text(
              song.durationLabel,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}

/// 歌手卡片（横向列表用）
class _AuthorCard extends StatelessWidget {
  final SearchAuthorInfo author;

  const _AuthorCard({required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipOval(
            child: SizedBox(
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                imageUrl: getImageUri(author.avatar),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: _greyBgColor,
                  child: const Icon(Icons.person, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            author.authorName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            '歌曲: ${author.audioCount}',
            style: TextStyle(fontSize: 11, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

/// 歌手列表项（完整列表用）
class _AuthorListItem extends StatelessWidget {
  final SearchAuthorInfo author;

  const _AuthorListItem({required this.author});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: 跳转到歌手详情页
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            ClipOval(
              child: SizedBox(
                width: 56,
                height: 56,
                child: CachedNetworkImage(
                  imageUrl: getImageUri(author.avatar),
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: _greyBgColor,
                    child: const Icon(Icons.person, color: Colors.grey, size: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author.authorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '歌曲: ${author.audioCount} · 粉丝: ${author.fansNum}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

/// 歌单卡片
class _SpecialCard extends StatelessWidget {
  final SearchCollectInfo collect;

  const _SpecialCard({required this.collect});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist/detail', arguments: {
          'id': collect.specialId.toString(),
          'name': collect.specialName,
          'pic': collect.img,
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: getImageUri(collect.img),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: _greyBgColor,
                  child: const Icon(Icons.music_note, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  collect.specialName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  '${collect.songCount}首 · ${collect.nickname}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// MV 卡片
class _MvCard extends StatelessWidget {
  final SearchMvInfo mv;

  const _MvCard({required this.mv});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: 跳转到 MV 播放页
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: getImageUri(mv.imgUrl),
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Container(
                      color: _greyBgColor,
                      child: const Icon(Icons.videocam, color: Colors.grey),
                    ),
                  ),
                  const Center(
                    child: Icon(Icons.play_circle_outline, color: Colors.white, size: 40),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            mv.mvName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            mv.singerName,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

/// 专辑卡片
class _AlbumCard extends StatelessWidget {
  final SearchSongInfo song;

  const _AlbumCard({required this.song});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: 跳转到专辑详情页
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: getImageUri(song.image),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: _greyBgColor,
                  child: const Icon(Icons.album, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            song.albumName.isNotEmpty ? song.albumName : song.songName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            song.artistName,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

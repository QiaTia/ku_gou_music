import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/api/discover/discover.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking.controller.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking_layout.dart';

/// 音乐榜单内容（对应 RankingContent.vue）
class RankingContent extends StatefulWidget {
  const RankingContent({super.key});

  @override
  State<RankingContent> createState() => _RankingContentState();
}

class _RankingContentState extends State<RankingContent> {
  late final DiscoverRankingController controller;

  /// 组件私有滚动控制器：每个滚动视图独占一个，避免跨视图共享
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = Get.put(DiscoverRankingController());
    Get.find<DiscoverController>().attachScroll(_scrollController);
  }

  @override
  void dispose() {
    Get.find<DiscoverController>().detachScroll(_scrollController);
    _scrollController.dispose();
    Get.delete<DiscoverRankingController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    // 卡片高度随窗口宽度变化（对齐 Vue 断点 1200 / 768）
    final cardHeight =
        pageWidth > 1200 ? 600.0 : (pageWidth > 768 ? 500.0 : 400.0);

    return Obx(() {
      if (controller.allRanks.isEmpty && controller.displayedRanks.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        children: [
          _RankSelector(controller: controller),
          const SizedBox(height: 18),
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(bottom: DiscoverLayout.bottomInset(context)),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 700,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                mainAxisExtent: cardHeight,
              ),
              itemCount: controller.displayedRanks.length,
              itemBuilder: (context, index) =>
                  _RankingItem(state: controller.displayedRanks[index]),
            ),
          ),
        ],
      );
    });
  }
}

/// 榜单选择器（单行横向滑动）
class _RankSelector extends StatelessWidget {
  final DiscoverRankingController controller;

  const _RankSelector({required this.controller});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      final ranks = controller.sortedRanks;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1D1D1D) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.24 : 0.08),
              blurRadius: isDark ? 28 : 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: ranks.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final rank = ranks[index];
              return _RankChip(
                label: rank.rankname,
                active: controller.selectedRankIds.contains(rank.rankid),
                onTap: () => controller.toggleRank(rank),
              );
            },
          ),
        ),
      );
    });
  }
}

class _RankChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _RankChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
            color: active
                ? primary
                : isDark
                    ? const Color(0xFF2A2A2A)
                    : const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: active
                  ? Colors.white
                  : isDark
                      ? Colors.white.withValues(alpha: 0.62)
                      : const Color(0xFF666666),
            ),
          ),
        ),
      ),
    );
  }
}

/// 单个榜单卡片
class _RankingItem extends StatelessWidget {
  final RankTabState state;

  const _RankingItem({required this.state});

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    final coverSize = pageWidth > 1200 ? 100.0 : (pageWidth > 768 ? 80.0 : 60.0);
    final titleSize = pageWidth > 1200 ? 24.0 : (pageWidth > 768 ? 20.0 : 16.0);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1D1D1D) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.24 : 0.08),
            blurRadius: isDark ? 28 : 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _RankHeader(
            state: state,
            coverSize: coverSize,
            titleSize: titleSize,
          ),
          Expanded(child: _RankSongList(state: state)),
        ],
      ),
    );
  }
}

/// 榜单头部：封面 + 标题 + 播放按钮
class _RankHeader extends StatelessWidget {
  final RankTabState state;
  final double coverSize;
  final double titleSize;

  const _RankHeader({
    required this.state,
    required this.coverSize,
    required this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;
    final rank = state.rank;
    final titleColor =
        rank.albumCoverColor.isNotEmpty ? _parseColor(rank.albumCoverColor) : null;

    return Container(
      padding: EdgeInsets.all(pagePadding(context)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xFF643D49).withValues(alpha: 0.13),
            const Color(0xFF643D49).withValues(alpha: 0),
          ],
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  width: coverSize,
                  height: coverSize,
                  child: CachedNetworkImage(
                    imageUrl: rank.imgurl,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => Container(color: Colors.grey.withValues(alpha: 0.2)),
                    errorWidget: (_, _, _) => Container(
                      color: Colors.grey.withValues(alpha: 0.2),
                      child: Icon(Icons.leaderboard, color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
              SizedBox(width: pageWidth(context) > 768 ? 20 : 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rank.rankname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.w600,
                        color: titleColor ??
                            (isDark ? Colors.white.withValues(alpha: 0.86) : Colors.black87),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Get.find<DiscoverRankingController>().formatIntro(rank.intro),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white.withValues(alpha: 0.62) : const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
              // 播放按钮占位（避免文字被悬浮按钮遮挡）
              const SizedBox(width: 56),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: _PlayRankButton(state: state, primary: primary),
          ),
        ],
      ),
    );
  }

  double pagePadding(BuildContext context) =>
      MediaQuery.of(context).size.width > 768 ? 16 : 12;

  double pageWidth(BuildContext context) => MediaQuery.of(context).size.width;

  Color? _parseColor(String hex) {
    final value = int.tryParse(hex.replaceFirst('#', '0xFF'));
    return value != null ? Color(value) : null;
  }
}

class _PlayRankButton extends StatefulWidget {
  final RankTabState state;
  final Color primary;

  const _PlayRankButton({required this.state, required this.primary});

  @override
  State<_PlayRankButton> createState() => _PlayRankButtonState();
}

class _PlayRankButtonState extends State<_PlayRankButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => Get.find<DiscoverRankingController>().playRank(widget.state),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovering
                ? widget.primary
                : isDark
                    ? const Color(0xFF202228).withValues(alpha: 0.92)
                    : Colors.white.withValues(alpha: 0.9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.28 : 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.play_arrow,
            size: 20,
            color: _hovering ? Colors.white : widget.primary,
          ),
        ),
      ),
    );
  }
}

/// 榜内歌曲列表（内滚动 + 分页加载）
class _RankSongList extends StatefulWidget {
  final RankTabState state;

  const _RankSongList({required this.state});

  @override
  State<_RankSongList> createState() => _RankSongListState();
}

class _RankSongListState extends State<_RankSongList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pagination = widget.state;
    if (pagination.loading.value || !pagination.hasMore.value) return;
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    if (position.pixels + position.viewportDimension >= position.maxScrollExtent - 50) {
      final controller = Get.find<DiscoverRankingController>();
      controller.loadRankSongs(widget.state, widget.state.currentPage + 1, true);
    }
  }

  Future<void> _playSong(DiscoverRankSong song) async {
    final controller = Get.find<DiscoverRankingController>();
    final ok = await controller.playSong(song);
    if (!ok && mounted) {
      Get.snackbar('无法播放'.tr, '《${song.songname}》暂时无法播放'.tr);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    return Obx(() => ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: state.songs.length + 1,
          itemBuilder: (context, index) {
            if (index == state.songs.length) {
              // 底部状态：加载中 / 已全部加载
              if (state.loading.value) {
                return  Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 8),
                      Text('加载中...'.tr, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                );
              }
              if (!state.hasMore.value && state.songs.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Color(0x11FFFFFF))),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: Text(
                      '已加载全部歌曲'.tr,
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white.withValues(alpha: 0.42)
                            : const Color(0xFF999999),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox(height: 8);
            }
            return _SongItem(
              song: state.songs[index],
              index: index,
              onTap: () => _playSong(state.songs[index]),
            );
          },
        ));
  }
}

class _SongItem extends StatefulWidget {
  final DiscoverRankSong song;
  final int index;
  final VoidCallback onTap;

  const _SongItem({
    required this.song,
    required this.index,
    required this.onTap,
  });

  @override
  State<_SongItem> createState() => _SongItemState();
}

class _SongItemState extends State<_SongItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageWidth = MediaQuery.of(context).size.width;
    final song = widget.song;
    final isTopThree = widget.index < 3;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Material(
        color: _hovering
            ? (isDark ? const Color(0xFF26282F) : const Color(0xFFF8F9FA))
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                // 排名
                SizedBox(
                  width: pageWidth > 768 ? 40 : 30,
                  child: Center(
                    child: isTopThree
                        ? ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFFFF6B6B), Color(0xFFFF8787)],
                            ).createShader(bounds),
                            child: Text(
                              '${widget.index + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            '${widget.index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? Colors.white.withValues(alpha: 0.42)
                                  : const Color(0xFF999999),
                            ),
                          ),
                  ),
                ),
                // 封面（悬停显示播放按钮）
                SizedBox(
                  width: pageWidth > 768 ? 16 : 10,
                ),
                SizedBox(
                  width: pageWidth > 768 ? 48 : 40,
                  height: pageWidth > 768 ? 48 : 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: song.unionCoverSmall.isNotEmpty
                              ? song.unionCoverSmall
                              : song.unionCover,
                          fit: BoxFit.cover,
                          placeholder: (_, _) =>
                              Container(color: Colors.grey.withValues(alpha: 0.2)),
                          errorWidget: (_, _, _) => Container(
                            color: Colors.grey.withValues(alpha: 0.2),
                            child: const Icon(Icons.music_note,
                                color: Colors.grey, size: 18),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _hovering ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.4),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: pageWidth > 768 ? 16 : 10),
                // 歌曲信息
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.songname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.86)
                                    : const Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              song.authorName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark
                                    ? Colors.white.withValues(alpha: 0.62)
                                    : const Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (pageWidth > 768) ...[
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Text(
                            song.albumName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark
                                  ? Colors.white.withValues(alpha: 0.42)
                                  : const Color(0xFF999999),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(width: 16),
                      Text(
                        formatMilliseconds(song.duration),
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.42)
                              : const Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

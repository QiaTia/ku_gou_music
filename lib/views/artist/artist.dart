import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/views/artist/artist.controller.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';

/// 歌手详情页（对应 MoeKoe PlaylistDetail.vue 的 singerid 分支）
///
/// 头部：歌手封面 + 名字 + 粉丝数 + 关注按钮 + 简介
/// 排序切换：最热 / 最新
/// 歌曲列表：30/页 滚动加载更多，点击播放
class ArtistScreen extends StatefulWidget {
  final int singerid;

  /// 初始关注状态（从个人页"我关注的歌手"进入时为 true）
  final bool initialFollowed;

  const ArtistScreen({super.key, required this.singerid, this.initialFollowed = false});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  /// 页面直接持有控制器（不经 GetX 注册表）：路由每次 push 都构造新实例，
  /// 避免 Get.put 复用旧实例导致返回后再进显示上一个歌手的数据
  late final ArtistController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ArtistController(
      singerid: widget.singerid,
      initialFollowed: widget.initialFollowed,
    );
    // 未注册到 GetX，手动触发初始化加载
    _controller.onInit();
  }

  @override
  void dispose() {
    _controller.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 800;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF17181C) : const Color(0xFFF7F8FA),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              // 移动端用接近方形的封面高度（对齐 PlaylistScreen），PC 端横幅
              expandedHeight: isWide ? 240.0 : width * 0.86,
              collapsedHeight: kToolbarHeight,
              backgroundColor: isDark ? const Color(0xFF221A1B) : const Color(0xFF5C4033),
              // 页面由 Get.toNamed 推到根导航器，直接 Get.back() 返回；
              // 侧边栏 LocalRouterController.goBack() 只作用于其内部 Navigator，无法弹本页。
              // 移动端不设 leading，使用系统返回箭头；标题折叠进工具栏时显示歌手名
              leading: isWide
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 20),
                      onPressed: () => Get.back(),
                    )
                  : null,
              title: isWide
                  ? null
                  : Obx(
                      () => Text(
                        controller.detail['author_name']?.toString() ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
              flexibleSpace: FlexibleSpaceBar(
                background: _ArtistBanner(controller: controller, isWide: isWide),
                titlePadding: EdgeInsets.zero,
              ),
            ),
            // 排序切换 + 播放全部
            SliverToBoxAdapter(
              child: _SortBar(controller: controller),
            ),
          ];
        },
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.isFailed.value && controller.songs.isEmpty) {
            return _FailureView(onRetry: controller.loadData);
          }
          if (controller.songs.isEmpty) {
            return const _EmptyView();
          }
          return _SongList(controller: controller);
        }),
      ),
    );
  }
}

/// 头部横幅：渐变背景 + 封面 + 名字 + 粉丝 + 关注按钮 + 简介
/// PC：横排（封面 + 信息列）；移动端：纵向居中（圆形头像 + 名字 + 数据）
class _ArtistBanner extends StatelessWidget {
  final ArtistController controller;
  final bool isWide;
  const _ArtistBanner({required this.controller, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final detail = controller.detail;
      final name = detail['author_name']?.toString() ?? '';
      final fans = detail['fansnums'];
      final fansText = fans is num
          ? _formatFans(fans)
          : (fans is String && fans.isNotEmpty ? fans : '');
      String avatar = detail['sizable_avatar']?.toString() ?? '';
      if (avatar.contains('{size}')) {
        avatar = avatar.replaceAll('{size}', '480');
      }
      final intro = detail['intro']?.toString() ?? '';

      return Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF5C4033), Color(0xFF8B6E5A), Color(0xFFA08070)],
              ),
            ),
          ),
          // 封面做低透明度背景
          if (avatar.isNotEmpty)
            Opacity(
              opacity: 0.35,
              child: CachedNetworkImage(
                imageUrl: avatar,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
            ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: isWide ? const [0.3, 1.0] : const [0.0, 0.45, 1.0],
                colors: isWide
                    ? const [Colors.transparent, Color(0xCC0F1016)]
                    : const [
                        Color(0x8A000000),
                        Colors.transparent,
                        Color(0xCC0F1016),
                      ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: isWide
                  ? const EdgeInsets.fromLTRB(72, 12, 24, 16)
                  // 移动端：避开顶部工具栏（返回箭头 + 歌手名标题）
                  : const EdgeInsets.fromLTRB(16, kToolbarHeight + 8, 16, 20),
              child: isWide
                  ? _buildWideContent(context, name, fansText, avatar, intro)
                  : _buildMobileContent(context, name, fansText, avatar, intro),
            ),
          ),
        ],
      );
    });
  }

  /// PC 布局：横排
  Widget _buildWideContent(
      BuildContext context, String name, String fansText, String avatar, String intro) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 140,
            height: 140,
            child: _avatarWidget(avatar, 48, radius: 12),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  if (fansText.isNotEmpty)
                    Text(
                      '粉丝: $fansText'.tr,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.87),
                      ),
                    ),
                  const SizedBox(width: 16),
                  _followButton(context),
                ],
              ),
              if (intro.trim().isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  intro.trim(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  /// 移动端布局：纵向居中
  Widget _buildMobileContent(
      BuildContext context, String name, String fansText, String avatar, String intro) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: 110,
            height: 110,
            child: _avatarWidget(avatar, 40),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (fansText.isNotEmpty)
              Text(
                '粉丝: $fansText'.tr,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.87),
                ),
              ),
            const SizedBox(width: 12),
            _followButton(context),
          ],
        ),
        if (intro.trim().isNotEmpty) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              intro.trim(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// 头像组件（带占位）
  Widget _avatarWidget(String avatar, double iconSize, {double radius = 8}) {
    if (avatar.isEmpty) {
      return Container(
        color: Colors.white24,
        child: Icon(Icons.person, size: iconSize, color: Colors.white70),
      );
    }
    return CachedNetworkImage(
      imageUrl: avatar,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Container(
        color: Colors.white24,
        child: Icon(Icons.person, size: iconSize, color: Colors.white70),
      ),
    );
  }

  /// 关注/已关注按钮
  Widget _followButton(BuildContext context) {
    return Obx(() {
      final followed = controller.isFollowed.value;
      return GestureDetector(
        onTap: controller.toggleFollow,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            color: followed
                ? Colors.white.withValues(alpha: 0.2)
                : primary(context),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                followed ? Icons.favorite : Icons.favorite_outline,
                size: 14,
                color: followed ? Colors.pinkAccent : Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                followed ? '已关注'.tr : '关注'.tr,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    });
  }

  Color primary(BuildContext context) => Theme.of(context).colorScheme.primary;

  String _formatFans(num fans) {
    if (fans >= 100000000) {
      return '${(fans / 100000000).toStringAsFixed(1)}亿'.tr;
    }
    if (fans >= 10000) {
      return '${(fans / 10000).toStringAsFixed(1)}万'.tr;
    }
    return '$fans';
  }
}

/// 排序切换 + 播放全部
class _SortBar extends StatelessWidget {
  final ArtistController controller;
  const _SortBar({required this.controller});

  // getter 每次访问时求值，.tr 随当前语言动态翻译
  static Map<String, String> get _sorts => {'hot': '最热'.tr, 'new': '最新'.tr};

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;
    final isWide = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: EdgeInsets.fromLTRB(isWide ? 20 : 12, 10, isWide ? 20 : 12, 10),
      child: Row(
        children: [
          for (final entry in _sorts.entries)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Obx(() {
                final selected = controller.sortType.value == entry.key;
                return GestureDetector(
                  onTap: () => controller.changeSort(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: selected
                          ? primary
                          : (isDark
                              ? Colors.white.withValues(alpha: 0.06)
                              : const Color(0xFFF5F5F5)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 13,
                        color: selected
                            ? Colors.white
                            : (isDark
                                ? Colors.white.withValues(alpha: 0.62)
                                : Colors.black54),
                        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          const Spacer(),
          TextButton.icon(
            onPressed: controller.playAll,
            icon: Icon(Icons.play_circle_outline_rounded, size: 20, color: primary),
            label: Text(
              '播放全部'.tr,
              style: TextStyle(fontSize: 13, color: primary),
            ),
          ),
        ],
      ),
    );
  }
}

/// 歌曲列表（滚动到底自动加载下一页）
class _SongList extends StatelessWidget {
  final ArtistController controller;
  const _SongList({required this.controller});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels >=
            notification.metrics.maxScrollExtent - 200) {
          controller.loadMore();
        }
        return false;
      },
      child: Obx(() {
        final songs = controller.songs;
        return ListView.separated(
          itemCount: songs.length + (controller.isLoadingMore.value ? 1 : 0),
          separatorBuilder: (_, _) => const SizedBox.shrink(),
          itemBuilder: (context, index) {
            if (index >= songs.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            }
            final song = songs[index];
            return _SongRow(
              index: index + 1,
              song: song,
              isDark: isDark,
              primary: primary,
              onTap: () async {
                final ok = await controller.playSong(song);
                if (!ok) {
                  Get.snackbar('无法播放'.tr, '《${song.name}》暂时无法播放'.tr);
                }
              },
            );
          },
        );
      }),
    );
  }
}

/// 歌曲行
class _SongRow extends StatelessWidget {
  final int index;
  final SongItemStruct song;
  final bool isDark;
  final Color primary;
  final VoidCallback onTap;
  const _SongRow({
    required this.index,
    required this.song,
    required this.isDark,
    required this.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor =
        isDark ? Colors.white.withValues(alpha: 0.88) : const Color(0xFF2B2B2B);
    final subColor =
        isDark ? Colors.white.withValues(alpha: 0.5) : Colors.grey;
    final isWide = MediaQuery.of(context).size.width > 800;
    final hPadding = isWide ? 20.0 : 12.0;
    final coverSize = isWide ? 44.0 : 40.0;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Text(
                '$index',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: index <= 3 ? primary : subColor,
                  fontWeight: index <= 3 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                width: coverSize,
                height: coverSize,
                child: song.cover.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: song.cover,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            Icon(Icons.music_note, size: 20, color: subColor),
                      )
                    : Icon(Icons.music_note, size: 20, color: subColor),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          song.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                        ),
                      ),
                      if (song.is_sq) ...[
                        const SizedBox(width: 4),
                        _qualityTag('SQ', primary),
                      ],
                      if (song.is_hq) ...[
                        const SizedBox(width: 4),
                        _qualityTag('HQ', primary),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    song.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: subColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              formatDuration(song.timelen ~/ 1000),
              style: TextStyle(fontSize: 12, color: subColor),
            ),
            // 移动端隐藏行尾播放图标，点击整行即可播放
            if (isWide) ...[
              const SizedBox(width: 16),
              Icon(
                Icons.play_circle_outline_rounded,
                size: 22,
                color: subColor,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _qualityTag(String label, Color primary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: primary.withValues(alpha: 0.6), width: 0.8),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 9,
          color: primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// 空状态
class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 80, color: Colors.grey.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(
            '暂无歌曲'.tr,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.white.withValues(alpha: 0.4) : const Color(0xFF909399),
            ),
          ),
        ],
      ),
    );
  }
}

/// 失败重试
class _FailureView extends StatelessWidget {
  final VoidCallback onRetry;
  const _FailureView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '加载失败，请稍后重试'.tr,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withValues(alpha: 0.4)
                  : const Color(0xFF909399),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 16),
            label:  Text('重试'.tr),
          ),
        ],
      ),
    );
  }
}

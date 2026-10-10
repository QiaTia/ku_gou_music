import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:ku_gou_music/views/my/playlist.controller.dart';

/// 「我的」页面（对应 MoeKoeMusic 的 Library.vue）
///
/// - 用户信息卡：背景图 + 渐变、头像、昵称、等级、VIP 徽章、签名、社交数据、性别/听歌时长/乐龄、签到/VIP 操作
/// - 我喜欢听：听歌历史卡片网格（可关闭、标题点击全部播放）
/// - 分类 Tab：我创建的歌单 / 我收藏的歌单 / 我收藏的专辑 / 我关注的歌手 / 我关注的好友
class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyPlaylistController());
    final routerController = Get.find<LocalRouterController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF17181C) : const Color(0xFFF7F8FA),
      // 各区块自行用 Obx 订阅响应式数据，外层无需包裹（否则 Obx 无可观察变量会报
      // "improper use of a GetX"）
      body: CustomScrollView(
        slivers: [
          _ProfileHeader(
            controller: controller,
            onBack: () => routerController.goBack(),
          ),
          SliverToBoxAdapter(
            child: _ListenHistorySection(controller: controller),
          ),
          SliverToBoxAdapter(
            child: _CategoryTabs(controller: controller),
          ),
          _ContentGrid(controller: controller),
          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
    );
  }
}

/// 用户信息卡
class _ProfileHeader extends StatelessWidget {
  final MyPlaylistController controller;
  final VoidCallback onBack;
  const _ProfileHeader({required this.controller, required this.onBack});

  String _formatListenDuration(int minutes) {
    if (minutes <= 0) return '0分钟'.tr;
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h > 0) return '$h小时 $m分钟'.tr;
    return '$m分钟'.tr;
  }

  String _musicAge() {
    final rtime = controller.userInfo.value?.rtime ?? 0;
    if (rtime <= 0) return '';
    final registerDate = DateTime.fromMillisecondsSinceEpoch(rtime * 1000);
    final years = DateTime.now().year - registerDate.year;
    return '$years 年'.tr;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < size.height;

    return SliverAppBar(
      pinned: true,
      expandedHeight: 260,
      collapsedHeight: 64,
      backgroundColor: isDark ? const Color(0xFF221A1B) : const Color(0xFF5C4033),
      leading: isMobile
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
              onPressed: onBack,
            ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final collapsed = constraints.maxHeight < 130;

          // 包一层 Obx：userInfo 异步加载完成后头像/背景图/标签才能刷新
          return Obx(() {
            final info = controller.userInfo.value;
            // 对齐 Vue（MoeAuth.UserInfo）：头像/昵称以登录时存储的账号信息为准，
            // get_my_info 接口值仅作登录数据缺失时的回退
            final loginPic = userInstance.pic ?? '';
            final pic = _ensureHttps(
              (loginPic.isNotEmpty ? loginPic : (info?.pic ?? ''))
                  .replaceAll('{size}', '480'),
            );
            final bgPic = _ensureHttps(info?.bgPic ?? '');

            return FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                // 底色渐变（对应 Vue profile-bg-color）
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF5C4033), Color(0xFF8B6E5A), Color(0xFFA08070)],
                    ),
                  ),
                ),
                // 背景图（透明度 0.42，对应 Vue）
                if (bgPic.isNotEmpty)
                  Opacity(
                    opacity: 0.42,
                    child: CachedNetworkImage(
                      imageUrl: bgPic,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const SizedBox.shrink(),
                    ),
                  ),
                // 底部加深渐变
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.4, 1.0],
                      colors: [Colors.transparent, Color(0xCC0F1016)],
                    ),
                  ),
                ),
                if (!collapsed)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(72, 24, 24, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // 头像（上移 20，白描边，对应 Vue）
                            Transform.translate(
                              offset: const Offset(0, -20),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.white24,
                                  backgroundImage: pic.isNotEmpty
                                      ? CachedNetworkImageProvider(pic)
                                      : null,
                                  child: pic.isEmpty
                                      ? const Icon(Icons.person, size: 36, color: Colors.white70)
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Obx(() {
                                final info = controller.userInfo.value;
                                // 与头像同源：优先登录昵称，回退接口昵称
                                final loginNickname = userInstance.nickname ?? '';
                                final nickname = loginNickname.isNotEmpty
                                    ? loginNickname
                                    : (info?.nickname ?? '');
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            nickname,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        // 等级
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withValues(alpha: 0.2),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            'Lv.${info?.pGrade ?? 0}',
                                            style: const TextStyle(fontSize: 12, color: Colors.white),
                                          ),
                                        ),
                                        ..._buildVipBadges(),
                                      ],
                                    ),
                                    if ((info?.descri ?? '').isNotEmpty) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        info!.descri,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white.withValues(alpha: 0.87),
                                        ),
                                      ),
                                    ],
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        _StatItem(label: '关注'.tr, value: '${info?.follows ?? 0}'),
                                        _StatItem(label: '粉丝'.tr, value: '${info?.fans ?? 0}'),
                                        _StatItem(label: '好友'.tr, value: '${info?.friends ?? info?.friendTotal ?? 0}'),
                                        _StatItem(label: '访问'.tr, value: '${info?.hvisitors ?? info?.visitors ?? 0}'),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // 性别 / 听歌时长 / 乐龄
                        Obx(() {
                          final info = controller.userInfo.value;
                          final gender = info?.gender ?? 0;
                          final duration = info?.duration ?? 0;
                          final age = _musicAge();
                          return Row(
                            children: [
                              if (gender > 0)
                                _InfoTag(
                                  icon: gender == 1 ? Icons.male : Icons.female,
                                ),
                              if (duration > 0)
                                _InfoTag(text: '${_formatListenDuration(duration)} 听歌时长'.tr),
                              if (age.isNotEmpty)
                                _InfoTag(text: '乐龄 $age'.tr),
                            ],
                          );
                        }),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _ActionChip(label: '签到'.tr, onTap: controller.signIn),
                            const SizedBox(width: 10),
                            _ActionChip(label: 'VIP', onTap: controller.getVip),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        });
        },
      ),
    );
  }

  /// VIP 徽章（busiVip: [0] 概念版 / [1] 畅听版）
  List<Widget> _buildVipBadges() {
    final busiVip = controller.vipInfo.value?.busiVip ?? [];
    final badges = <Widget>[];
    final names = ['概念版'.tr, '畅听版'.tr];
    for (var i = 0; i < busiVip.length && i < 2; i++) {
      final item = busiVip[i];
      if (item.isVip != 1) continue;
      badges.add(const SizedBox(width: 6));
      badges.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE8C26B), Color(0xFFB8863B)],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'VIP ${names[i]}',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return badges;
  }
}

/// 将 http:// 图片 URL 升级为 https（对应 Vue 的 ensureHttps）
String _ensureHttps(String url) =>
    url.startsWith('http://') ? url.replaceFirst('http://', 'https://') : url;

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ' $label',
              style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.8)),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTag extends StatelessWidget {
  final IconData? icon;
  final String text;
  const _InfoTag({this.icon, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: Colors.white),
          ] else
            Text(
              text,
              style: const TextStyle(fontSize: 11, color: Colors.white),
            ),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _ActionChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(label, style: const TextStyle(fontSize: 12, color: Colors.white)),
      ),
    );
  }
}

/// 我喜欢听（听歌历史）
class _ListenHistorySection extends StatelessWidget {
  final MyPlaylistController controller;
  const _ListenHistorySection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Obx(() {
      final hidden = controller.isListenSectionHidden.value;
      final loading = controller.isLoading.value;
      final songs = controller.listenHistory;
      if (hidden || (!loading && songs.isEmpty)) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: controller.addAllSongsToQueue,
                  child: Text(
                    '我喜欢听'.tr,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: controller.hideListenSection,
                  icon: Icon(Icons.close, size: 14, color: isDark ? Colors.white38 : Colors.grey),
                  label: Text(
                    '关闭'.tr,
                    style: TextStyle(fontSize: 12, color: isDark ? Colors.white38 : Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (loading)
              // 骨架屏
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(8, (_) => _SkeletonCard(isDark: isDark)),
              )
            else
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: songs.map((song) {
                  return _ListenSongCard(
                    song: song,
                    isDark: isDark,
                    primary: primary,
                    onTap: () async {
                      final ok = await controller.playListenSong(song);
                      if (!ok) {
                        Get.snackbar('无法播放'.tr, '《${song.displayName}》暂时无法播放'.tr);
                      }
                    },
                  );
                }).toList(),
              ),
          ],
        ),
      );
    });
  }
}

class _SkeletonCard extends StatelessWidget {
  final bool isDark;
  const _SkeletonCard({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final base = isDark ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.05);
    return Container(
      width: 250,
      height: 64,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(width: 48, height: 48, decoration: BoxDecoration(color: base, borderRadius: BorderRadius.circular(8))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 12, width: 140, decoration: BoxDecoration(color: base, borderRadius: BorderRadius.circular(4))),
                const SizedBox(height: 8),
                Container(height: 10, width: 90, decoration: BoxDecoration(color: base, borderRadius: BorderRadius.circular(4))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListenSongCard extends StatelessWidget {
  final ListenSong song;
  final bool isDark;
  final Color primary;
  final VoidCallback onTap;
  const _ListenSongCard({
    required this.song,
    required this.isDark,
    required this.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cover = song.cover(size: 120);
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 250,
          height: 64,
          padding: const EdgeInsets.fromLTRB(8, 7, 8, 7),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.06) : Colors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: cover.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: cover,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.music_note, size: 20, color: Colors.grey[400]),
                        )
                      : Icon(Icons.music_note, size: 20, color: Colors.grey[400]),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white.withValues(alpha: 0.88) : const Color(0xFF2B2B2B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      song.singername,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.white.withValues(alpha: 0.58) : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
                child: const Icon(Icons.play_arrow, size: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 分类 Tab
class _CategoryTabs extends StatelessWidget {
  final MyPlaylistController controller;
  const _CategoryTabs({required this.controller});

  // getter 每次访问时求值，.tr 随当前语言动态翻译
  static List<String> get _tabs => [
    '我创建的歌单'.tr,
    '我收藏的歌单'.tr,
    '我收藏的专辑'.tr,
    '我关注的歌手'.tr,
    '我关注的好友'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 48,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedTab.value == index;
            return GestureDetector(
              onTap: () => controller.selectedTab.value = index,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? primary : (isDark ? Colors.white.withValues(alpha: 0.06) : const Color(0xFFF5F5F5)),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected
                      ? [BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 18, offset: const Offset(0, 8))]
                      : null,
                ),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : (isDark ? Colors.white.withValues(alpha: 0.62) : Colors.black54),
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}

/// 内容网格（按 Tab 切换）
class _ContentGrid extends StatelessWidget {
  final MyPlaylistController controller;
  const _ContentGrid({required this.controller});

  void _openPlaylistDetail(BuildContext context, PlaylistItemStruct item) {
    Get.toNamed(
      '/playlist/detail',
      arguments: {'id': item.global_collection_id, 'name': item.name, 'pic': item.pic},
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = Theme.of(context).colorScheme.primary;

    return Obx(() {
      final tab = controller.selectedTab.value;
      final loading = controller.isLoading.value;

      // 我创建的歌单：云盘 / 本地音乐 / 歌单列表 / 创建歌单 卡片
      if (tab == 0) {
        final playlists = controller.userPlaylists;
        final childCount = playlists.length + 3;
        return SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 190,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              childAspectRatio: 0.72,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return _FeatureCard(
                    isDark: isDark,
                    primary: primary,
                    icon: Icons.cloud_outlined,
                    title: '我的云盘'.tr,
                    subtitle: '(*/ω＼*)',
                    onTap: () => Get.snackbar('提示'.tr, '云盘功能开发中'.tr),
                  );
                }
                if (index == 1) {
                  return _FeatureCard(
                    isDark: isDark,
                    primary: primary,
                    icon: Icons.library_music_outlined,
                    title: '本地音乐'.tr,
                    subtitle: "(〃'▽'〃)",
                    onTap: () => Get.snackbar('提示'.tr, '本地音乐功能开发中'.tr),
                  );
                }
                final itemIndex = index - 2;
                if (itemIndex < playlists.length) {
                  return _PlaylistCard(
                    item: playlists[itemIndex],
                    isDark: isDark,
                    primary: primary,
                    onTap: () => _openPlaylistDetail(context, playlists[itemIndex]),
                  );
                }
                // 创建歌单卡片
                return _FeatureCard(
                  isDark: isDark,
                  primary: primary,
                  icon: Icons.add,
                  title: '创建歌单'.tr,
                  subtitle: '(≧∀≦)♪',
                  onTap: controller.showCreatePlaylistDialog,
                );
              },
              childCount: childCount,
            ),
          ),
        );
      }

      // 其余 Tab
      final playlists = tab == 1 ? controller.collectedPlaylists : null;
      final albums = tab == 2 ? controller.collectedAlbums : null;
      final artists = tab == 3 ? controller.followedArtists : null;
      final friends = tab == 4 ? controller.collectedFriends : null;

      if (loading && (playlists?.isEmpty ?? true) && (albums?.isEmpty ?? true) && (artists?.isEmpty ?? true) && (friends?.isEmpty ?? true)) {
        return const SliverToBoxAdapter(
          child: SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
        );
      }

      if (playlists != null) {
        if (playlists.isEmpty) return const SliverToBoxAdapter(child: _EmptyPlaceholder());
        return _playlistSliver(playlists, isDark, primary, context);
      }
      if (albums != null) {
        if (albums.isEmpty) return const SliverToBoxAdapter(child: _EmptyPlaceholder());
        return _playlistSliver(albums, isDark, primary, context);
      }

      // 歌手/好友网格
      final users = artists ?? friends ?? [];
      if (users.isEmpty) return const SliverToBoxAdapter(child: _EmptyPlaceholder());
      return SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 190,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            childAspectRatio: 0.78,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final user = users[index];
              return _UserCard(user: user, isDark: isDark);
            },
            childCount: users.length,
          ),
        ),
      );
    });
  }

  Widget _playlistSliver(
    List<PlaylistItemStruct> items,
    bool isDark,
    Color primary,
    BuildContext context,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: 0.72,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _PlaylistCard(
            item: items[index],
            isDark: isDark,
            primary: primary,
            onTap: () => _openPlaylistDetail(context, items[index]),
          ),
          childCount: items.length,
        ),
      ),
    );
  }
}

/// 歌单卡片
class _PlaylistCard extends StatelessWidget {
  final PlaylistItemStruct item;
  final bool isDark;
  final Color primary;
  final VoidCallback onTap;
  const _PlaylistCard({
    required this.item,
    required this.isDark,
    required this.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: double.infinity,
                  child: item.pic.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: item.pic,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => _coverFallback(),
                        )
                      : _coverFallback(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white.withValues(alpha: 0.88) : const Color(0xFF2B2B2B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${item.count} 首歌'.tr,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.white.withValues(alpha: 0.5) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _coverFallback() => Container(
        color: Colors.grey[200],
        child: Icon(Icons.music_note, color: Colors.grey[400]),
      );
}

/// 功能卡片（云盘/本地音乐/创建歌单）
class _FeatureCard extends StatelessWidget {
  final bool isDark;
  final Color primary;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _FeatureCard({
    required this.isDark,
    required this.primary,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  color: primary.withValues(alpha: 0.08),
                  child: Center(
                    child: Icon(icon, size: 40, color: primary),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.white.withValues(alpha: 0.5) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 歌手/好友卡片（歌手可点击进入歌手详情页）
class _UserCard extends StatelessWidget {
  final FollowUser user;
  final bool isDark;
  const _UserCard({required this.user, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final canOpenArtist = user.singerid > 0;
    return GestureDetector(
      onTap: canOpenArtist
          ? () => Get.toNamed(
                '/artist/detail',
                arguments: {'singerid': user.singerid, 'unfollow': true},
              )
          : null,
      child: MouseRegion(
        cursor: canOpenArtist ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: double.infinity,
              child: user.pic.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: user.pic,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => _fallback(),
                    )
                  : _fallback(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.nickname,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white.withValues(alpha: 0.88) : const Color(0xFF2B2B2B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
        ),
      ),
    );
  }

  Widget _fallback() => Container(
        color: Colors.grey[200],
        child: Icon(Icons.person, color: Colors.grey[400]),
      );
}

/// 空状态
class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 80, color: Colors.grey.withValues(alpha: 0.3)),
          const SizedBox(height: 16),
          Text(
            '这里什么都还没有'.tr,
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

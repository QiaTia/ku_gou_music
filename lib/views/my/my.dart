import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/models/user/user_info.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';
import 'package:layout/layout.dart';
import 'playlist.controller.dart';

const _pinkColor = Color(0xFFFF5E8A);
const _pinkBgColor = Color(0xFFFFEEF3);

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyPlaylistController());
    final routerController = Get.find<LocalRouterController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final nickname = controller.userInfo.value?.nickname ?? userInstance.nickname ?? '';
        return CustomScrollView(
          slivers: [
            _ProfileHeader(
              userInfo: controller.userInfo.value,
              nickname: nickname,
              onBack: () => routerController.goBack(),
            ),
            SliverToBoxAdapter(child: _LikedSongsSection(controller: controller)),
            SliverToBoxAdapter(child: _TabBarSection(controller: controller)),
            _PlaylistGridSection(controller: controller),
            SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        );
      }),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final UserInfo? userInfo;
  final String nickname;
  final VoidCallback onBack;
  const _ProfileHeader({required this.userInfo, required this.nickname, required this.onBack});

  String _formatDuration(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    return '$h小时 $m分钟';
  }

  String _musicAge() {
    final now = DateTime.now();
    final years = now.year - 2012;
    return '$years 年';
  }

  @override
  Widget build(BuildContext context) {
    final pic = userInfo?.pic ?? '';
    final follows = userInfo?.follows ?? 0;
    final fans = userInfo?.fans ?? 0;
    final friends = userInfo?.friendTotal ?? 0;
    final visitors = userInfo?.visitors ?? 0;
    final gender = userInfo?.gender ?? 0;
    final vipType = userInfo?.vipType ?? 0;
    final duration = userInfo?.duration ?? 0
    ;
    return SliverAppBar(
      pinned: true,
      expandedHeight: 240,
      // backgroundColor: Color(0xFF5C4033),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        onPressed: onBack,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF5C4033), Color(0xFF8B6E5A), Color(0xFFA08070)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white24,
                    backgroundImage: pic.isNotEmpty ? CachedNetworkImageProvider(pic) : null,
                    child: pic.isEmpty ? const Icon(Icons.person, size: 36, color: Colors.white70) : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                nickname,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text('Lv.9', style: TextStyle(fontSize: 11, color: Colors.white)),
                            ),
                            if (vipType > 0) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF5E8A),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text('VIP', style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _StatItem(label: '关注', value: '$follows'),
                            _StatItem(label: '粉丝', value: '$fans'),
                            _StatItem(label: '好友', value: '$friends'),
                            _StatItem(label: '访问', value: '$visitors'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  if (gender > 0)
                    _InfoTag(icon: gender == 2 ? Icons.male : Icons.female, text: gender == 2 ? '男' : '女'),
                  if (duration > 0)
                    _InfoTag(text: '${_formatDuration(duration)} 听歌时长'),
                  _InfoTag(text: '乐龄 ${_musicAge()}'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _ActionChip(label: '签到', onTap: () {}),
                  const SizedBox(width: 8),
                  _ActionChip(label: 'VIP', onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            TextSpan(text: value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
            TextSpan(text: ' $label', style: const TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}

class _InfoTag extends StatelessWidget {
  final IconData? icon;
  final String text;
  const _InfoTag({this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: Colors.white70),
            const SizedBox(width: 4),
          ],
          Text(text, style: const TextStyle(fontSize: 11, color: Colors.white70)),
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
          border: Border.all(color: Colors.white54),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(label, style: const TextStyle(fontSize: 13, color: Colors.white)),
      ),
    );
  }
}

class _LikedSongsSection extends StatelessWidget {
  final MyPlaylistController controller;
  const _LikedSongsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.likedSongs.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '我喜欢听',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _pinkColor),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: controller.likedSongs.take(12).map((song) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 56) / 3,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CachedNetworkImage(
                          imageUrl: song['pic'] ?? '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[200],
                            child: const Icon(Icons.music_note, size: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song['name'] ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            song['author'] ?? '',
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
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _TabBarSection extends StatelessWidget {
  final MyPlaylistController controller;
  const _TabBarSection({required this.controller});

  static const _tabs = ['我创建的歌单', '我收藏的歌单', '我收藏的专辑', '我关注的歌手', '我关注的好友'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedTab.value == index;
            return GestureDetector(
              onTap: () => controller.selectedTab.value = index,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? _pinkColor : _pinkBgColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                )),
              ),
            );
          });
        },
      ),
    );
  }
}

class _PlaylistGridSection extends StatelessWidget {
  final MyPlaylistController controller;
  const _PlaylistGridSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final routerController = Get.find<LocalRouterController>();
    final int songCrossAxisCount = context.layout.value(
      xs: 3,
      sm: 4,
      md: 5,
    );
    return Obx(() {
      if (controller.selectedTab.value != 0) {
        return const SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: Center(child: Text('暂无数据', style: TextStyle(color: Colors.grey))),
          ),
        );
      }
      if (controller.playlist.isEmpty) {
        return const SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          ),
        );
      }
      return SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: songCrossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = controller.playlist[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/playlist/detail', arguments: {
                    'id': item.global_collection_id,
                    'name': item.name,
                    'pic': item.pic,
                  });
                  // routerController.navigateTo('/playlist/detail', {
                  //   'id': item.global_collection_id,
                  //   'name': item.name,
                  //   'pic': item.pic,
                  // });
                },
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: double.infinity,
                          child: item.pic.isNotEmpty
                              ? Hero(tag: item.global_collection_id, child: CachedNetworkImage(
                                  imageUrl: item.pic,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => Container(
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.music_note, color: Colors.grey),
                                  ),
                                ))
                              : Container(
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.music_note, color: Colors.grey),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, color: _pinkColor, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${item.count} 首歌',
                      style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                    ),
                  ],
                ),
              );
            },
            childCount: controller.playlist.length,
          ),
        ),
      );
    });
  }
}

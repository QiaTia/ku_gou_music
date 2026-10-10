import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/services/play_history_service.dart';
import 'package:ku_gou_music/views/home/pc/layout/title_bar.dart';
import 'package:ku_gou_music/views/home/pc/ranking/ranking_layout.dart';
import 'package:ku_gou_music/views/home/pc/recently/recently.controller.dart';

/// 最近播放页面

/// 最近播放页面
class RecentlyPage extends StatefulWidget {
  const RecentlyPage({super.key});

  @override
  State<RecentlyPage> createState() => _RecentlyPageState();
}

class _RecentlyPageState extends State<RecentlyPage>
    with SingleTickerProviderStateMixin {
  late final RecentlyController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(RecentlyController());
  }

  @override
  void dispose() {
    Get.delete<RecentlyController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: '最近播放'.tr,
        actions: _buildActions(),
      ),
      body: Column(
        children: [
          // Tab栏
          _buildTabBar(),
          // 内容区域
          Expanded(
            child: Obx(() {
              switch (_controller.currentTab.value) {
                case 0:
                  return _buildSongList();
                case 1:
                  return _buildPlaylistList();
                case 2:
                  return _buildAlbumList();
                default:
                  return const SizedBox.shrink();
              }
            }),
          ),
          // 底部编辑栏
          _buildBottomEditBar(),
        ],
      ),
    );
  }

  /// 构建TitleBar右侧操作按钮
  List<Widget> _buildActions() {
    return [
      Obx(() {
        if (_controller.isEditing.value) {
          return Row(
            children: [
              TextButton(
                onPressed: () {
                  if (_controller.isAllSelected) {
                    _controller.deselectAll();
                  } else {
                    _controller.selectAll();
                  }
                },
                child: Obx(() => Text(
                  _controller.isAllSelected ? '取消全选'.tr : '全选'.tr,
                )),
              ),
              TextButton(
                onPressed: _controller.exitEditMode,
                child:  Text('完成'.tr),
              ),
            ],
          );
        }
        return IconButton(
          onPressed: _controller.enterEditMode,
          icon: const Icon(Icons.edit_outlined),
          tooltip: '编辑'.tr,
        );
      }),
    ];
  }

  /// 构建Tab栏
  Widget _buildTabBar() {
    final tabs = _controller.tabTitles;
    final isCompact = DiscoverLayout.isCompact(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 12 : 20,
        vertical: 8,
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          return Obx(() {
            final isSelected = _controller.currentTab.value == index;
            return GestureDetector(
              onTap: () => _controller.switchTab(index),
              child: Container(
                margin: EdgeInsets.only(right: isCompact ? 8 : 16),
                padding: EdgeInsets.symmetric(
                  horizontal: isCompact ? 12 : 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                  ),
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  /// 列表底部内边距：移动端需要避开悬浮 TabBar（extendBody: true）
  EdgeInsets _listPadding() {
    return EdgeInsets.fromLTRB(20, 8, 20, DiscoverLayout.bottomInset(context));
  }

  /// 构建歌曲列表
  Widget _buildSongList() {
    return Obx(() {
      final songs = _controller.songHistory;
      if (songs.isEmpty) {
        return _buildEmptyState('暂无最近播放的歌曲'.tr);
      }
      return ListView.builder(
        padding: _listPadding(),
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return _SongListItem(
            song: song,
            isEditing: _controller.isEditing,
            isSelected: _controller.selectedIds.contains(song.id),
            onTap: () => _controller.playSong(song),
            onToggleSelect: () => _controller.toggleSelect(song.id),
          );
        },
      );
    });
  }

  /// 构建歌单列表
  Widget _buildPlaylistList() {
    return Obx(() {
      final playlists = _controller.playlistHistory;
      if (playlists.isEmpty) {
        return _buildEmptyState('暂无最近播放的歌单'.tr);
      }
      return ListView.builder(
        padding: _listPadding(),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final playlist = playlists[index];
          return _PlaylistListItem(
            playlist: playlist,
            isEditing: _controller.isEditing,
            isSelected: _controller.selectedIds.contains(playlist.id),
            onTap: () => _controller.playPlaylist(playlist),
            onToggleSelect: () => _controller.toggleSelect(playlist.id),
          );
        },
      );
    });
  }

  /// 构建专辑列表
  Widget _buildAlbumList() {
    return Obx(() {
      final albums = _controller.albumHistory;
      if (albums.isEmpty) {
        return _buildEmptyState('暂无最近播放的专辑'.tr);
      }
      return ListView.builder(
        padding: _listPadding(),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return _AlbumListItem(
            album: album,
            isEditing: _controller.isEditing,
            isSelected: _controller.selectedIds.contains(album.id),
            onTap: () => _controller.playAlbum(album),
            onToggleSelect: () => _controller.toggleSelect(album.id),
          );
        },
      );
    });
  }

  /// 构建空状态
  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.music_note_outlined,
            size: 64,
            color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建底部编辑栏
  Widget _buildBottomEditBar() {
    return Obx(() {
      if (!_controller.isEditing.value) return const SizedBox.shrink();
      // 移动端外壳是 extendBody: true，底部编辑栏会被悬浮 TabBar 遮挡，
      // 这里补上避开悬浮 TabBar 的下内边距。
      final bottomAvoid = DiscoverLayout.isCompact(context)
          ? DiscoverLayout.mobileTabBarHeight
          : 0.0;
      return Container(
        padding: EdgeInsets.fromLTRB(20, 12, 20, 12 + bottomAvoid),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
            ),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              // 删除按钮
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showDeleteConfirmDialog();
                  },
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label:  Text('删除'.tr),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.withValues(alpha: 0.1),
                    foregroundColor: Colors.red,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // 加入下一首播放按钮（仅在歌曲Tab显示）
              if (_controller.currentTab.value == 0)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _controller.addSelectedToNextPlay();
                    },
                    icon: const Icon(Icons.queue_music, size: 18),
                    label:  Text('下一首播放'.tr),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  /// 显示删除确认对话框
  void _showDeleteConfirmDialog() {
    final count = _controller.selectedIds.length;
    if (count == 0) {
      Get.snackbar('提示'.tr, '请先选择要删除的项目'.tr);
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text('确认删除'.tr),
        content: Text('确定要删除选中的 $count 个项目吗？'.tr),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:  Text('取消'.tr),
          ),
          TextButton(
            onPressed: () {
              _controller.deleteSelected();
              Navigator.of(context).pop();
            },
            child:  Text('删除'.tr, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// ==================== 列表项组件 ====================

/// 歌曲列表项
class _SongListItem extends StatelessWidget {
  final SongPlayHistory song;
  final RxBool isEditing;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onToggleSelect;

  const _SongListItem({
    required this.song,
    required this.isEditing,
    required this.isSelected,
    required this.onTap,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEditing.value ? onToggleSelect : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            // 选择框（编辑模式显示）
            Obx(() {
              if (!isEditing.value) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Checkbox(
                  value: isSelected,
                  onChanged: (_) => onToggleSelect(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              );
            }),
            // 封面图
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: song.cover.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: song.cover,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[300],
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[300],
                        child: const Icon(Icons.music_note, color: Colors.grey),
                      ),
                    )
                  : Container(
                      width: 48,
                      height: 48,
                      color: Colors.grey[300],
                      child: const Icon(Icons.music_note, color: Colors.grey),
                    ),
            ),
            const SizedBox(width: 12),
            // 歌曲信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.author,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // 播放时间
            Text(
              _formatTime(song.playTime),
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int timestamp) {
    if (timestamp == 0) return '';
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return '刚刚'.tr;
    if (diff.inHours < 1) return '${diff.inMinutes}分钟前'.tr;
    if (diff.inDays < 1) return '${diff.inHours}小时前'.tr;
    if (diff.inDays < 7) return '${diff.inDays}天前'.tr;
    if (date.year == now.year) {
      return '${_twoDigits(date.month)}-${_twoDigits(date.day)}';
    }
    return '${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}';
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}

/// 歌单列表项
class _PlaylistListItem extends StatelessWidget {
  final PlaylistPlayHistory playlist;
  final RxBool isEditing;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onToggleSelect;

  const _PlaylistListItem({
    required this.playlist,
    required this.isEditing,
    required this.isSelected,
    required this.onTap,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEditing.value ? onToggleSelect : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            // 选择框
            Obx(() {
              if (!isEditing.value) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Checkbox(
                  value: isSelected,
                  onChanged: (_) => onToggleSelect(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              );
            }),
            // 封面图
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: playlist.cover.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: playlist.cover,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[300],
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[300],
                        child: const Icon(Icons.playlist_play, color: Colors.grey),
                      ),
                    )
                  : Container(
                      width: 48,
                      height: 48,
                      color: Colors.grey[300],
                      child: const Icon(Icons.playlist_play, color: Colors.grey),
                    ),
            ),
            const SizedBox(width: 12),
            // 歌单信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    playlist.nickname != null ? 'by ${playlist.nickname}' : '歌单'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // 歌曲数量
            if (playlist.songCount != null)
              Text(
                '${playlist.songCount}首'.tr,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 专辑列表项
class _AlbumListItem extends StatelessWidget {
  final AlbumPlayHistory album;
  final RxBool isEditing;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onToggleSelect;

  const _AlbumListItem({
    required this.album,
    required this.isEditing,
    required this.isSelected,
    required this.onTap,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEditing.value ? onToggleSelect : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            // 选择框
            Obx(() {
              if (!isEditing.value) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Checkbox(
                  value: isSelected,
                  onChanged: (_) => onToggleSelect(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              );
            }),
            // 封面图
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: album.cover.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: album.cover,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[300],
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey[300],
                        child: const Icon(Icons.album, color: Colors.grey),
                      ),
                    )
                  : Container(
                      width: 48,
                      height: 48,
                      color: Colors.grey[300],
                      child: const Icon(Icons.album, color: Colors.grey),
                    ),
            ),
            const SizedBox(width: 12),
            // 专辑信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    album.singerName ?? '未知歌手'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // 歌曲数量
            if (album.songCount != null)
              Text(
                '${album.songCount}首'.tr,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

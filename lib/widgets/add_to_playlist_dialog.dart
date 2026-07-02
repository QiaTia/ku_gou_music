import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/playlist/track.dart';
import 'package:ku_gou_music/api/top/top.dart';
import 'package:ku_gou_music/api/user/user.dart';
import 'package:ku_gou_music/utils/utils.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart'
    show SongItemStruct;

/// 歌单选择弹窗 - 用于将歌曲添加到用户歌单
///
/// 使用方式：
/// ```dart
/// showAddToPlaylistDialog(context, song);
/// ```
void showAddToPlaylistDialog(
  BuildContext context,
  dynamic song, {
  VoidCallback? onSuccess,
}) {
  Get.dialog(
    AddToPlaylistDialog(song: song, onSuccess: onSuccess),
    barrierDismissible: true,
  );
}

/// 歌单选择弹窗组件
class AddToPlaylistDialog extends StatefulWidget {
  /// 要添加的歌曲信息，支持 SearchSongInfo 或 SongItemStruct
  final dynamic song;

  /// 添加成功后的回调
  final VoidCallback? onSuccess;

  const AddToPlaylistDialog({
    super.key,
    required this.song,
    this.onSuccess,
  });

  @override
  State<AddToPlaylistDialog> createState() => _AddToPlaylistDialogState();
}

class _AddToPlaylistDialogState extends State<AddToPlaylistDialog> {
  /// 用户歌单列表
  List<PlaylistModel> _playlists = [];

  /// 加载状态
  bool _isLoading = true;

  /// 错误信息
  String? _error;

  /// 正在添加的歌单ID
  int? _addingToListId;

  @override
  void initState() {
    super.initState();
    _loadUserPlaylists();
  }

  /// 加载用户歌单列表
  Future<void> _loadUserPlaylists() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await getUserPlaylist(page: 1, pagesize: 100);
      final body = response.body;

      if (body == null || body['status'] != 1) {
        throw Exception(body?['msg'] ?? '获取歌单失败');
      }

      final listData = body['data']?['list'];
      if (listData is List) {
        setState(() {
          _playlists = listData
              .whereType<Map<String, dynamic>>()
              .map((item) => PlaylistModel.fromJson(item))
              .toList();
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// 将歌曲添加到指定歌单
  Future<void> _addToPlaylist(PlaylistModel playlist) async {
    setState(() {
      _addingToListId = playlist.specialid;
    });

    try {
      final songData = _buildSongData();
      final response = await addToPlaylist(
        songsData: [songData],
        listId: playlist.specialid!,
      );

      if (response.body?['status'] == 1) {
        Get.back();
        widget.onSuccess?.call();
        Get.snackbar(
          '添加成功',
          '已添加到「${playlist.specialname}」',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
        );
      } else {
        throw Exception(response.body?['msg'] ?? '添加失败');
      }
    } catch (e) {
      Get.snackbar(
        '添加失败',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[50],
        colorText: Colors.red,
        duration: const Duration(seconds: 2),
      );
    } finally {
      setState(() {
        _addingToListId = null;
      });
    }
  }

  /// 构建歌曲数据字符串
  /// 格式: "name|hash|albumId|mixSongId"
  String _buildSongData() {
    final song = widget.song;

    // 优先使用 hash 和 name 字段
    String hash = '';
    String name = '';
    int albumId = 0;
    int mixSongId = 0;

    if (song is SongItemStruct) {
      hash = song.hash;
      name = song.name;
      mixSongId = song.audio_id;
    } else {
      // 使用反射获取常见字段
      try {
        hash = (song as dynamic).fileHash ?? '';
      } catch (_) {}
      if (hash.isEmpty) {
        try {
          hash = (song as dynamic).hash ?? '';
        } catch (_) {}
      }
      try {
        name = (song as dynamic).songName ?? '';
      } catch (_) {}
      if (name.isEmpty) {
        try {
          name = (song as dynamic).name ?? '';
        } catch (_) {}
      }
      try {
        albumId = (song as dynamic).albumId ?? 0;
      } catch (_) {}
      try {
        mixSongId = (song as dynamic).id ?? 0;
      } catch (_) {}
    }

    return '$name|$hash|$albumId|$mixSongId';
  }

  /// 获取歌曲名称
  String get _songName {
    final song = widget.song;
    try {
      return (song as dynamic).songName ??
          (song as dynamic).name ??
          '未知歌曲';
    } catch (_) {
      return '未知歌曲';
    }
  }

  /// 获取歌曲歌手
  String get _songArtist {
    final song = widget.song;
    try {
      return (song as dynamic).singerName ??
          (song as dynamic).author ??
          (song as dynamic).artistName ??
          '';
    } catch (_) {
      return '';
    }
  }

  /// 获取歌曲封面
  String get _songCover {
    final song = widget.song;
    try {
      final cover = (song as dynamic).image ??
          (song as dynamic).cover ??
          '';
      return cover is String ? getImageUri(cover) : '';
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 400,
        constraints: const BoxConstraints(maxHeight: 520),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 头部 - 歌曲信息
            _buildHeader(),

            const Divider(height: 1),

            // 歌单列表
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _error != null
                      ? _buildErrorWidget()
                      : _playlists.isEmpty
                          ? _buildEmptyWidget()
                          : _buildPlaylistList(),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建头部 - 显示当前要添加的歌曲信息
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // 歌曲封面
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: _songCover.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: _songCover,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
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
                  '添加到歌单',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _songName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (_songArtist.isNotEmpty)
                  Text(
                    _songArtist,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          // 关闭按钮
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }

  /// 构建错误界面
  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            '获取歌单失败',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _loadUserPlaylists,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  /// 构建空状态界面
  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.queue_music, size: 48, color: Colors.grey[400]),
          const SizedBox(height: 12),
          Text(
            '暂无歌单',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  /// 构建歌单列表
  Widget _buildPlaylistList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _playlists.length,
      itemBuilder: (context, index) {
        final playlist = _playlists[index];
        final isAdding = _addingToListId == playlist.specialid;

        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: playlist.imgurl != null && playlist.imgurl!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: playlist.imgurl!,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
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
          title: Text(
            playlist.specialname ?? '未命名歌单',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            '${playlist.collectcount ?? 0}首',
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
          trailing: isAdding
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.add, color: Colors.grey),
          onTap: isAdding ? null : () => _addToPlaylist(playlist),
        );
      },
    );
  }
}

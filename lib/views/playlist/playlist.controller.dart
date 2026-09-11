import 'package:get/get.dart';
import 'package:ku_gou_music/api/playlist/playlist.dart';
import 'package:ku_gou_music/api/top/top.dart';
import 'package:ku_gou_music/utils/utils.dart';

class SongItemStruct {
  /// 歌曲hash
  String hash;
  /// 歌曲名
  String name;
  /// 歌曲id
  int audio_id;
  /// 歌曲封面
  String cover;
  /// 歌曲mvhash
  String mvhash;
  /// 歌曲时间
  int timelen;
  /// 原始名称
  String origin_name;
  /// 歌词作者
  String author;
  int privilege;
  /// SQ码率
  bool is_sq;
  /// HQ码率
  bool is_hq;

  SongItemStruct({ required this.hash, required this.audio_id, required this.timelen, required this.mvhash, required this.origin_name, required this.privilege, required this.author, required this.is_hq, required this.name, required this.is_sq, required this.cover });

  factory SongItemStruct.fromJson(Map<String, dynamic> json) {
    String origin_name = json['name'] ?? '';
    var names = origin_name.split('-');
    List<dynamic> goods = json['relate_goods'] ?? [];
    return SongItemStruct(
      hash: json['hash'],
      audio_id: json['audio_id'],
      timelen: json['timelen'] ?? 0,
      mvhash: json['mvhash'],
      origin_name: origin_name,
      privilege: json['privilege'] ?? 0,
      name: names.last.trim(),
      author: names.first.trim(),
      is_sq: goods.length > 2,
      is_hq: goods.length > 1,
      cover: json['cover'] is String ? getImageUri(json['cover'] as String) : '',
    );
  }

}

class PlaylistController extends GetxController {

  List<SongItemStruct> playlist = <SongItemStruct>[].obs;

  Rx<PlaylistModel> playListInfo = PlaylistModel().obs;

  /// 是否加载失败（歌单ID格式不被接口接受、无权限、网络异常等）
  final RxBool isFailed = false.obs;

  /// 获取歌单歌曲列表
  ///
  /// [id] 必须是接口要求的全局收藏ID（gid，形如 `collection_3_xxx_xxx_0`）；
  /// 传数字 specialid 时接口会返回 error_code=20010 且不含任何歌曲。
  Future<dynamic> getPlaylist(String id) {
    isFailed.value = false;
    return getPlaylistTrackAll(id, 1, 99)
      .then((res) {
        final body = res.body;
        final errorCode = body?['error_code'];
        final data = body?['data'];
        if (data is! Map) {
          _markFailed(id, errorCode);
          return;
        }
        final list = data['songs'];
        if (list is List) {
          playlist.clear();
          for (var tracks in list) {
            if (tracks is Map && tracks.containsKey('hash')) {
              playlist.add(SongItemStruct.fromJson(tracks as Map<String, dynamic>));
            }
          }
        }
        // 无论接口报错（如 20010：global_collection_id 不合法）还是歌单本身为空，
        // 都标记失败，避免详情页无限 loading
        if (playlist.isEmpty) {
          _markFailed(id, errorCode);
          return;
        }
        var info = data['list_info'];
        try {
          if (info is Map<String, dynamic>) playListInfo.value = PlaylistModel.fromJson(info);
        }catch (e) {
          print(e);
        }
      })
      .catchError((e) {
        print('⚠️ 歌单详情请求失败: $e');
        isFailed.value = true;
      });
  }

  /// 标记加载失败，避免详情页无限 loading
  void _markFailed(String id, Object? errorCode) {
    print('⚠️ 歌单详情为空: id=$id, error_code=$errorCode');
    playlist.clear();
    isFailed.value = true;
  }

  /// 充值内容
  void reset() {
    playlist.clear();
    playListInfo.value = PlaylistModel();
  }
}


// models/search/search_mv_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'package:ku_gou_music/models/search/search_song_info.dart';
import 'package:ku_gou_music/utils/utils.dart';

part 'search_mv_info.freezed.dart';
part 'search_mv_info.g.dart';

/// 搜索结果 - MV信息（对应 /v1/search/mv）
///
/// 真实返回字段为 MvID/MvName/Pic 等混合大小写，
/// Pic 为文件名，需拼接 `https://imge.kugou.com/mvpic/{size}/` 前缀。
@freezed
abstract class SearchMvInfo with _$SearchMvInfo {
  const SearchMvInfo._();

  const factory SearchMvInfo({
    /// MV ID
    @IntFromStringConverter() @JsonKey(name: 'MvID') @Default(0) int mvId,
    /// MV名称
    @JsonKey(name: 'MvName') @Default('') String mvName,
    /// 文件名（如 "<em>周杰伦</em> - 晴天"）
    @JsonKey(name: 'FileName') @Default('') String fileName,
    /// 歌手名（可能含 <em> 高亮标记）
    @JsonKey(name: 'SingerName') @Default('') String singerName,
    /// MV Hash
    @JsonKey(name: 'MvHash') @Default('') String mvHash,
    /// 关联音频ID
    @JsonKey(name: 'AudioID') @Default('') String audioId,
    /// 加密MV ID
    @JsonKey(name: 'EMvID') @Default('') String eMvId,
    /// 封面图文件名（拼接 mvpic 前缀使用）
    @JsonKey(name: 'Pic') @Default('') String pic,
    /// 竖版封面图文件名
    @JsonKey(name: 'ErectPic') @Default('') String erectPic,
    /// 动态封面GIF（完整URL）
    @JsonKey(name: 'ThumbGif') @Default('') String thumbGif,
    /// 动态封面MP4（完整URL）
    @JsonKey(name: 'ThumbMp4') @Default('') String thumbMp4,
    /// MV时长(秒)
    @IntFromStringConverter() @JsonKey(name: 'Duration') @Default(0) int duration,
    /// 发布日期
    @JsonKey(name: 'PublishDate') @Default('') String publishDate,
    /// MV热度
    @IntFromStringConverter() @JsonKey(name: 'MvHot') @Default(0) int mvHot,
    /// 历史热度
    @IntFromStringConverter() @JsonKey(name: 'HistoryHeat') @Default(0) int historyHeat,
    /// 是否官方MV
    @IntFromStringConverter() @JsonKey(name: 'IsOfficial') @Default(0) int isOfficial,
    /// 是否UGC
    @IntFromStringConverter() @JsonKey(name: 'IsUgc') @Default(0) int isUgc,
    /// 是否短视频
    @IntFromStringConverter() @JsonKey(name: 'Isshort') @Default(0) int isShort,
    /// 画质标识（如 1080P）
    @JsonKey(name: 'MvHashMark') @Default('') String mvHashMark,
    /// 权限
    @IntFromStringConverter() @JsonKey(name: 'Privilege') @Default(0) int privilege,
    /// 关联歌曲hash
    @JsonKey(name: 'FileHash') @Default('') String fileHash,
    /// 关联MixSongID
    @JsonKey(name: 'MixSongID') @Default('') String mixSongId,
    /// 关联专辑ID
    @JsonKey(name: 'AlbumID') @Default('') String albumId,
    /// 歌手ID列表
    @Default([]) @JsonKey(name: 'SingerID') List<int> singerId,
    /// 歌手信息列表
    @Default([]) @JsonKey(name: 'Singers') List<SearchSinger> singers,
  }) = _SearchMvInfo;

  factory SearchMvInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchMvInfoFromJson(json);

  /// MV封面URL（含 {size} 占位符，可用 getImageUri 替换；无 Pic 时回退 ThumbGif）
  String get coverUrl => pic.isEmpty
      ? thumbGif
      : 'https://imge.kugou.com/mvpic/{size}/$pic';

  /// 时长格式化 mm:ss
  String get durationLabel => formatDuration(duration);

  /// 显示用MV名（去除高亮标记）
  String get displayMvName => stripHtmlTags(mvName);

  /// 显示用歌手名（去除高亮标记）
  String get displaySingerName => stripHtmlTags(singerName);
}

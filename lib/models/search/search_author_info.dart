// models/search/search_author_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'package:ku_gou_music/utils/utils.dart';

part 'search_author_info.freezed.dart';
part 'search_author_info.g.dart';

/// 搜索结果 - 歌手/作者信息（对应 /v1/search/author 或综合搜索返回的 author 类型）
@freezed
abstract class SearchAuthorInfo with _$SearchAuthorInfo {
  const SearchAuthorInfo._();

  const factory SearchAuthorInfo({
    /// 作者ID
    @IntFromStringConverter() @JsonKey(name: 'AuthorId') @Default(0) int authorId,
    /// 作者名（可能含 <em> 高亮标记）
    @JsonKey(name: 'AuthorName') @Default('') String authorName,
    /// 作者头像
    @JsonKey(name: 'Avatar') @Default('') String avatar,
    /// 首帧头像（含 {size} 占位符）
    @JsonKey(name: 'FirstFrameImage') @Default('') String firstFrameImage,
    /// 粉丝数量
    @IntFromStringConverter() @JsonKey(name: 'FansNum') @Default(0) int fansNum,
    /// 音频数量
    @IntFromStringConverter() @JsonKey(name: 'AudioCount') @Default(0) int audioCount,
    /// 视频数量
    @IntFromStringConverter() @JsonKey(name: 'VideoCount') @Default(0) int videoCount,
    /// 专辑数量
    @IntFromStringConverter() @JsonKey(name: 'AlbumCount') @Default(0) int albumCount,
    ///作词数量
    @IntFromStringConverter() @JsonKey(name: 'LyricistCount') @Default(0) int lyricistCount,
    /// 作曲数量
    @IntFromStringConverter() @JsonKey(name: 'ComposerCount') @Default(0) int composerCount,
    /// 热度
    @IntFromStringConverter() @JsonKey(name: 'Heat') @Default(0) int heat,
    /// 身份标识
    @IntFromStringConverter() @JsonKey(name: 'Identity') @Default(0) int identity,
    /// 是否真实歌手
    @IntFromStringConverter() @JsonKey(name: 'IsReal') @Default(0) int isReal,
    /// 作者状态
    @IntFromStringConverter() @JsonKey(name: 'AuthorStatus') @Default(0) int authorStatus,
    /// 是否入驻作者
    @IntFromStringConverter() @JsonKey(name: 'IsSettledAuthor') @Default(0) int isSettledAuthor,
    /// 用户ID
    @IntFromStringConverter() @JsonKey(name: 'UserId') @Default(0) int userId,
    /// 复杂歌曲名
    @JsonKey(name: 'ComplexSongName') @Default('') String complexSongName,
    /// 算法路径
    @JsonKey(name: 'AlgPath') @Default('') String algPath,
    /// 辅助信息
    @JsonKey(name: 'Auxiliary') @Default('') String auxiliary,
  }) = _SearchAuthorInfo;

  factory SearchAuthorInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchAuthorInfoFromJson(json);

  /// 显示用作者名（去除高亮标记）
  String get displayAuthorName => stripHtmlTags(authorName);
}

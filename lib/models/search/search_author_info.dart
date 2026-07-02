// models/search/search_author_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_author_info.freezed.dart';
part 'search_author_info.g.dart';

/// 搜索结果 - 歌手/作者信息（对应综合搜索返回的 author 类型）
@freezed
abstract class SearchAuthorInfo with _$SearchAuthorInfo {
  const factory SearchAuthorInfo({
    /// 作者ID
    @IntFromStringConverter() @JsonKey(name: 'AuthorId') @Default(0) int authorId,
    /// 作者名
    @JsonKey(name: 'AuthorName') @Default('') String authorName,
    /// 作者头像
    @JsonKey(name: 'Avatar') @Default('') String avatar,
    /// 粉丝数量
    @IntFromStringConverter() @JsonKey(name: 'FansNum') @Default(0) int fansNum,
    /// 音频数量
    @IntFromStringConverter() @JsonKey(name: 'AudioCount') @Default(0) int audioCount,
    /// 视频数量
    @IntFromStringConverter() @JsonKey(name: 'VideoCount') @Default(0) int videoCount,
    /// 专辑数量
    @IntFromStringConverter() @JsonKey(name: 'AlbumCount') @Default(0) int albumCount,
    /// 热度
    @IntFromStringConverter() @JsonKey(name: 'Heat') @Default(0) int heat,
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
}

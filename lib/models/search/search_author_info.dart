// models/search/search_author_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_author_info.freezed.dart';
part 'search_author_info.g.dart';

/// 搜索结果 - 歌手信息（对应综合搜索返回的 author 类型）
@freezed
abstract class SearchAuthorInfo with _$SearchAuthorInfo {
  const factory SearchAuthorInfo({
    /// 歌手ID
    @IntFromStringConverter() @JsonKey(name: 'authorid') @Default(0) int authorId,
    /// 歌手名
    @JsonKey(name: 'author_name') @Default('') String authorName,
    /// 歌手头像
    @JsonKey(name: 'imgurl') @Default('') String imgUrl,
    /// 歌曲数量
    @IntFromStringConverter() @JsonKey(name: 'song_count') @Default(0) int songCount,
    /// 专辑数量
    @IntFromStringConverter() @JsonKey(name: 'album_count') @Default(0) int albumCount,
    /// MV数量
    @IntFromStringConverter() @JsonKey(name: 'mv_count') @Default(0) int mvCount,
    /// 粉丝数量
    @IntFromStringConverter() @JsonKey(name: 'fans_count') @Default(0) int fansCount,
    /// 是否认证
    @IntFromStringConverter() @JsonKey(name: 'is_publish') @Default(0) int isPublish,
  }) = _SearchAuthorInfo;

  factory SearchAuthorInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchAuthorInfoFromJson(json);
}

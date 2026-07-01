// models/search/search_song_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_song_info.dart';

part 'search_song_response.freezed.dart';
part 'search_song_response.g.dart';

/// 搜索单曲响应（对应 /v3/search/song 或 /v1/search/song{type}）
///
/// 实际返回结构：
/// {
///   "status": 1,
///   "error_code": 0,
///   "data": {
///     "lists": [...],
///     "total": 480,
///     ...
///   }
/// }
@freezed
abstract class SearchSongResponse with _$SearchSongResponse {
  const factory SearchSongResponse({
    /// 搜索结果列表
    @Default([]) @JsonKey(name: 'lists') List<SearchSongInfo> lists,
    /// 总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 当前页码
    @IntFromStringConverter() @JsonKey(name: 'page') @Default(1) int page,
    /// 每页数量
    @IntFromStringConverter() @JsonKey(name: 'pagesize') @Default(30) int pagesize,
  }) = _SearchSongResponse;

  factory SearchSongResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSongResponseFromJson(json);
}

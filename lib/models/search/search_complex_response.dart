// models/search/search_complex_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_song_info.dart';

part 'search_complex_response.freezed.dart';
part 'search_complex_response.g.dart';

/// 综合搜索响应（对应 /v6/search/complex）
///
/// 实际返回结构：
/// {
///   "status": 1,
///   "error_code": 0,
///   "data": {
///     "correctiontip": "",
///     "correctionforce": 0,
///     "lists": [
///       {
///         "type": "song",
///         "total": 480,
///         "lists": [...]
///       },
///       ...
///     ]
///   }
/// }
@freezed
abstract class SearchComplexResponse with _$SearchComplexResponse {
  const factory SearchComplexResponse({
    /// 所有搜索结果分组
    @Default([]) @JsonKey(name: 'lists') List<SearchComplexGroup> lists,
    /// 搜索提示
    @JsonKey(name: 'correctiontip') @Default('') String correctionTip,
  }) = _SearchComplexResponse;

  factory SearchComplexResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexResponseFromJson(json);
}

/// 搜索结果分组（按类型分组）
@freezed
abstract class SearchComplexGroup with _$SearchComplexGroup {
  const factory SearchComplexGroup({
    /// 类型：song/mv/collect/album/author/ksong/program/talent/othersearch
    @JsonKey(name: 'type') @Default('') String type,
    /// 该类型总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 搜索结果列表
    @Default([]) @JsonKey(name: 'lists') List<SearchSongInfo> lists,
    /// 是否允许错误
    @IntFromStringConverter() @JsonKey(name: 'allowerr') @Default(0) int allowErr,
    /// 是否共享结果
    @IntFromStringConverter() @JsonKey(name: 'isshareresult') @Default(0) int isShareResult,
    /// 索引
    @IntFromStringConverter() @JsonKey(name: 'index') @Default(0) int index,
  }) = _SearchComplexGroup;

  factory SearchComplexGroup.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexGroupFromJson(json);
}

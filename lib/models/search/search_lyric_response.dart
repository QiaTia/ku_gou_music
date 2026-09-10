// models/search/search_lyric_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_lyric_info.dart';

part 'search_lyric_response.freezed.dart';
part 'search_lyric_response.g.dart';

/// 搜索歌词响应（对应 /v1/search/lyric）
///
/// data 结构：{ "lists": [...], "total": 1000, "page": 1, "pagesize": 30, ... }
@freezed
abstract class SearchLyricResponse with _$SearchLyricResponse {
  const factory SearchLyricResponse({
    /// 搜索结果列表
    @Default([]) @JsonKey(name: 'lists') List<SearchLyricInfo> lists,
    /// 总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 当前页码
    @IntFromStringConverter() @JsonKey(name: 'page') @Default(1) int page,
    /// 每页数量
    @IntFromStringConverter() @JsonKey(name: 'pagesize') @Default(30) int pagesize,
  }) = _SearchLyricResponse;

  factory SearchLyricResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricResponseFromJson(json);
}

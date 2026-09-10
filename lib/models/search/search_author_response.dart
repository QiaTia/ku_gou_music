// models/search/search_author_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_author_info.dart';

part 'search_author_response.freezed.dart';
part 'search_author_response.g.dart';

/// 搜索歌手响应（对应 /v1/search/author）
///
/// data 结构：{ "lists": [...], "total": 28, "page": 1, "pagesize": 30, ... }
@freezed
abstract class SearchAuthorResponse with _$SearchAuthorResponse {
  const factory SearchAuthorResponse({
    /// 搜索结果列表
    @Default([]) @JsonKey(name: 'lists') List<SearchAuthorInfo> lists,
    /// 总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 当前页码
    @IntFromStringConverter() @JsonKey(name: 'page') @Default(1) int page,
    /// 每页数量
    @IntFromStringConverter() @JsonKey(name: 'pagesize') @Default(30) int pagesize,
  }) = _SearchAuthorResponse;

  factory SearchAuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAuthorResponseFromJson(json);
}

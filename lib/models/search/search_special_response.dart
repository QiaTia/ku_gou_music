// models/search/search_special_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_special_info.dart';

part 'search_special_response.freezed.dart';
part 'search_special_response.g.dart';

/// 搜索歌单响应（对应 /v1/search/special）
///
/// data 结构：{ "lists": [...], "total": 480, "page": 1, "pagesize": 30, ... }
@freezed
abstract class SearchSpecialResponse with _$SearchSpecialResponse {
  const factory SearchSpecialResponse({
    /// 搜索结果列表
    @Default([]) @JsonKey(name: 'lists') List<SearchSpecialInfo> lists,
    /// 总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 当前页码
    @IntFromStringConverter() @JsonKey(name: 'page') @Default(1) int page,
    /// 每页数量
    @IntFromStringConverter() @JsonKey(name: 'pagesize') @Default(30) int pagesize,
  }) = _SearchSpecialResponse;

  factory SearchSpecialResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSpecialResponseFromJson(json);
}

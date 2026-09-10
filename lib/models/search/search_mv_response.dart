// models/search/search_mv_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_mv_info.dart';

part 'search_mv_response.freezed.dart';
part 'search_mv_response.g.dart';

/// 搜索MV响应（对应 /v1/search/mv）
///
/// data 结构：{ "lists": [...], "total": 500, "page": 1, "pagesize": 30, ... }
@freezed
abstract class SearchMvResponse with _$SearchMvResponse {
  const factory SearchMvResponse({
    /// 搜索结果列表
    @Default([]) @JsonKey(name: 'lists') List<SearchMvInfo> lists,
    /// 总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 当前页码
    @IntFromStringConverter() @JsonKey(name: 'page') @Default(1) int page,
    /// 每页数量
    @IntFromStringConverter() @JsonKey(name: 'pagesize') @Default(30) int pagesize,
  }) = _SearchMvResponse;

  factory SearchMvResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMvResponseFromJson(json);
}

// models/search/search_album_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_album_info.dart';

part 'search_album_response.freezed.dart';
part 'search_album_response.g.dart';

/// 搜索专辑响应（对应 /v1/search/album）
///
/// data 结构：{ "lists": [...], "total": 500, "page": 1, "pagesize": 30, ... }
@freezed
abstract class SearchAlbumResponse with _$SearchAlbumResponse {
  const factory SearchAlbumResponse({
    /// 搜索结果列表
    @Default([]) @JsonKey(name: 'lists') List<SearchAlbumInfo> lists,
    /// 总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 当前页码
    @IntFromStringConverter() @JsonKey(name: 'page') @Default(1) int page,
    /// 每页数量
    @IntFromStringConverter() @JsonKey(name: 'pagesize') @Default(30) int pagesize,
  }) = _SearchAlbumResponse;

  factory SearchAlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumResponseFromJson(json);
}

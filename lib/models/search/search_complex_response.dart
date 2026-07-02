// models/search/search_complex_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'search_song_info.dart';
import 'search_mv_info.dart';
import 'search_album_info.dart';
import 'search_author_info.dart';
import 'search_collect_info.dart';
import 'search_program_info.dart';

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
///
/// 根据 type 字段，lists 中包含不同类型的数据：
/// - song: List<SearchSongInfo>
/// - mv: List<SearchMvInfo>
/// - collect: List<SearchCollectInfo>
/// - program: List<SearchProgramInfo>
/// - album: List<SearchAlbumInfo>
/// - author: List<SearchAuthorInfo>
/// - othersearch/similar/applet/musicphoto/ksong/talent: 空列表或简单数据
@freezed
abstract class SearchComplexGroup with _$SearchComplexGroup {
  const factory SearchComplexGroup({
    /// 类型：song/mv/collect/album/author/ksong/program/talent/othersearch/similar/applet/musicphoto
    @JsonKey(name: 'type') @Default('') String type,
    /// 该类型总数量
    @IntFromStringConverter() @JsonKey(name: 'total') @Default(0) int total,
    /// 搜索结果列表（原始数据，根据type解析）
    @Default([]) @JsonKey(name: 'lists') List<dynamic> lists,
    /// 是否允许错误
    @IntFromStringConverter() @JsonKey(name: 'allowerr') @Default(0) int allowErr,
    /// 是否共享结果
    @IntFromStringConverter() @JsonKey(name: 'isshareresult') @Default(0) int isShareResult,
    /// 索引
    @IntFromStringConverter() @JsonKey(name: 'index') @Default(0) int index,
    /// 标签信息（部分类型有）
    @JsonKey(name: 'sectag_info') @Default({}) Map<String, dynamic> secTagInfo,
    /// 是否标签结果
    @IntFromStringConverter() @JsonKey(name: 'istagresult') @Default(0) int isTagResult,
    /// 是否标签
    @IntFromStringConverter() @JsonKey(name: 'istag') @Default(0) int isTag,
    /// 聚合信息（部分类型有）
    @Default([]) @JsonKey(name: 'sec_aggre') List<dynamic> secAggre,
    /// 聚合信息v2（部分类型有）
    @Default([]) @JsonKey(name: 'sec_aggre_v2') List<dynamic> secAggreV2,
    /// 主题信息（collect类型有）
    @JsonKey(name: 'theme') @Default({}) Map<String, dynamic> theme,
    /// hash（similar类型有）
    @JsonKey(name: 'hash') @Default('') String hash,
    /// 标题（musicphoto类型有）
    @JsonKey(name: 'title') @Default('') String title,
  }) = _SearchComplexGroup;

  factory SearchComplexGroup.fromJson(Map<String, dynamic> json) =>
      _$SearchComplexGroupFromJson(json);
}

/// SearchComplexGroup 扩展方法
extension SearchComplexGroupX on SearchComplexGroup {
  /// 获取歌曲列表
  List<SearchSongInfo> get songList {
    if (type != 'song') return [];
    return lists
        .whereType<Map<String, dynamic>>()
        .map((e) => SearchSongInfo.fromJson(e))
        .toList();
  }

  /// 获取MV列表
  List<SearchMvInfo> get mvList {
    if (type != 'mv') return [];
    return lists
        .whereType<Map<String, dynamic>>()
        .map((e) => SearchMvInfo.fromJson(e))
        .toList();
  }

  /// 获取歌单列表
  List<SearchCollectInfo> get collectList {
    if (type != 'collect') return [];
    return lists
        .whereType<Map<String, dynamic>>()
        .map((e) => SearchCollectInfo.fromJson(e))
        .toList();
  }

  /// 获取节目列表
  List<SearchProgramInfo> get programList {
    if (type != 'program') return [];
    return lists
        .whereType<Map<String, dynamic>>()
        .map((e) => SearchProgramInfo.fromJson(e))
        .toList();
  }

  /// 获取专辑列表
  List<SearchAlbumInfo> get albumList {
    if (type != 'album') return [];
    return lists
        .whereType<Map<String, dynamic>>()
        .map((e) => SearchAlbumInfo.fromJson(e))
        .toList();
  }

  /// 获取歌手列表
  List<SearchAuthorInfo> get authorList {
    if (type != 'author') return [];
    return lists
        .whereType<Map<String, dynamic>>()
        .map((e) => SearchAuthorInfo.fromJson(e))
        .toList();
  }
}

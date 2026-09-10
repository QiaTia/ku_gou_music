// models/search/search_album_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'package:ku_gou_music/models/search/search_song_info.dart';
import 'package:ku_gou_music/utils/utils.dart';

part 'search_album_info.freezed.dart';
part 'search_album_info.g.dart';

/// 搜索结果 - 专辑信息（对应 /v1/search/album）
@freezed
abstract class SearchAlbumInfo with _$SearchAlbumInfo {
  const SearchAlbumInfo._();

  const factory SearchAlbumInfo({
    /// 专辑ID
    @IntFromStringConverter() @JsonKey(name: 'albumid') @Default(0) int albumId,
    /// 专辑名称（可能含 <em> 高亮标记）
    @JsonKey(name: 'albumname') @Default('') String albumName,
    /// 歌手名（可能含 <em> 高亮标记）
    @JsonKey(name: 'singer') @Default('') String singer,
    /// 封面图（完整URL）
    @JsonKey(name: 'img') @Default('') String img,
    /// 歌曲数量
    @IntFromStringConverter() @JsonKey(name: 'songcount') @Default(0) int songCount,
    /// 发布时间
    @JsonKey(name: 'publish_time') @Default('') String publishTime,
    /// 语言
    @JsonKey(name: 'language') @Default('') String language,
    /// 发行公司
    @JsonKey(name: 'company') @Default('') String company,
    /// 介绍
    @JsonKey(name: 'intro') @Default('') String intro,
    /// 短介绍
    @JsonKey(name: 'short_intro') @Default('') String shortIntro,
    /// 标题（如 "魔杰座 - 周杰伦"）
    @JsonKey(name: 'title') @Default('') String title,
    /// 收藏数
    @IntFromStringConverter() @JsonKey(name: 'collect_count') @Default(0) int collectCount,
    /// 权限
    @IntFromStringConverter() @JsonKey(name: 'privilege') @Default(0) int privilege,
    /// 质量
    @IntFromStringConverter() @JsonKey(name: 'quality') @Default(0) int quality,
    /// 是否付费
    @IntFromStringConverter() @JsonKey(name: 'isfirst') @Default(0) int isFirst,
    /// 歌手ID列表
    @Default([]) @JsonKey(name: 'singerids') List<int> singerIds,
    /// 歌手信息列表
    @Default([]) @JsonKey(name: 'singers') List<SearchSinger> singers,
  }) = _SearchAlbumInfo;

  factory SearchAlbumInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumInfoFromJson(json);

  /// 显示用专辑名（去除高亮标记）
  String get displayAlbumName => stripHtmlTags(albumName);

  /// 歌手名（从Singers列表获取，或返回singer）
  String get artistName => singers.isNotEmpty
      ? singers.map((e) => e.name).join('、')
      : singer;

  /// 显示用歌手名（去除高亮标记）
  String get displayArtistName => stripHtmlTags(artistName);
}

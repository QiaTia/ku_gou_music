// models/search/search_album_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_album_info.freezed.dart';
part 'search_album_info.g.dart';

/// 搜索结果 - 专辑信息（对应综合搜索返回的 album 类型）
@freezed
abstract class SearchAlbumInfo with _$SearchAlbumInfo {
  const factory SearchAlbumInfo({
    /// 专辑ID
    @IntFromStringConverter() @JsonKey(name: 'albumid') @Default(0) int albumId,
    /// 专辑名称
    @JsonKey(name: 'albumname') @Default('') String albumName,
    /// 歌手名
    @JsonKey(name: 'singername') @Default('') String singerName,
    /// 封面图
    @JsonKey(name: 'imgurl') @Default('') String imgUrl,
    /// 介绍
    @Default('') String intro,
    /// 发布日期
    @JsonKey(name: 'publish_date') @Default('') String publishDate,
    /// 歌曲数量
    @IntFromStringConverter() @JsonKey(name: 'song_count') @Default(0) int songCount,
    /// 类型标识
    @IntFromStringConverter() @Default(0) int type,
  }) = _SearchAlbumInfo;

  factory SearchAlbumInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchAlbumInfoFromJson(json);
}

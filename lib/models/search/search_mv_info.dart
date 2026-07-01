// models/search/search_mv_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_mv_info.freezed.dart';
part 'search_mv_info.g.dart';

/// 搜索结果 - MV信息（对应综合搜索返回的 mv 类型）
@freezed
abstract class SearchMvInfo with _$SearchMvInfo {
  const factory SearchMvInfo({
    /// MV ID
    @IntFromStringConverter() @JsonKey(name: 'mvid') @Default(0) int mvId,
    /// MV名称
    @JsonKey(name: 'mvname') @Default('') String mvName,
    /// 歌手名
    @JsonKey(name: 'singername') @Default('') String singerName,
    /// 封面图
    @JsonKey(name: 'imgurl') @Default('') String imgUrl,
    /// 播放次数
    @IntFromStringConverter() @JsonKey(name: 'play_count') @Default(0) int playCount,
    /// 发布日期
    @JsonKey(name: 'publish_date') @Default('') String publishDate,
    /// MV时长(秒)
    @IntFromStringConverter() @JsonKey(name: 'time_length') @Default(0) int timeLength,
    /// 关联歌曲hash
    @Default('') String hash,
    /// 关联歌曲ID
    @IntFromStringConverter() @JsonKey(name: 'songid') @Default(0) int songId,
  }) = _SearchMvInfo;

  factory SearchMvInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchMvInfoFromJson(json);
}

// models/search/search_special_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_special_info.freezed.dart';
part 'search_special_info.g.dart';

/// 搜索结果 - 歌单/歌单信息（对应综合搜索返回的 collect 类型）
@freezed
abstract class SearchSpecialInfo with _$SearchSpecialInfo {
  const factory SearchSpecialInfo({
    /// 歌单ID
    @IntFromStringConverter() @JsonKey(name: 'specialid') @Default(0) int specialId,
    /// 歌单名称
    @JsonKey(name: 'specialname') @Default('') String specialName,
    /// 歌手名
    @JsonKey(name: 'singername') @Default('') String singerName,
    /// 封面图
    @JsonKey(name: 'imgurl') @Default('') String imgUrl,
    /// 介绍
    @Default('') String intro,
    /// 播放次数
    @IntFromStringConverter() @JsonKey(name: 'play_count') @Default(0) int playCount,
    /// 收藏数
    @IntFromStringConverter() @Default(0) int collectcount,
    /// 全局收藏ID
    @JsonKey(name: 'global_collection_id') @Default('') String globalCollectionId,
    /// 创建者昵称
    @Default('') String nickname,
    /// 歌曲数量
    @IntFromStringConverter() @JsonKey(name: 'song_count') @Default(0) int songCount,
    /// 标签
    @Default('') String tag,
    /// 发布时间
    @Default('') String publishtime,
  }) = _SearchSpecialInfo;

  factory SearchSpecialInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchSpecialInfoFromJson(json);
}

// models/search/search_special_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'package:ku_gou_music/utils/utils.dart';

part 'search_special_info.freezed.dart';
part 'search_special_info.g.dart';

/// 搜索结果 - 歌单信息（对应 /v1/search/special）
///
/// 真实返回字段为全小写（specialid/specialname/img/...），
/// 其中 play_count、collect_count、total_play_count 可能是字符串。
@freezed
abstract class SearchSpecialInfo with _$SearchSpecialInfo {
  const SearchSpecialInfo._();

  const factory SearchSpecialInfo({
    /// 歌单ID
    @IntFromStringConverter() @JsonKey(name: 'specialid') @Default(0) int specialId,
    /// 歌单名称（可能含 <em> 高亮标记）
    @JsonKey(name: 'specialname') @Default('') String specialName,
    /// 封面图（完整URL）
    @JsonKey(name: 'img') @Default('') String img,
    /// 歌曲数量
    @IntFromStringConverter() @JsonKey(name: 'song_count') @Default(0) int songCount,
    /// 播放次数
    @IntFromStringConverter() @JsonKey(name: 'play_count') @Default(0) int playCount,
    /// 收藏数
    @IntFromStringConverter() @JsonKey(name: 'collect_count') @Default(0) int collectCount,
    /// 全局播放量
    @IntFromStringConverter() @JsonKey(name: 'total_play_count') @Default(0) int totalPlayCount,
    /// 创建者昵称
    @JsonKey(name: 'nickname') @Default('') String nickname,
    /// 创建者用户ID
    @JsonKey(name: 'suid') @Default('') String suid,
    /// 介绍
    @JsonKey(name: 'intro') @Default('') String intro,
    /// 发布时间
    @JsonKey(name: 'publish_time') @Default('') String publishTime,
    /// 全局收藏ID
    @JsonKey(name: 'gid') @Default('') String gid,
    /// 加密全局收藏ID
    @JsonKey(name: 'egid') @Default('') String egid,
    /// 是否VIP歌单
    @IntFromStringConverter() @JsonKey(name: 'isvip') @Default(0) int isVip,
    /// 是否UGC歌单
    @IntFromStringConverter() @JsonKey(name: 'isugc') @Default(0) int isUgc,
    /// 是否发布
    @IntFromStringConverter() @JsonKey(name: 'ispublish') @Default(0) int isPublish,
    /// 是否期刊
    @IntFromStringConverter() @JsonKey(name: 'isperiodical') @Default(0) int isPeriodical,
    /// 是否定制
    @IntFromStringConverter() @JsonKey(name: 'iscustom') @Default(0) int isCustom,
    /// 标签
    @JsonKey(name: 'tag_str') @Default('') String tagStr,
    /// 包含内容
    @JsonKey(name: 'contain') @Default('') String contain,
    /// 评分（整数部分）
    @JsonKey(name: 'grade_int') @Default('') String gradeInt,
    /// 评分（浮点部分）
    @JsonKey(name: 'grade_float') @Default('') String gradeFloat,
    /// 质量
    @IntFromStringConverter() @JsonKey(name: 'quality') @Default(0) int quality,
  }) = _SearchSpecialInfo;

  factory SearchSpecialInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchSpecialInfoFromJson(json);

  /// 显示用歌单名（去除高亮标记）
  String get displaySpecialName => stripHtmlTags(specialName);
}

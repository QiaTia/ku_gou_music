// models/search/search_collect_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_collect_info.freezed.dart';
part 'search_collect_info.g.dart';

/// 搜索结果 - 歌单/收藏信息（对应综合搜索返回的 collect 类型）
@freezed
abstract class SearchCollectInfo with _$SearchCollectInfo {
  const factory SearchCollectInfo({
    /// 歌单ID
    @IntFromStringConverter() @JsonKey(name: 'specialid') @Default(0) int specialId,
    /// 歌单名称
    @JsonKey(name: 'specialname') @Default('') String specialName,
    /// 封面图
    @JsonKey(name: 'img') @Default('') String img,
    /// 介绍
    @JsonKey(name: 'intro') @Default('') String intro,
    /// 歌曲数量
    @IntFromStringConverter() @JsonKey(name: 'song_count') @Default(0) int songCount,
    /// 播放次数
    @JsonKey(name: 'play_count') @Default('') String playCount,
    /// 收藏数
    @JsonKey(name: 'collect_count') @Default('') String collectCount,
    /// 全局播放量
    @JsonKey(name: 'total_play_count') @Default('') String totalPlayCount,
    /// 创建者昵称
    @JsonKey(name: 'nickname') @Default('') String nickname,
    /// 用户ID
    @JsonKey(name: 'suid') @Default('') String suid,
    /// 是否发布
    @IntFromStringConverter() @JsonKey(name: 'ispublish') @Default(0) int isPublish,
    /// 是否VIP
    @IntFromStringConverter() @JsonKey(name: 'isvip') @Default(0) int isVip,
    /// 是否UGC
    @IntFromStringConverter() @JsonKey(name: 'isugc') @Default(0) int isUgc,
    /// 是否互相关注
    @IntFromStringConverter() @JsonKey(name: 'is_mutual') @Default(0) int isMutual,
    /// 是否定制
    @IntFromStringConverter() @JsonKey(name: 'iscustom') @Default(0) int isCustom,
    /// 是否期刊
    @IntFromStringConverter() @JsonKey(name: 'isperiodical') @Default(0) int isPeriodical,
    /// 标签
    @JsonKey(name: 'tag_str') @Default('') String tagStr,
    /// 包含内容
    @JsonKey(name: 'contain') @Default('') String contain,
    /// 发布时间
    @JsonKey(name: 'publish_time') @Default('') String publishTime,
    /// 全局ID
    @JsonKey(name: 'gid') @Default('') String gid,
    /// 版本号
    @IntFromStringConverter() @JsonKey(name: 'version') @Default(0) int version,
    /// 质量
    @IntFromStringConverter() @JsonKey(name: 'quality') @Default(0) int quality,
    /// 新质量
    @IntFromStringConverter() @JsonKey(name: 'quality_new') @Default(0) int qualityNew,
    /// 评分
    @IntFromStringConverter() @JsonKey(name: 'grade') @Default(0) int grade,
    /// 评分(整数)
    @IntFromStringConverter() @JsonKey(name: 'grade_int') @Default(0) int gradeInt,
    /// 评分(浮点)
    @JsonKey(name: 'grade_float') @Default('') String gradeFloat,
    /// 期数
    @IntFromStringConverter() @JsonKey(name: 'nper') @Default(0) int nper,
    /// SRID
    @JsonKey(name: 'srid') @Default('') String srid,
    /// 算法路径
    @JsonKey(name: 'alg_path') @Default('') String algPath,
    /// 标签信息
    @JsonKey(name: 'abtags') @Default({}) Map<String, dynamic> abTags,
    /// 传输参数
    @JsonKey(name: 'trans_param') @Default({}) Map<String, dynamic> transParam,
    /// 主题信息
    @JsonKey(name: 'theme') @Default({}) Map<String, dynamic> theme,
  }) = _SearchCollectInfo;

  factory SearchCollectInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchCollectInfoFromJson(json);
}

// models/search/search_program_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_program_info.freezed.dart';
part 'search_program_info.g.dart';

/// 搜索结果 - 节目/播客信息（对应综合搜索返回的 program 类型）
@freezed
abstract class SearchProgramInfo with _$SearchProgramInfo {
  const factory SearchProgramInfo({
    /// 专辑ID
    @IntFromStringConverter() @JsonKey(name: 'albumid') @Default(0) int albumId,
    /// 专辑名称
    @JsonKey(name: 'albumname') @Default('') String albumName,
    /// 标题
    @JsonKey(name: 'title') @Default('') String title,
    /// 封面图
    @JsonKey(name: 'img') @Default('') String img,
    /// 歌手名
    @JsonKey(name: 'singer') @Default('') String singer,
    /// 播放次数
    @IntFromStringConverter() @JsonKey(name: 'play_count') @Default(0) int playCount,
    /// 播放时长
    @IntFromStringConverter() @JsonKey(name: 'play_times') @Default(0) int playTimes,
    /// 歌曲数量
    @IntFromStringConverter() @JsonKey(name: 'songcount') @Default(0) int songCount,
    /// 收藏数
    @IntFromStringConverter() @JsonKey(name: 'collect_count') @Default(0) int collectCount,
    /// 购买者数量
    @IntFromStringConverter() @JsonKey(name: 'buyercount') @Default(0) int buyerCount,
    /// 是否首发
    @IntFromStringConverter() @JsonKey(name: 'isfirst') @Default(0) int isFirst,
    /// 是否外部
    @IntFromStringConverter() @JsonKey(name: 'isouter') @Default(0) int isOuter,
    /// 语言
    @JsonKey(name: 'language') @Default('') String language,
    /// 分类
    @IntFromStringConverter() @JsonKey(name: 'category') @Default(0) int category,
    /// 简介
    @JsonKey(name: 'intro') @Default('') String intro,
    /// 短简介
    @JsonKey(name: 'short_intro') @Default('') String shortIntro,
    /// 标签
    @JsonKey(name: 'tag_str') @Default('') String tagStr,
    /// 发布时间
    @JsonKey(name: 'publish_time') @Default('') String publishTime,
    /// 公司
    @JsonKey(name: 'company') @Default('') String company,
    /// CD链接
    @JsonKey(name: 'cd_url') @Default('') String cdUrl,
    /// 跳转链接
    @JsonKey(name: 'jump_url') @Default('') String jumpUrl,
    /// 章节名
    @JsonKey(name: 'chapter_name') @Default('') String chapterName,
    /// 专辑辅助信息
    @JsonKey(name: 'album_aux') @Default('') String albumAux,
    /// 辅助信息
    @JsonKey(name: 'auxiliary') @Default('') String auxiliary,
    /// 备注
    @JsonKey(name: 'ostremark') @Default('') String ostRemark,
    /// 评分
    @JsonKey(name: 'grade') @Default('') String grade,
    /// 评分(整数)
    @JsonKey(name: 'grade_int') @Default('') String gradeInt,
    /// 评分(浮点)
    @JsonKey(name: 'grade_float') @Default('') String gradeFloat,
    /// 新质量
    @IntFromStringConverter() @JsonKey(name: 'newquality') @Default(0) int newQuality,
    /// 质量
    @IntFromStringConverter() @JsonKey(name: 'quality') @Default(0) int quality,
    /// 特权
    @IntFromStringConverter() @JsonKey(name: 'privilege') @Default(0) int privilege,
    /// 是否隐藏(旧)
    @IntFromStringConverter() @JsonKey(name: 'oldhide') @Default(0) int oldHide,
    /// 是否内部节目
    @IntFromStringConverter() @JsonKey(name: 'program_inner') @Default(0) int programInner,
    /// 特殊标签
    @JsonKey(name: 'special_tag') @Default('') String specialTag,
    /// 推荐标签
    @JsonKey(name: 'rec_tag') @Default({}) Map<String, dynamic> recTag,
    /// 传输参数
    @JsonKey(name: 'trans_param') @Default({}) Map<String, dynamic> transParam,
    /// 外部数据
    @JsonKey(name: 'outerdata') @Default({}) Map<String, dynamic> outerData,
    /// 歌手列表
    @Default([]) @JsonKey(name: 'singers') List<SearchProgramSinger> singers,
    /// 歌手ID列表
    @Default([]) @JsonKey(name: 'singerids') List<int> singerIds,
    /// 默认歌曲列表
    @Default([]) @JsonKey(name: 'program_def_songs') List<String> programDefSongs,
  }) = _SearchProgramInfo;

  factory SearchProgramInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchProgramInfoFromJson(json);
}

/// 节目搜索结果中的歌手信息
@freezed
abstract class SearchProgramSinger with _$SearchProgramSinger {
  const factory SearchProgramSinger({
    @IntFromStringConverter() @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'name') @Default('') String name,
  }) = _SearchProgramSinger;

  factory SearchProgramSinger.fromJson(Map<String, dynamic> json) =>
      _$SearchProgramSingerFromJson(json);
}

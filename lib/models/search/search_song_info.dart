// models/search/search_song_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_song_info.freezed.dart';
part 'search_song_info.g.dart';

/// 搜索结果 - 单曲信息（对应综合搜索返回的 song 类型）
@freezed
abstract class SearchSongInfo with _$SearchSongInfo {
  const SearchSongInfo._();

  const factory SearchSongInfo({
    /// 歌曲ID（如：32157565）
    @IntFromStringConverter() @JsonKey(name: 'ID') @Default(0) int id,
    /// 歌曲名
    @JsonKey(name: 'SongName') @Default('') String songName,
    /// 歌手名
    @JsonKey(name: 'SingerName') @Default('') String singerName,
    /// 歌曲Hash（用于播放）
    @JsonKey(name: 'FileHash') @Default('') String fileHash,
    /// 歌曲时长（秒）
    @IntFromStringConverter() @JsonKey(name: 'Duration') @Default(0) int duration,
    /// 封面图URL（含 {size} 占位符）
    @JsonKey(name: 'Image') @Default('') String image,
    /// 专辑ID
    @IntFromStringConverter() @JsonKey(name: 'AlbumID') @Default(0) int albumId,
    /// 专辑名
    @JsonKey(name: 'AlbumName') @Default('') String albumName,
    /// 音质等级
    @IntFromStringConverter() @JsonKey(name: 'QualityLevel') @Default(0) int qualityLevel,
    /// 是否原唱
    @IntFromStringConverter() @JsonKey(name: 'IsOriginal') @Default(0) int isOriginal,
    /// 文件大小（字节）
    @IntFromStringConverter() @JsonKey(name: 'FileSize') @Default(0) int fileSize,
    /// 无损Hash
    @JsonKey(name: 'SQFileHash') @Default('') String sqFileHash,
    /// HQ Hash
    @JsonKey(name: 'HQFileHash') @Default('') String hqFileHash,
    /// 是否VIP（Privilege字段）
    @IntFromStringConverter() @JsonKey(name: 'Privilege') @Default(0) int privilege,
    /// 发布日期
    @JsonKey(name: 'PublishDate') @Default('') String publishDate,
    /// 歌曲标签
    @JsonKey(name: 'SongLabel') @Default('') String songLabel,
    /// 文件名（完整格式）
    @JsonKey(name: 'FileName') @Default('') String fileName,
    /// MV Hash
    @JsonKey(name: 'MvHash') @Default('') String mvHash,
    /// 原歌曲名（不带后缀）
    @JsonKey(name: 'OriSongName') @Default('') String oriSongName,
    /// 其他名称
    @JsonKey(name: 'OtherName') @Default('') String otherName,
    /// 后缀（如 DJ版）
    @JsonKey(name: 'Suffix') @Default('') String suffix,
    /// 歌手ID列表
    @Default([]) @JsonKey(name: 'SingerId') List<int> singerId,
    /// 歌手信息列表
    @Default([]) @JsonKey(name: 'Singers') List<SearchSinger> singers,
    /// 扩展名（mp3/flac等）
    @JsonKey(name: 'ExtName') @Default('') String extName,
    /// 码率
    @IntFromStringConverter() @JsonKey(name: 'Bitrate') @Default(0) int bitrate,
    /// 付费类型
    @IntFromStringConverter() @JsonKey(name: 'PayType') @Default(0) int payType,
    /// 价格
    @IntFromStringConverter() @JsonKey(name: 'Price') @Default(0) int price,
    /// 热度等级
    @IntFromStringConverter() @JsonKey(name: 'HeatLevel') @Default(0) int heatLevel,
    /// 是否预发布
    @IntFromStringConverter() @JsonKey(name: 'isPrepublish') @Default(0) int isPrepublish,
  }) = _SearchSongInfo;

  factory SearchSongInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchSongInfoFromJson(json);

  /// 封面URL（替换size为150）
  String get coverUrl150 => image.replaceAll('{size}', '150');

  /// 时长格式化 mm:ss
  String get durationLabel {
    final m = duration ~/ 60;
    final s = (duration % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  /// 歌手名（从Singers列表获取，或返回SingerName）
  String get artistName => singers.isNotEmpty
      ? singers.map((e) => e.name).join('、')
      : singerName;

  /// 是否VIP歌曲
  bool get isVip => privilege > 0;

  /// 显示歌名（带后缀）
  String get displayName => suffix.isNotEmpty ? '$songName ($suffix)' : songName;
}

/// 搜索结果中的歌手信息
@freezed
abstract class SearchSinger with _$SearchSinger {
  const factory SearchSinger({
    @JsonKey(name: 'name') @Default('') String name,
    @IntFromStringConverter() @JsonKey(name: 'id') @Default(0) int id,
    @IntFromStringConverter() @JsonKey(name: 'ip_id') @Default(0) int ipId,
  }) = _SearchSinger;

  factory SearchSinger.fromJson(Map<String, dynamic> json) =>
      _$SearchSingerFromJson(json);
}

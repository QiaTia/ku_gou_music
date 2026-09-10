// models/search/search_lyric_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
import 'package:ku_gou_music/models/search/search_song_info.dart';
import 'package:ku_gou_music/utils/utils.dart';

part 'search_lyric_info.freezed.dart';
part 'search_lyric_info.g.dart';

/// 搜索结果 - 歌词信息（对应 /v1/search/lyric）
@freezed
abstract class SearchLyricInfo with _$SearchLyricInfo {
  const SearchLyricInfo._();

  const factory SearchLyricInfo({
    /// 歌词ID（与歌曲ID一致）
    @IntFromStringConverter() @JsonKey(name: 'LyricID') @Default(0) int lyricId,
    /// 歌曲名
    @JsonKey(name: 'SongName') @Default('') String songName,
    /// 歌手名
    @JsonKey(name: 'SingerName') @Default('') String singerName,
    /// 文件名（如 "周杰伦 - 晴天"）
    @JsonKey(name: 'FileName') @Default('') String fileName,
    /// 歌曲hash
    @JsonKey(name: 'FileHash') @Default('') String fileHash,
    /// 歌曲时长（秒）
    @IntFromStringConverter() @JsonKey(name: 'TimeLength') @Default(0) int duration,
    /// 码率
    @IntFromStringConverter() @JsonKey(name: 'BitRate') @Default(0) int bitRate,
    /// 音质
    @IntFromStringConverter() @JsonKey(name: 'Quality') @Default(0) int quality,
    /// 文件大小（字节）
    @IntFromStringConverter() @JsonKey(name: 'FileSize') @Default(0) int fileSize,
    /// 扩展名
    @JsonKey(name: 'ExtName') @Default('') String extName,
    /// 专辑ID
    @JsonKey(name: 'AlbumID') @Default('') String albumId,
    /// 封面图（含 {size} 占位符）
    @JsonKey(name: 'Image') @Default('') String image,
    /// 歌词预览文本
    @JsonKey(name: 'Lyric') @Default('') String lyric,
    /// 320k Hash
    @JsonKey(name: '320Hash') @Default('') String hqHash,
    /// 无损 Hash
    @JsonKey(name: 'SQHash') @Default('') String sqHash,
    /// 无损文件大小
    @IntFromStringConverter() @JsonKey(name: 'SQSize') @Default(0) int sqSize,
    /// 是否有MV
    @JsonKey(name: 'HasMv') @Default(false) bool hasMv,
    /// MV Hash
    @JsonKey(name: 'MvHash') @Default('') String mvHash,
    /// 权限
    @IntFromStringConverter() @JsonKey(name: 'Privilege') @Default(0) int privilege,
    /// MixSongID
    @IntFromStringConverter() @JsonKey(name: 'MixSongID') @Default(0) int mixSongId,
    /// 歌手信息列表
    @Default([]) @JsonKey(name: 'Singers') List<SearchSinger> singers,
  }) = _SearchLyricInfo;

  factory SearchLyricInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricInfoFromJson(json);

  /// 时长格式化 mm:ss
  String get durationLabel => formatDuration(duration);

  /// 歌手名（从Singers列表获取，或返回SingerName）
  String get artistName => singers.isNotEmpty
      ? singers.map((e) => e.name).join('、')
      : singerName;

  /// 显示用歌名（去除高亮标记）
  String get displaySongName => stripHtmlTags(songName);

  /// 显示用歌手名（去除高亮标记）
  String get displayArtistName => stripHtmlTags(artistName);
}

// models/search/search_lyric_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';

part 'search_lyric_info.freezed.dart';
part 'search_lyric_info.g.dart';

/// 搜索结果 - 歌词信息
@freezed
abstract class SearchLyricInfo with _$SearchLyricInfo {
  const factory SearchLyricInfo({
    /// 歌词ID
    @IntFromStringConverter() required int id,
    /// 歌词访问密钥
    @Default('') String accesskey,
    /// 歌曲名
    @JsonKey(name: 'songname') @Default('') String songName,
    /// 歌手名
    @JsonKey(name: 'singername') @Default('') String singerName,
    /// 歌曲hash
    @Default('') String hash,
    /// 歌曲时长
    @IntFromStringConverter() @JsonKey(name: 'duration') @Default(0) int duration,
    /// 专辑ID
    @IntFromStringConverter() @JsonKey(name: 'album_id') @Default(0) int albumId,
    /// 专辑音频ID
    @IntFromStringConverter() @JsonKey(name: 'album_audio_id') @Default(0) int albumAudioId,
  }) = _SearchLyricInfo;

  factory SearchLyricInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchLyricInfoFromJson(json);
}

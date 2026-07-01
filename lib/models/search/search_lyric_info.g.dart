// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_lyric_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchLyricInfo _$SearchLyricInfoFromJson(Map<String, dynamic> json) =>
    _SearchLyricInfo(
      id: const IntFromStringConverter().fromJson(json['id']),
      accesskey: json['accesskey'] as String? ?? '',
      songName: json['songname'] as String? ?? '',
      singerName: json['singername'] as String? ?? '',
      hash: json['hash'] as String? ?? '',
      duration: json['duration'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['duration']),
      albumId: json['album_id'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['album_id']),
      albumAudioId: json['album_audio_id'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['album_audio_id']),
    );

Map<String, dynamic> _$SearchLyricInfoToJson(_SearchLyricInfo instance) =>
    <String, dynamic>{
      'id': const IntFromStringConverter().toJson(instance.id),
      'accesskey': instance.accesskey,
      'songname': instance.songName,
      'singername': instance.singerName,
      'hash': instance.hash,
      'duration': const IntFromStringConverter().toJson(instance.duration),
      'album_id': const IntFromStringConverter().toJson(instance.albumId),
      'album_audio_id': const IntFromStringConverter().toJson(
        instance.albumAudioId,
      ),
    };

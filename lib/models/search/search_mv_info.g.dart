// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mv_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchMvInfo _$SearchMvInfoFromJson(Map<String, dynamic> json) =>
    _SearchMvInfo(
      mvId: json['mvid'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['mvid']),
      mvName: json['mvname'] as String? ?? '',
      singerName: json['singername'] as String? ?? '',
      imgUrl: json['imgurl'] as String? ?? '',
      playCount: json['play_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['play_count']),
      publishDate: json['publish_date'] as String? ?? '',
      timeLength: json['time_length'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['time_length']),
      hash: json['hash'] as String? ?? '',
      songId: json['songid'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['songid']),
    );

Map<String, dynamic> _$SearchMvInfoToJson(_SearchMvInfo instance) =>
    <String, dynamic>{
      'mvid': const IntFromStringConverter().toJson(instance.mvId),
      'mvname': instance.mvName,
      'singername': instance.singerName,
      'imgurl': instance.imgUrl,
      'play_count': const IntFromStringConverter().toJson(instance.playCount),
      'publish_date': instance.publishDate,
      'time_length': const IntFromStringConverter().toJson(instance.timeLength),
      'hash': instance.hash,
      'songid': const IntFromStringConverter().toJson(instance.songId),
    };

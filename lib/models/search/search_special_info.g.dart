// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_special_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchSpecialInfo _$SearchSpecialInfoFromJson(Map<String, dynamic> json) =>
    _SearchSpecialInfo(
      specialId: json['specialid'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['specialid']),
      specialName: json['specialname'] as String? ?? '',
      singerName: json['singername'] as String? ?? '',
      imgUrl: json['imgurl'] as String? ?? '',
      intro: json['intro'] as String? ?? '',
      playCount: json['play_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['play_count']),
      collectcount: json['collectcount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['collectcount']),
      globalCollectionId: json['global_collection_id'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      songCount: json['song_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['song_count']),
      tag: json['tag'] as String? ?? '',
      publishtime: json['publishtime'] as String? ?? '',
    );

Map<String, dynamic> _$SearchSpecialInfoToJson(
  _SearchSpecialInfo instance,
) => <String, dynamic>{
  'specialid': const IntFromStringConverter().toJson(instance.specialId),
  'specialname': instance.specialName,
  'singername': instance.singerName,
  'imgurl': instance.imgUrl,
  'intro': instance.intro,
  'play_count': const IntFromStringConverter().toJson(instance.playCount),
  'collectcount': const IntFromStringConverter().toJson(instance.collectcount),
  'global_collection_id': instance.globalCollectionId,
  'nickname': instance.nickname,
  'song_count': const IntFromStringConverter().toJson(instance.songCount),
  'tag': instance.tag,
  'publishtime': instance.publishtime,
};

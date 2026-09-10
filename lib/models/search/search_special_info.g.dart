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
      img: json['img'] as String? ?? '',
      songCount: json['song_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['song_count']),
      playCount: json['play_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['play_count']),
      collectCount: json['collect_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['collect_count']),
      totalPlayCount: json['total_play_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['total_play_count']),
      nickname: json['nickname'] as String? ?? '',
      suid: json['suid'] as String? ?? '',
      intro: json['intro'] as String? ?? '',
      publishTime: json['publish_time'] as String? ?? '',
      gid: json['gid'] as String? ?? '',
      egid: json['egid'] as String? ?? '',
      isVip: json['isvip'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isvip']),
      isUgc: json['isugc'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isugc']),
      isPublish: json['ispublish'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['ispublish']),
      isPeriodical: json['isperiodical'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isperiodical']),
      isCustom: json['iscustom'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['iscustom']),
      tagStr: json['tag_str'] as String? ?? '',
      contain: json['contain'] as String? ?? '',
      gradeInt: json['grade_int'] as String? ?? '',
      gradeFloat: json['grade_float'] as String? ?? '',
      quality: json['quality'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['quality']),
    );

Map<String, dynamic> _$SearchSpecialInfoToJson(
  _SearchSpecialInfo instance,
) => <String, dynamic>{
  'specialid': const IntFromStringConverter().toJson(instance.specialId),
  'specialname': instance.specialName,
  'img': instance.img,
  'song_count': const IntFromStringConverter().toJson(instance.songCount),
  'play_count': const IntFromStringConverter().toJson(instance.playCount),
  'collect_count': const IntFromStringConverter().toJson(instance.collectCount),
  'total_play_count': const IntFromStringConverter().toJson(
    instance.totalPlayCount,
  ),
  'nickname': instance.nickname,
  'suid': instance.suid,
  'intro': instance.intro,
  'publish_time': instance.publishTime,
  'gid': instance.gid,
  'egid': instance.egid,
  'isvip': const IntFromStringConverter().toJson(instance.isVip),
  'isugc': const IntFromStringConverter().toJson(instance.isUgc),
  'ispublish': const IntFromStringConverter().toJson(instance.isPublish),
  'isperiodical': const IntFromStringConverter().toJson(instance.isPeriodical),
  'iscustom': const IntFromStringConverter().toJson(instance.isCustom),
  'tag_str': instance.tagStr,
  'contain': instance.contain,
  'grade_int': instance.gradeInt,
  'grade_float': instance.gradeFloat,
  'quality': const IntFromStringConverter().toJson(instance.quality),
};

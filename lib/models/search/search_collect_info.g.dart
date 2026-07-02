// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_collect_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchCollectInfo _$SearchCollectInfoFromJson(Map<String, dynamic> json) =>
    _SearchCollectInfo(
      specialId: json['specialid'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['specialid']),
      specialName: json['specialname'] as String? ?? '',
      img: json['img'] as String? ?? '',
      intro: json['intro'] as String? ?? '',
      songCount: json['song_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['song_count']),
      playCount: json['play_count'] as String? ?? '',
      collectCount: json['collect_count'] as String? ?? '',
      totalPlayCount: json['total_play_count'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      suid: json['suid'] as String? ?? '',
      isPublish: json['ispublish'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['ispublish']),
      isVip: json['isvip'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isvip']),
      isUgc: json['isugc'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isugc']),
      isMutual: json['is_mutual'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['is_mutual']),
      isCustom: json['iscustom'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['iscustom']),
      isPeriodical: json['isperiodical'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isperiodical']),
      tagStr: json['tag_str'] as String? ?? '',
      contain: json['contain'] as String? ?? '',
      publishTime: json['publish_time'] as String? ?? '',
      gid: json['gid'] as String? ?? '',
      version: json['version'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['version']),
      quality: json['quality'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['quality']),
      qualityNew: json['quality_new'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['quality_new']),
      grade: json['grade'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['grade']),
      gradeInt: json['grade_int'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['grade_int']),
      gradeFloat: json['grade_float'] as String? ?? '',
      nper: json['nper'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['nper']),
      srid: json['srid'] as String? ?? '',
      algPath: json['alg_path'] as String? ?? '',
      abTags: json['abtags'] as Map<String, dynamic>? ?? const {},
      transParam: json['trans_param'] as Map<String, dynamic>? ?? const {},
      theme: json['theme'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$SearchCollectInfoToJson(
  _SearchCollectInfo instance,
) => <String, dynamic>{
  'specialid': const IntFromStringConverter().toJson(instance.specialId),
  'specialname': instance.specialName,
  'img': instance.img,
  'intro': instance.intro,
  'song_count': const IntFromStringConverter().toJson(instance.songCount),
  'play_count': instance.playCount,
  'collect_count': instance.collectCount,
  'total_play_count': instance.totalPlayCount,
  'nickname': instance.nickname,
  'suid': instance.suid,
  'ispublish': const IntFromStringConverter().toJson(instance.isPublish),
  'isvip': const IntFromStringConverter().toJson(instance.isVip),
  'isugc': const IntFromStringConverter().toJson(instance.isUgc),
  'is_mutual': const IntFromStringConverter().toJson(instance.isMutual),
  'iscustom': const IntFromStringConverter().toJson(instance.isCustom),
  'isperiodical': const IntFromStringConverter().toJson(instance.isPeriodical),
  'tag_str': instance.tagStr,
  'contain': instance.contain,
  'publish_time': instance.publishTime,
  'gid': instance.gid,
  'version': const IntFromStringConverter().toJson(instance.version),
  'quality': const IntFromStringConverter().toJson(instance.quality),
  'quality_new': const IntFromStringConverter().toJson(instance.qualityNew),
  'grade': const IntFromStringConverter().toJson(instance.grade),
  'grade_int': const IntFromStringConverter().toJson(instance.gradeInt),
  'grade_float': instance.gradeFloat,
  'nper': const IntFromStringConverter().toJson(instance.nper),
  'srid': instance.srid,
  'alg_path': instance.algPath,
  'abtags': instance.abTags,
  'trans_param': instance.transParam,
  'theme': instance.theme,
};

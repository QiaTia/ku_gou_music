// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_program_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchProgramInfo _$SearchProgramInfoFromJson(Map<String, dynamic> json) =>
    _SearchProgramInfo(
      albumId: json['albumid'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['albumid']),
      albumName: json['albumname'] as String? ?? '',
      title: json['title'] as String? ?? '',
      img: json['img'] as String? ?? '',
      singer: json['singer'] as String? ?? '',
      playCount: json['play_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['play_count']),
      playTimes: json['play_times'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['play_times']),
      songCount: json['songcount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['songcount']),
      collectCount: json['collect_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['collect_count']),
      buyerCount: json['buyercount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['buyercount']),
      isFirst: json['isfirst'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isfirst']),
      isOuter: json['isouter'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isouter']),
      language: json['language'] as String? ?? '',
      category: json['category'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['category']),
      intro: json['intro'] as String? ?? '',
      shortIntro: json['short_intro'] as String? ?? '',
      tagStr: json['tag_str'] as String? ?? '',
      publishTime: json['publish_time'] as String? ?? '',
      company: json['company'] as String? ?? '',
      cdUrl: json['cd_url'] as String? ?? '',
      jumpUrl: json['jump_url'] as String? ?? '',
      chapterName: json['chapter_name'] as String? ?? '',
      albumAux: json['album_aux'] as String? ?? '',
      auxiliary: json['auxiliary'] as String? ?? '',
      ostRemark: json['ostremark'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      gradeInt: json['grade_int'] as String? ?? '',
      gradeFloat: json['grade_float'] as String? ?? '',
      newQuality: json['newquality'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['newquality']),
      quality: json['quality'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['quality']),
      privilege: json['privilege'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['privilege']),
      oldHide: json['oldhide'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['oldhide']),
      programInner: json['program_inner'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['program_inner']),
      specialTag: json['special_tag'] as String? ?? '',
      recTag: json['rec_tag'] as Map<String, dynamic>? ?? const {},
      transParam: json['trans_param'] as Map<String, dynamic>? ?? const {},
      outerData: json['outerdata'] as Map<String, dynamic>? ?? const {},
      singers:
          (json['singers'] as List<dynamic>?)
              ?.map(
                (e) => SearchProgramSinger.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      singerIds:
          (json['singerids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      programDefSongs:
          (json['program_def_songs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchProgramInfoToJson(
  _SearchProgramInfo instance,
) => <String, dynamic>{
  'albumid': const IntFromStringConverter().toJson(instance.albumId),
  'albumname': instance.albumName,
  'title': instance.title,
  'img': instance.img,
  'singer': instance.singer,
  'play_count': const IntFromStringConverter().toJson(instance.playCount),
  'play_times': const IntFromStringConverter().toJson(instance.playTimes),
  'songcount': const IntFromStringConverter().toJson(instance.songCount),
  'collect_count': const IntFromStringConverter().toJson(instance.collectCount),
  'buyercount': const IntFromStringConverter().toJson(instance.buyerCount),
  'isfirst': const IntFromStringConverter().toJson(instance.isFirst),
  'isouter': const IntFromStringConverter().toJson(instance.isOuter),
  'language': instance.language,
  'category': const IntFromStringConverter().toJson(instance.category),
  'intro': instance.intro,
  'short_intro': instance.shortIntro,
  'tag_str': instance.tagStr,
  'publish_time': instance.publishTime,
  'company': instance.company,
  'cd_url': instance.cdUrl,
  'jump_url': instance.jumpUrl,
  'chapter_name': instance.chapterName,
  'album_aux': instance.albumAux,
  'auxiliary': instance.auxiliary,
  'ostremark': instance.ostRemark,
  'grade': instance.grade,
  'grade_int': instance.gradeInt,
  'grade_float': instance.gradeFloat,
  'newquality': const IntFromStringConverter().toJson(instance.newQuality),
  'quality': const IntFromStringConverter().toJson(instance.quality),
  'privilege': const IntFromStringConverter().toJson(instance.privilege),
  'oldhide': const IntFromStringConverter().toJson(instance.oldHide),
  'program_inner': const IntFromStringConverter().toJson(instance.programInner),
  'special_tag': instance.specialTag,
  'rec_tag': instance.recTag,
  'trans_param': instance.transParam,
  'outerdata': instance.outerData,
  'singers': instance.singers,
  'singerids': instance.singerIds,
  'program_def_songs': instance.programDefSongs,
};

_SearchProgramSinger _$SearchProgramSingerFromJson(Map<String, dynamic> json) =>
    _SearchProgramSinger(
      id: json['id'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['id']),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SearchProgramSingerToJson(
  _SearchProgramSinger instance,
) => <String, dynamic>{
  'id': const IntFromStringConverter().toJson(instance.id),
  'name': instance.name,
};

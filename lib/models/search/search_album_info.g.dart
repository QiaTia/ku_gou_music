// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_album_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchAlbumInfo _$SearchAlbumInfoFromJson(Map<String, dynamic> json) =>
    _SearchAlbumInfo(
      albumId: json['albumid'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['albumid']),
      albumName: json['albumname'] as String? ?? '',
      singer: json['singer'] as String? ?? '',
      img: json['img'] as String? ?? '',
      songCount: json['songcount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['songcount']),
      publishTime: json['publish_time'] as String? ?? '',
      language: json['language'] as String? ?? '',
      company: json['company'] as String? ?? '',
      intro: json['intro'] as String? ?? '',
      shortIntro: json['short_intro'] as String? ?? '',
      title: json['title'] as String? ?? '',
      collectCount: json['collect_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['collect_count']),
      privilege: json['privilege'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['privilege']),
      quality: json['quality'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['quality']),
      isFirst: json['isfirst'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isfirst']),
      singerIds:
          (json['singerids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      singers:
          (json['singers'] as List<dynamic>?)
              ?.map((e) => SearchSinger.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchAlbumInfoToJson(
  _SearchAlbumInfo instance,
) => <String, dynamic>{
  'albumid': const IntFromStringConverter().toJson(instance.albumId),
  'albumname': instance.albumName,
  'singer': instance.singer,
  'img': instance.img,
  'songcount': const IntFromStringConverter().toJson(instance.songCount),
  'publish_time': instance.publishTime,
  'language': instance.language,
  'company': instance.company,
  'intro': instance.intro,
  'short_intro': instance.shortIntro,
  'title': instance.title,
  'collect_count': const IntFromStringConverter().toJson(instance.collectCount),
  'privilege': const IntFromStringConverter().toJson(instance.privilege),
  'quality': const IntFromStringConverter().toJson(instance.quality),
  'isfirst': const IntFromStringConverter().toJson(instance.isFirst),
  'singerids': instance.singerIds,
  'singers': instance.singers,
};

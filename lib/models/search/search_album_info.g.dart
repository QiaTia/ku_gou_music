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
      singerName: json['singername'] as String? ?? '',
      imgUrl: json['imgurl'] as String? ?? '',
      intro: json['intro'] as String? ?? '',
      publishDate: json['publish_date'] as String? ?? '',
      songCount: json['song_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['song_count']),
      type: json['type'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['type']),
    );

Map<String, dynamic> _$SearchAlbumInfoToJson(_SearchAlbumInfo instance) =>
    <String, dynamic>{
      'albumid': const IntFromStringConverter().toJson(instance.albumId),
      'albumname': instance.albumName,
      'singername': instance.singerName,
      'imgurl': instance.imgUrl,
      'intro': instance.intro,
      'publish_date': instance.publishDate,
      'song_count': const IntFromStringConverter().toJson(instance.songCount),
      'type': const IntFromStringConverter().toJson(instance.type),
    };

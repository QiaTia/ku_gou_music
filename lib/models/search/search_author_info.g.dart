// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_author_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchAuthorInfo _$SearchAuthorInfoFromJson(Map<String, dynamic> json) =>
    _SearchAuthorInfo(
      authorId: json['authorid'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['authorid']),
      authorName: json['author_name'] as String? ?? '',
      imgUrl: json['imgurl'] as String? ?? '',
      songCount: json['song_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['song_count']),
      albumCount: json['album_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['album_count']),
      mvCount: json['mv_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['mv_count']),
      fansCount: json['fans_count'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['fans_count']),
      isPublish: json['is_publish'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['is_publish']),
    );

Map<String, dynamic> _$SearchAuthorInfoToJson(_SearchAuthorInfo instance) =>
    <String, dynamic>{
      'authorid': const IntFromStringConverter().toJson(instance.authorId),
      'author_name': instance.authorName,
      'imgurl': instance.imgUrl,
      'song_count': const IntFromStringConverter().toJson(instance.songCount),
      'album_count': const IntFromStringConverter().toJson(instance.albumCount),
      'mv_count': const IntFromStringConverter().toJson(instance.mvCount),
      'fans_count': const IntFromStringConverter().toJson(instance.fansCount),
      'is_publish': const IntFromStringConverter().toJson(instance.isPublish),
    };

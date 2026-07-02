// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_author_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchAuthorInfo _$SearchAuthorInfoFromJson(Map<String, dynamic> json) =>
    _SearchAuthorInfo(
      authorId: json['AuthorId'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['AuthorId']),
      authorName: json['AuthorName'] as String? ?? '',
      avatar: json['Avatar'] as String? ?? '',
      fansNum: json['FansNum'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['FansNum']),
      audioCount: json['AudioCount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['AudioCount']),
      videoCount: json['VideoCount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['VideoCount']),
      albumCount: json['AlbumCount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['AlbumCount']),
      heat: json['Heat'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Heat']),
      authorStatus: json['AuthorStatus'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['AuthorStatus']),
      isSettledAuthor: json['IsSettledAuthor'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['IsSettledAuthor']),
      userId: json['UserId'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['UserId']),
      complexSongName: json['ComplexSongName'] as String? ?? '',
      algPath: json['AlgPath'] as String? ?? '',
      auxiliary: json['Auxiliary'] as String? ?? '',
    );

Map<String, dynamic> _$SearchAuthorInfoToJson(
  _SearchAuthorInfo instance,
) => <String, dynamic>{
  'AuthorId': const IntFromStringConverter().toJson(instance.authorId),
  'AuthorName': instance.authorName,
  'Avatar': instance.avatar,
  'FansNum': const IntFromStringConverter().toJson(instance.fansNum),
  'AudioCount': const IntFromStringConverter().toJson(instance.audioCount),
  'VideoCount': const IntFromStringConverter().toJson(instance.videoCount),
  'AlbumCount': const IntFromStringConverter().toJson(instance.albumCount),
  'Heat': const IntFromStringConverter().toJson(instance.heat),
  'AuthorStatus': const IntFromStringConverter().toJson(instance.authorStatus),
  'IsSettledAuthor': const IntFromStringConverter().toJson(
    instance.isSettledAuthor,
  ),
  'UserId': const IntFromStringConverter().toJson(instance.userId),
  'ComplexSongName': instance.complexSongName,
  'AlgPath': instance.algPath,
  'Auxiliary': instance.auxiliary,
};

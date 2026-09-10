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
      firstFrameImage: json['FirstFrameImage'] as String? ?? '',
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
      lyricistCount: json['LyricistCount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['LyricistCount']),
      composerCount: json['ComposerCount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['ComposerCount']),
      heat: json['Heat'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Heat']),
      identity: json['Identity'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Identity']),
      isReal: json['IsReal'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['IsReal']),
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
  'FirstFrameImage': instance.firstFrameImage,
  'FansNum': const IntFromStringConverter().toJson(instance.fansNum),
  'AudioCount': const IntFromStringConverter().toJson(instance.audioCount),
  'VideoCount': const IntFromStringConverter().toJson(instance.videoCount),
  'AlbumCount': const IntFromStringConverter().toJson(instance.albumCount),
  'LyricistCount': const IntFromStringConverter().toJson(
    instance.lyricistCount,
  ),
  'ComposerCount': const IntFromStringConverter().toJson(
    instance.composerCount,
  ),
  'Heat': const IntFromStringConverter().toJson(instance.heat),
  'Identity': const IntFromStringConverter().toJson(instance.identity),
  'IsReal': const IntFromStringConverter().toJson(instance.isReal),
  'AuthorStatus': const IntFromStringConverter().toJson(instance.authorStatus),
  'IsSettledAuthor': const IntFromStringConverter().toJson(
    instance.isSettledAuthor,
  ),
  'UserId': const IntFromStringConverter().toJson(instance.userId),
  'ComplexSongName': instance.complexSongName,
  'AlgPath': instance.algPath,
  'Auxiliary': instance.auxiliary,
};

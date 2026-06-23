// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Song _$SongFromJson(Map<String, dynamic> json) => _Song(
  songid: (json['songid'] as num).toInt(),
  songname: json['songname'] as String,
  hash: json['hash'] as String,
  authorName: json['author_name'] as String,
  albumId: json['album_id'],
  albumName: json['album_name'] as String?,
  timeLength: (json['time_length'] as num).toInt(),
  publishDate: json['publish_date'] as String,
  singerinfo:
      (json['singerinfo'] as List<dynamic>?)
          ?.map((e) => SingerInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  coverUrl: json['sizable_cover'] as String,
  fileSize: (json['file_size'] as num).toInt(),
);

Map<String, dynamic> _$SongToJson(_Song instance) => <String, dynamic>{
  'songid': instance.songid,
  'songname': instance.songname,
  'hash': instance.hash,
  'author_name': instance.authorName,
  'album_id': instance.albumId,
  'album_name': instance.albumName,
  'time_length': instance.timeLength,
  'publish_date': instance.publishDate,
  'singerinfo': instance.singerinfo,
  'tags': instance.tags,
  'sizable_cover': instance.coverUrl,
  'file_size': instance.fileSize,
};

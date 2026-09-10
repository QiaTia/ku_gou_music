// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_lyric_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchLyricInfo _$SearchLyricInfoFromJson(Map<String, dynamic> json) =>
    _SearchLyricInfo(
      lyricId: json['LyricID'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['LyricID']),
      songName: json['SongName'] as String? ?? '',
      singerName: json['SingerName'] as String? ?? '',
      fileName: json['FileName'] as String? ?? '',
      fileHash: json['FileHash'] as String? ?? '',
      duration: json['TimeLength'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['TimeLength']),
      bitRate: json['BitRate'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['BitRate']),
      quality: json['Quality'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Quality']),
      fileSize: json['FileSize'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['FileSize']),
      extName: json['ExtName'] as String? ?? '',
      albumId: json['AlbumID'] as String? ?? '',
      image: json['Image'] as String? ?? '',
      lyric: json['Lyric'] as String? ?? '',
      hqHash: json['320Hash'] as String? ?? '',
      sqHash: json['SQHash'] as String? ?? '',
      sqSize: json['SQSize'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['SQSize']),
      hasMv: json['HasMv'] as bool? ?? false,
      mvHash: json['MvHash'] as String? ?? '',
      privilege: json['Privilege'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Privilege']),
      mixSongId: json['MixSongID'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['MixSongID']),
      singers:
          (json['Singers'] as List<dynamic>?)
              ?.map((e) => SearchSinger.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchLyricInfoToJson(_SearchLyricInfo instance) =>
    <String, dynamic>{
      'LyricID': const IntFromStringConverter().toJson(instance.lyricId),
      'SongName': instance.songName,
      'SingerName': instance.singerName,
      'FileName': instance.fileName,
      'FileHash': instance.fileHash,
      'TimeLength': const IntFromStringConverter().toJson(instance.duration),
      'BitRate': const IntFromStringConverter().toJson(instance.bitRate),
      'Quality': const IntFromStringConverter().toJson(instance.quality),
      'FileSize': const IntFromStringConverter().toJson(instance.fileSize),
      'ExtName': instance.extName,
      'AlbumID': instance.albumId,
      'Image': instance.image,
      'Lyric': instance.lyric,
      '320Hash': instance.hqHash,
      'SQHash': instance.sqHash,
      'SQSize': const IntFromStringConverter().toJson(instance.sqSize),
      'HasMv': instance.hasMv,
      'MvHash': instance.mvHash,
      'Privilege': const IntFromStringConverter().toJson(instance.privilege),
      'MixSongID': const IntFromStringConverter().toJson(instance.mixSongId),
      'Singers': instance.singers,
    };

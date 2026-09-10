// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_song_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchSongInfo _$SearchSongInfoFromJson(Map<String, dynamic> json) =>
    _SearchSongInfo(
      id: json['ID'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['ID']),
      songName: json['SongName'] as String? ?? '',
      singerName: json['SingerName'] as String? ?? '',
      fileHash: json['FileHash'] as String? ?? '',
      duration: json['Duration'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Duration']),
      image: json['Image'] as String? ?? '',
      albumId: json['AlbumID'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['AlbumID']),
      eAlbumId: json['EAlbumID'] as String? ?? '',
      albumName: json['AlbumName'] as String? ?? '',
      qualityLevel: json['QualityLevel'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['QualityLevel']),
      isOriginal: json['IsOriginal'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['IsOriginal']),
      fileSize: json['FileSize'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['FileSize']),
      sqFileHash: json['SQFileHash'] as String? ?? '',
      sqFileSize: json['SQFileSize'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['SQFileSize']),
      hqFileHash: json['HQFileHash'] as String? ?? '',
      hqFileSize: json['HQFileSize'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['HQFileSize']),
      privilege: json['Privilege'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Privilege']),
      publishDate: json['PublishDate'] as String? ?? '',
      tagContent: json['TagContent'] as String? ?? '',
      songLabel: json['SongLabel'] as String? ?? '',
      fileName: json['FileName'] as String? ?? '',
      mvHash: json['MvHash'] as String? ?? '',
      oriSongName: json['OriSongName'] as String? ?? '',
      otherName: json['OtherName'] as String? ?? '',
      suffix: json['Suffix'] as String? ?? '',
      singerId:
          (json['SingerId'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      singers:
          (json['Singers'] as List<dynamic>?)
              ?.map((e) => SearchSinger.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      extName: json['ExtName'] as String? ?? '',
      bitrate: json['Bitrate'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Bitrate']),
      payType: json['PayType'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['PayType']),
      price: json['Price'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Price']),
      heatLevel: json['HeatLevel'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['HeatLevel']),
      isPrepublish: json['isPrepublish'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isPrepublish']),
      mixSongId: json['MixSongID'] as String? ?? '',
      eMixSongId: json['EMixSongID'] as String? ?? '',
      ownerCount: json['OwnerCount'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['OwnerCount']),
      hasAlbum: json['HasAlbum'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['HasAlbum']),
    );

Map<String, dynamic> _$SearchSongInfoToJson(
  _SearchSongInfo instance,
) => <String, dynamic>{
  'ID': const IntFromStringConverter().toJson(instance.id),
  'SongName': instance.songName,
  'SingerName': instance.singerName,
  'FileHash': instance.fileHash,
  'Duration': const IntFromStringConverter().toJson(instance.duration),
  'Image': instance.image,
  'AlbumID': const IntFromStringConverter().toJson(instance.albumId),
  'EAlbumID': instance.eAlbumId,
  'AlbumName': instance.albumName,
  'QualityLevel': const IntFromStringConverter().toJson(instance.qualityLevel),
  'IsOriginal': const IntFromStringConverter().toJson(instance.isOriginal),
  'FileSize': const IntFromStringConverter().toJson(instance.fileSize),
  'SQFileHash': instance.sqFileHash,
  'SQFileSize': const IntFromStringConverter().toJson(instance.sqFileSize),
  'HQFileHash': instance.hqFileHash,
  'HQFileSize': const IntFromStringConverter().toJson(instance.hqFileSize),
  'Privilege': const IntFromStringConverter().toJson(instance.privilege),
  'PublishDate': instance.publishDate,
  'TagContent': instance.tagContent,
  'SongLabel': instance.songLabel,
  'FileName': instance.fileName,
  'MvHash': instance.mvHash,
  'OriSongName': instance.oriSongName,
  'OtherName': instance.otherName,
  'Suffix': instance.suffix,
  'SingerId': instance.singerId,
  'Singers': instance.singers,
  'ExtName': instance.extName,
  'Bitrate': const IntFromStringConverter().toJson(instance.bitrate),
  'PayType': const IntFromStringConverter().toJson(instance.payType),
  'Price': const IntFromStringConverter().toJson(instance.price),
  'HeatLevel': const IntFromStringConverter().toJson(instance.heatLevel),
  'isPrepublish': const IntFromStringConverter().toJson(instance.isPrepublish),
  'MixSongID': instance.mixSongId,
  'EMixSongID': instance.eMixSongId,
  'OwnerCount': const IntFromStringConverter().toJson(instance.ownerCount),
  'HasAlbum': const IntFromStringConverter().toJson(instance.hasAlbum),
};

_SearchSinger _$SearchSingerFromJson(Map<String, dynamic> json) =>
    _SearchSinger(
      name: json['name'] as String? ?? '',
      id: json['id'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['id']),
      ipId: json['ip_id'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['ip_id']),
    );

Map<String, dynamic> _$SearchSingerToJson(_SearchSinger instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': const IntFromStringConverter().toJson(instance.id),
      'ip_id': const IntFromStringConverter().toJson(instance.ipId),
    };

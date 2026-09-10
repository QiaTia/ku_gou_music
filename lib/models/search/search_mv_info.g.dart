// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mv_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchMvInfo _$SearchMvInfoFromJson(Map<String, dynamic> json) =>
    _SearchMvInfo(
      mvId: json['MvID'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['MvID']),
      mvName: json['MvName'] as String? ?? '',
      fileName: json['FileName'] as String? ?? '',
      singerName: json['SingerName'] as String? ?? '',
      mvHash: json['MvHash'] as String? ?? '',
      audioId: json['AudioID'] as String? ?? '',
      eMvId: json['EMvID'] as String? ?? '',
      pic: json['Pic'] as String? ?? '',
      erectPic: json['ErectPic'] as String? ?? '',
      thumbGif: json['ThumbGif'] as String? ?? '',
      thumbMp4: json['ThumbMp4'] as String? ?? '',
      duration: json['Duration'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Duration']),
      publishDate: json['PublishDate'] as String? ?? '',
      mvHot: json['MvHot'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['MvHot']),
      historyHeat: json['HistoryHeat'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['HistoryHeat']),
      isOfficial: json['IsOfficial'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['IsOfficial']),
      isUgc: json['IsUgc'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['IsUgc']),
      isShort: json['Isshort'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Isshort']),
      mvHashMark: json['MvHashMark'] as String? ?? '',
      privilege: json['Privilege'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['Privilege']),
      fileHash: json['FileHash'] as String? ?? '',
      mixSongId: json['MixSongID'] as String? ?? '',
      albumId: json['AlbumID'] as String? ?? '',
      singerId:
          (json['SingerID'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      singers:
          (json['Singers'] as List<dynamic>?)
              ?.map((e) => SearchSinger.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchMvInfoToJson(
  _SearchMvInfo instance,
) => <String, dynamic>{
  'MvID': const IntFromStringConverter().toJson(instance.mvId),
  'MvName': instance.mvName,
  'FileName': instance.fileName,
  'SingerName': instance.singerName,
  'MvHash': instance.mvHash,
  'AudioID': instance.audioId,
  'EMvID': instance.eMvId,
  'Pic': instance.pic,
  'ErectPic': instance.erectPic,
  'ThumbGif': instance.thumbGif,
  'ThumbMp4': instance.thumbMp4,
  'Duration': const IntFromStringConverter().toJson(instance.duration),
  'PublishDate': instance.publishDate,
  'MvHot': const IntFromStringConverter().toJson(instance.mvHot),
  'HistoryHeat': const IntFromStringConverter().toJson(instance.historyHeat),
  'IsOfficial': const IntFromStringConverter().toJson(instance.isOfficial),
  'IsUgc': const IntFromStringConverter().toJson(instance.isUgc),
  'Isshort': const IntFromStringConverter().toJson(instance.isShort),
  'MvHashMark': instance.mvHashMark,
  'Privilege': const IntFromStringConverter().toJson(instance.privilege),
  'FileHash': instance.fileHash,
  'MixSongID': instance.mixSongId,
  'AlbumID': instance.albumId,
  'SingerID': instance.singerId,
  'Singers': instance.singers,
};

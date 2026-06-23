// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecommendResponse _$RecommendResponseFromJson(Map<String, dynamic> json) =>
    _RecommendResponse(
      sign: json['sign'] as String,
      songListSize: (json['song_list_size'] as num).toInt(),
      songList:
          (json['song_list'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecommendResponseToJson(_RecommendResponse instance) =>
    <String, dynamic>{
      'sign': instance.sign,
      'song_list_size': instance.songListSize,
      'song_list': instance.songList,
    };

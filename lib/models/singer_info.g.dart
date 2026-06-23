// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SingerInfo _$SingerInfoFromJson(Map<String, dynamic> json) => _SingerInfo(
  name: json['name'] as String,
  isPublish: (json['is_publish'] as num).toInt(),
  id: json['id'] as Object,
);

Map<String, dynamic> _$SingerInfoToJson(_SingerInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'is_publish': instance.isPublish,
      'id': instance.id,
    };

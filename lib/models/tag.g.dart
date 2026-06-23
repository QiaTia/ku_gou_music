// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tag _$TagFromJson(Map<String, dynamic> json) => _Tag(
  tagId: const IntFromStringConverter().fromJson(json['tag_id']),
  parentId: const IntFromStringConverter().fromJson(json['parent_id']),
  tagName: json['tag_name'] as String,
  son: (json['son'] as List<dynamic>?)
      ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
  'tag_id': const IntFromStringConverter().toJson(instance.tagId),
  'parent_id': _$JsonConverterToJson<dynamic, int>(
    instance.parentId,
    const IntFromStringConverter().toJson,
  ),
  'tag_name': instance.tagName,
  'son': instance.son,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

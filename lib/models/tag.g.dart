// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tag _$TagFromJson(Map<String, dynamic> json) => _Tag(
  tagId: json['tag_id'] as String,
  parentId: json['parent_id'] as String?,
  tagName: json['tag_name'] as String,
);

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
  'tag_id': instance.tagId,
  'parent_id': instance.parentId,
  'tag_name': instance.tagName,
};

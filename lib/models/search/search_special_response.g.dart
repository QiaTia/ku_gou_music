// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_special_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchSpecialResponse _$SearchSpecialResponseFromJson(
  Map<String, dynamic> json,
) => _SearchSpecialResponse(
  lists:
      (json['lists'] as List<dynamic>?)
          ?.map((e) => SearchSpecialInfo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: json['total'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['total']),
  page: json['page'] == null
      ? 1
      : const IntFromStringConverter().fromJson(json['page']),
  pagesize: json['pagesize'] == null
      ? 30
      : const IntFromStringConverter().fromJson(json['pagesize']),
);

Map<String, dynamic> _$SearchSpecialResponseToJson(
  _SearchSpecialResponse instance,
) => <String, dynamic>{
  'lists': instance.lists,
  'total': const IntFromStringConverter().toJson(instance.total),
  'page': const IntFromStringConverter().toJson(instance.page),
  'pagesize': const IntFromStringConverter().toJson(instance.pagesize),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_mv_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchMvResponse _$SearchMvResponseFromJson(Map<String, dynamic> json) =>
    _SearchMvResponse(
      lists:
          (json['lists'] as List<dynamic>?)
              ?.map((e) => SearchMvInfo.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$SearchMvResponseToJson(_SearchMvResponse instance) =>
    <String, dynamic>{
      'lists': instance.lists,
      'total': const IntFromStringConverter().toJson(instance.total),
      'page': const IntFromStringConverter().toJson(instance.page),
      'pagesize': const IntFromStringConverter().toJson(instance.pagesize),
    };

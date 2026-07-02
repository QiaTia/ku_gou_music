// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_complex_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchComplexResponse _$SearchComplexResponseFromJson(
  Map<String, dynamic> json,
) => _SearchComplexResponse(
  lists:
      (json['lists'] as List<dynamic>?)
          ?.map((e) => SearchComplexGroup.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  correctionTip: json['correctiontip'] as String? ?? '',
);

Map<String, dynamic> _$SearchComplexResponseToJson(
  _SearchComplexResponse instance,
) => <String, dynamic>{
  'lists': instance.lists,
  'correctiontip': instance.correctionTip,
};

_SearchComplexGroup _$SearchComplexGroupFromJson(Map<String, dynamic> json) =>
    _SearchComplexGroup(
      type: json['type'] as String? ?? '',
      total: json['total'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['total']),
      lists: json['lists'] as List<dynamic>? ?? const [],
      allowErr: json['allowerr'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['allowerr']),
      isShareResult: json['isshareresult'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isshareresult']),
      index: json['index'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['index']),
      secTagInfo: json['sectag_info'] as Map<String, dynamic>? ?? const {},
      isTagResult: json['istagresult'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['istagresult']),
      isTag: json['istag'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['istag']),
      secAggre: json['sec_aggre'] as List<dynamic>? ?? const [],
      secAggreV2: json['sec_aggre_v2'] as List<dynamic>? ?? const [],
      theme: json['theme'] as Map<String, dynamic>? ?? const {},
      hash: json['hash'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$SearchComplexGroupToJson(
  _SearchComplexGroup instance,
) => <String, dynamic>{
  'type': instance.type,
  'total': const IntFromStringConverter().toJson(instance.total),
  'lists': instance.lists,
  'allowerr': const IntFromStringConverter().toJson(instance.allowErr),
  'isshareresult': const IntFromStringConverter().toJson(
    instance.isShareResult,
  ),
  'index': const IntFromStringConverter().toJson(instance.index),
  'sectag_info': instance.secTagInfo,
  'istagresult': const IntFromStringConverter().toJson(instance.isTagResult),
  'istag': const IntFromStringConverter().toJson(instance.isTag),
  'sec_aggre': instance.secAggre,
  'sec_aggre_v2': instance.secAggreV2,
  'theme': instance.theme,
  'hash': instance.hash,
  'title': instance.title,
};

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
      lists:
          (json['lists'] as List<dynamic>?)
              ?.map((e) => SearchSongInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allowErr: json['allowerr'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['allowerr']),
      isShareResult: json['isshareresult'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['isshareresult']),
      index: json['index'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['index']),
    );

Map<String, dynamic> _$SearchComplexGroupToJson(_SearchComplexGroup instance) =>
    <String, dynamic>{
      'type': instance.type,
      'total': const IntFromStringConverter().toJson(instance.total),
      'lists': instance.lists,
      'allowerr': const IntFromStringConverter().toJson(instance.allowErr),
      'isshareresult': const IntFromStringConverter().toJson(
        instance.isShareResult,
      ),
      'index': const IntFromStringConverter().toJson(instance.index),
    };

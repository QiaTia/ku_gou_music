// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fx_medal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FxMedal _$FxMedalFromJson(Map<String, dynamic> json) => _FxMedal(
  vipLevel: json['vipLevel'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['vipLevel']),
  richLevel: json['richLevel'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['richLevel']),
  starLevel: json['starLevel'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['starLevel']),
);

Map<String, dynamic> _$FxMedalToJson(_FxMedal instance) => <String, dynamic>{
  'vipLevel': const IntFromStringConverter().toJson(instance.vipLevel),
  'richLevel': const IntFromStringConverter().toJson(instance.richLevel),
  'starLevel': const IntFromStringConverter().toJson(instance.starLevel),
};

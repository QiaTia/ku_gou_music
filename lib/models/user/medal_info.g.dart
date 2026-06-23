// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MedalInfo _$MedalInfoFromJson(Map<String, dynamic> json) => _MedalInfo(
  ktv: json['ktv'] == null
      ? const KtvMedal()
      : KtvMedal.fromJson(json['ktv'] as Map<String, dynamic>),
  fx: json['fx'] == null
      ? const FxMedal()
      : FxMedal.fromJson(json['fx'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MedalInfoToJson(_MedalInfo instance) =>
    <String, dynamic>{'ktv': instance.ktv, 'fx': instance.fx};

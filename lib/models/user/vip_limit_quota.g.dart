// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_limit_quota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VipLimitQuota _$VipLimitQuotaFromJson(Map<String, dynamic> json) =>
    _VipLimitQuota(
      total: json['total'] == null
          ? 0
          : const IntFromStringConverter().fromJson(json['total']),
    );

Map<String, dynamic> _$VipLimitQuotaToJson(_VipLimitQuota instance) =>
    <String, dynamic>{
      'total': const IntFromStringConverter().toJson(instance.total),
    };

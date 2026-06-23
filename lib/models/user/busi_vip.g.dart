// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'busi_vip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusiVip _$BusiVipFromJson(Map<String, dynamic> json) => _BusiVip(
  isVip: json['is_vip'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['is_vip']),
  purchasedIosType: json['purchased_ios_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['purchased_ios_type']),
  purchasedType: json['purchased_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['purchased_type']),
  isPaidVip: json['is_paid_vip'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['is_paid_vip']),
  vipClearday: json['vip_clearday'] as String? ?? '',
  latestProductId: json['latest_product_id'] as String? ?? '',
  productType: json['product_type'] as String? ?? '',
  vipBeginTime: json['vip_begin_time'] as String? ?? '',
  yType: json['y_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['y_type']),
  vipEndTime: json['vip_end_time'] as String? ?? '',
  userid: json['userid'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['userid']),
  vipLimitQuota: json['vip_limit_quota'] == null
      ? const VipLimitQuota()
      : VipLimitQuota.fromJson(json['vip_limit_quota'] as Map<String, dynamic>),
  paidVipExpireTime: json['paid_vip_expire_time'] as String? ?? '',
  busiType: json['busi_type'] as String? ?? '',
);

Map<String, dynamic> _$BusiVipToJson(_BusiVip instance) => <String, dynamic>{
  'is_vip': const IntFromStringConverter().toJson(instance.isVip),
  'purchased_ios_type': const IntFromStringConverter().toJson(
    instance.purchasedIosType,
  ),
  'purchased_type': const IntFromStringConverter().toJson(
    instance.purchasedType,
  ),
  'is_paid_vip': const IntFromStringConverter().toJson(instance.isPaidVip),
  'vip_clearday': instance.vipClearday,
  'latest_product_id': instance.latestProductId,
  'product_type': instance.productType,
  'vip_begin_time': instance.vipBeginTime,
  'y_type': const IntFromStringConverter().toJson(instance.yType),
  'vip_end_time': instance.vipEndTime,
  'userid': const IntFromStringConverter().toJson(instance.userid),
  'vip_limit_quota': instance.vipLimitQuota,
  'paid_vip_expire_time': instance.paidVipExpireTime,
  'busi_type': instance.busiType,
};

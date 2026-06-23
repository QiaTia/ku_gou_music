// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VipInfo _$VipInfoFromJson(Map<String, dynamic> json) => _VipInfo(
  isVip: json['is_vip'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['is_vip']),
  roamType: json['roam_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['roam_type']),
  mResetTime: json['m_reset_time'] as String? ?? '',
  mYEndtime: json['m_y_endtime'] as String? ?? '',
  vipClearday: json['vip_clearday'] as String? ?? '',
  vipType: json['vip_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['vip_type']),
  vipBeginTime: json['vip_begin_time'] as String? ?? '',
  roamBeginTime: json['roam_begin_time'] as String? ?? '',
  vipEndTime: json['vip_end_time'] as String? ?? '',
  userid: json['userid'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['userid']),
  vipYEndtime: json['vip_y_endtime'] as String? ?? '',
  mClearday: json['m_clearday'] as String? ?? '',
  svipLevel: json['svip_level'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['svip_level']),
  svipScore: json['svip_score'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['svip_score']),
  suVipClearday: json['su_vip_clearday'] as String? ?? '',
  suVipEndTime: json['su_vip_end_time'] as String? ?? '',
  suVipYEndtime: json['su_vip_y_endtime'] as String? ?? '',
  suVipBeginTime: json['su_vip_begin_time'] as String? ?? '',
  busiVip:
      (json['busi_vip'] as List<dynamic>?)
          ?.map((e) => BusiVip.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  mBeginTime: json['m_begin_time'] as String? ?? '',
  userYType: json['user_y_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['user_y_type']),
  userType: json['user_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['user_type']),
  yType: json['y_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['y_type']),
  mEndTime: json['m_end_time'] as String? ?? '',
  roamEndTime: json['roam_end_time'] as String? ?? '',
  mIsOld: json['m_is_old'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['m_is_old']),
  mType: json['m_type'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['m_type']),
);

Map<String, dynamic> _$VipInfoToJson(_VipInfo instance) => <String, dynamic>{
  'is_vip': const IntFromStringConverter().toJson(instance.isVip),
  'roam_type': const IntFromStringConverter().toJson(instance.roamType),
  'm_reset_time': instance.mResetTime,
  'm_y_endtime': instance.mYEndtime,
  'vip_clearday': instance.vipClearday,
  'vip_type': const IntFromStringConverter().toJson(instance.vipType),
  'vip_begin_time': instance.vipBeginTime,
  'roam_begin_time': instance.roamBeginTime,
  'vip_end_time': instance.vipEndTime,
  'userid': const IntFromStringConverter().toJson(instance.userid),
  'vip_y_endtime': instance.vipYEndtime,
  'm_clearday': instance.mClearday,
  'svip_level': const IntFromStringConverter().toJson(instance.svipLevel),
  'svip_score': const IntFromStringConverter().toJson(instance.svipScore),
  'su_vip_clearday': instance.suVipClearday,
  'su_vip_end_time': instance.suVipEndTime,
  'su_vip_y_endtime': instance.suVipYEndtime,
  'su_vip_begin_time': instance.suVipBeginTime,
  'busi_vip': instance.busiVip,
  'm_begin_time': instance.mBeginTime,
  'user_y_type': const IntFromStringConverter().toJson(instance.userYType),
  'user_type': const IntFromStringConverter().toJson(instance.userType),
  'y_type': const IntFromStringConverter().toJson(instance.yType),
  'm_end_time': instance.mEndTime,
  'roam_end_time': instance.roamEndTime,
  'm_is_old': const IntFromStringConverter().toJson(instance.mIsOld),
  'm_type': const IntFromStringConverter().toJson(instance.mType),
};

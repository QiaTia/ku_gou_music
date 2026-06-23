// models/vip_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../converters/int_from_string_converter.dart';
import 'busi_vip.dart';
part 'vip_info.freezed.dart';
part 'vip_info.g.dart';

@freezed
abstract class VipInfo with _$VipInfo {
  const VipInfo._();

  const factory VipInfo({
    @IntFromStringConverter() @JsonKey(name: 'is_vip') @Default(0) int isVip,
    @IntFromStringConverter()
    @JsonKey(name: 'roam_type')
    @Default(0)
    int roamType,
    @JsonKey(name: 'm_reset_time') @Default('') String mResetTime,
    @JsonKey(name: 'm_y_endtime') @Default('') String mYEndtime,
    @JsonKey(name: 'vip_clearday') @Default('') String vipClearday,
    @IntFromStringConverter()
    @JsonKey(name: 'vip_type')
    @Default(0)
    int vipType,
    @JsonKey(name: 'vip_begin_time') @Default('') String vipBeginTime,
    @JsonKey(name: 'roam_begin_time') @Default('') String roamBeginTime,
    @JsonKey(name: 'vip_end_time') @Default('') String vipEndTime,
    @IntFromStringConverter() @Default(0) int userid,
    @JsonKey(name: 'vip_y_endtime') @Default('') String vipYEndtime,
    @JsonKey(name: 'm_clearday') @Default('') String mClearday,
    @IntFromStringConverter()
    @JsonKey(name: 'svip_level')
    @Default(0)
    int svipLevel,
    @IntFromStringConverter()
    @JsonKey(name: 'svip_score')
    @Default(0)
    int svipScore,
    @JsonKey(name: 'su_vip_clearday') @Default('') String suVipClearday,
    @JsonKey(name: 'su_vip_end_time') @Default('') String suVipEndTime,
    @JsonKey(name: 'su_vip_y_endtime') @Default('') String suVipYEndtime,
    @JsonKey(name: 'su_vip_begin_time') @Default('') String suVipBeginTime,
    @JsonKey(name: 'busi_vip') @Default([]) List<BusiVip> busiVip,
    @JsonKey(name: 'm_begin_time') @Default('') String mBeginTime,
    @IntFromStringConverter()
    @JsonKey(name: 'user_y_type')
    @Default(0)
    int userYType,
    @IntFromStringConverter()
    @JsonKey(name: 'user_type')
    @Default(0)
    int userType,
    @IntFromStringConverter() @JsonKey(name: 'y_type') @Default(0) int yType,
    @JsonKey(name: 'm_end_time') @Default('') String mEndTime,
    @JsonKey(name: 'roam_end_time') @Default('') String roamEndTime,
    @IntFromStringConverter() @JsonKey(name: 'm_is_old') @Default(0) int mIsOld,
    @IntFromStringConverter() @JsonKey(name: 'm_type') @Default(0) int mType,
  }) = _VipInfo;

  factory VipInfo.fromJson(Map<String, dynamic> json) =>
      _$VipInfoFromJson(json);

  // —— 业务便捷 getter ——

  /// 根据 product_type 取对应的业务会员(svip / tvip),找不到返回 null
  BusiVip? busiVipByType(String type) {
    for (final item in busiVip) {
      if (item.productType == type) return item;
    }
    return null;
  }

  /// SVIP 会员信息
  BusiVip? get svip => busiVipByType('svip');

  /// TVIP 会员信息
  BusiVip? get tvip => busiVipByType('tvip');

  /// SVIP 配额总数(总次数),无则 0
  int get svipQuotaTotal => svip?.vipLimitQuota.total ?? 0;

  /// SVIP 是否有效(未过期)
  bool get isSvipValid {
    final s = svip;
    return s != null && s.isVip == 1 && !s.isExpired;
  }
}

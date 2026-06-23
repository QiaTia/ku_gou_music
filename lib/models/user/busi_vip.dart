// models/busi_vip.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../converters/int_from_string_converter.dart';
import 'vip_limit_quota.dart';
part 'busi_vip.freezed.dart';
part 'busi_vip.g.dart';

@freezed
abstract class BusiVip with _$BusiVip {
  const BusiVip._();

  const factory BusiVip({
    @IntFromStringConverter() @JsonKey(name: 'is_vip') @Default(0) int isVip,
    @IntFromStringConverter()
    @JsonKey(name: 'purchased_ios_type')
    @Default(0)
    int purchasedIosType,
    @IntFromStringConverter()
    @JsonKey(name: 'purchased_type')
    @Default(0)
    int purchasedType,
    @IntFromStringConverter()
    @JsonKey(name: 'is_paid_vip')
    @Default(0)
    int isPaidVip,
    @JsonKey(name: 'vip_clearday') @Default('') String vipClearday,
    @JsonKey(name: 'latest_product_id') @Default('') String latestProductId,
    @JsonKey(name: 'product_type') @Default('') String productType,
    @JsonKey(name: 'vip_begin_time') @Default('') String vipBeginTime,
    @IntFromStringConverter() @JsonKey(name: 'y_type') @Default(0) int yType,
    @JsonKey(name: 'vip_end_time') @Default('') String vipEndTime,
    @IntFromStringConverter() @Default(0) int userid,
    @JsonKey(name: 'vip_limit_quota')
    @Default(VipLimitQuota())
    VipLimitQuota vipLimitQuota,
    @JsonKey(name: 'paid_vip_expire_time')
    @Default('')
    String paidVipExpireTime,
    @JsonKey(name: 'busi_type') @Default('') String busiType,
  }) = _BusiVip;

  factory BusiVip.fromJson(Map<String, dynamic> json) =>
      _$BusiVipFromJson(json);

  // —— 便捷 getter ——

  /// 会员到期时间,解析失败返回 null
  DateTime? get endDateTime => _parseTime(vipEndTime);

  /// 是否已过期(以当前时间为准)
  bool get isExpired {
    final end = endDateTime;
    return end == null || end.isBefore(DateTime.now());
  }

  /// 剩余天数(不足一天按一天算,已过期返回 0)
  int get remainingDays {
    final end = endDateTime;
    if (end == null) return 0;
    final diff = end.difference(DateTime.now());
    return diff.isNegative ? 0 : diff.inDays + 1;
  }

  /// 是否为 SVIP
  bool get isSvip => productType == 'svip';
}

/// 解析 "2026-06-25 03:57:59" 这类时间字符串
DateTime? _parseTime(String value) {
  if (value.isEmpty) return null;
  // Dart 的 DateTime.parse 接受空格分隔,这里统一替换成 T 更稳妥
  return DateTime.tryParse(value.replaceAll(' ', 'T'));
}

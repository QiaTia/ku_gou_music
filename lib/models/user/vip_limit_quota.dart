// models/vip_limit_quota.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../converters/int_from_string_converter.dart';
part 'vip_limit_quota.freezed.dart';
part 'vip_limit_quota.g.dart';

@freezed
abstract class VipLimitQuota with _$VipLimitQuota {
  const factory VipLimitQuota({
    @IntFromStringConverter() @Default(0) int total,
  }) = _VipLimitQuota;

  factory VipLimitQuota.fromJson(Map<String, dynamic> json) =>
      _$VipLimitQuotaFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'busi_vip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusiVip {

@IntFromStringConverter()@JsonKey(name: 'is_vip') int get isVip;@IntFromStringConverter()@JsonKey(name: 'purchased_ios_type') int get purchasedIosType;@IntFromStringConverter()@JsonKey(name: 'purchased_type') int get purchasedType;@IntFromStringConverter()@JsonKey(name: 'is_paid_vip') int get isPaidVip;@JsonKey(name: 'vip_clearday') String get vipClearday;@JsonKey(name: 'latest_product_id') String get latestProductId;@JsonKey(name: 'product_type') String get productType;@JsonKey(name: 'vip_begin_time') String get vipBeginTime;@IntFromStringConverter()@JsonKey(name: 'y_type') int get yType;@JsonKey(name: 'vip_end_time') String get vipEndTime;@IntFromStringConverter() int get userid;@JsonKey(name: 'vip_limit_quota') VipLimitQuota get vipLimitQuota;@JsonKey(name: 'paid_vip_expire_time') String get paidVipExpireTime;@JsonKey(name: 'busi_type') String get busiType;
/// Create a copy of BusiVip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusiVipCopyWith<BusiVip> get copyWith => _$BusiVipCopyWithImpl<BusiVip>(this as BusiVip, _$identity);

  /// Serializes this BusiVip to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusiVip&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.purchasedIosType, purchasedIosType) || other.purchasedIosType == purchasedIosType)&&(identical(other.purchasedType, purchasedType) || other.purchasedType == purchasedType)&&(identical(other.isPaidVip, isPaidVip) || other.isPaidVip == isPaidVip)&&(identical(other.vipClearday, vipClearday) || other.vipClearday == vipClearday)&&(identical(other.latestProductId, latestProductId) || other.latestProductId == latestProductId)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.vipBeginTime, vipBeginTime) || other.vipBeginTime == vipBeginTime)&&(identical(other.yType, yType) || other.yType == yType)&&(identical(other.vipEndTime, vipEndTime) || other.vipEndTime == vipEndTime)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.vipLimitQuota, vipLimitQuota) || other.vipLimitQuota == vipLimitQuota)&&(identical(other.paidVipExpireTime, paidVipExpireTime) || other.paidVipExpireTime == paidVipExpireTime)&&(identical(other.busiType, busiType) || other.busiType == busiType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isVip,purchasedIosType,purchasedType,isPaidVip,vipClearday,latestProductId,productType,vipBeginTime,yType,vipEndTime,userid,vipLimitQuota,paidVipExpireTime,busiType);

@override
String toString() {
  return 'BusiVip(isVip: $isVip, purchasedIosType: $purchasedIosType, purchasedType: $purchasedType, isPaidVip: $isPaidVip, vipClearday: $vipClearday, latestProductId: $latestProductId, productType: $productType, vipBeginTime: $vipBeginTime, yType: $yType, vipEndTime: $vipEndTime, userid: $userid, vipLimitQuota: $vipLimitQuota, paidVipExpireTime: $paidVipExpireTime, busiType: $busiType)';
}


}

/// @nodoc
abstract mixin class $BusiVipCopyWith<$Res>  {
  factory $BusiVipCopyWith(BusiVip value, $Res Function(BusiVip) _then) = _$BusiVipCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'is_vip') int isVip,@IntFromStringConverter()@JsonKey(name: 'purchased_ios_type') int purchasedIosType,@IntFromStringConverter()@JsonKey(name: 'purchased_type') int purchasedType,@IntFromStringConverter()@JsonKey(name: 'is_paid_vip') int isPaidVip,@JsonKey(name: 'vip_clearday') String vipClearday,@JsonKey(name: 'latest_product_id') String latestProductId,@JsonKey(name: 'product_type') String productType,@JsonKey(name: 'vip_begin_time') String vipBeginTime,@IntFromStringConverter()@JsonKey(name: 'y_type') int yType,@JsonKey(name: 'vip_end_time') String vipEndTime,@IntFromStringConverter() int userid,@JsonKey(name: 'vip_limit_quota') VipLimitQuota vipLimitQuota,@JsonKey(name: 'paid_vip_expire_time') String paidVipExpireTime,@JsonKey(name: 'busi_type') String busiType
});


$VipLimitQuotaCopyWith<$Res> get vipLimitQuota;

}
/// @nodoc
class _$BusiVipCopyWithImpl<$Res>
    implements $BusiVipCopyWith<$Res> {
  _$BusiVipCopyWithImpl(this._self, this._then);

  final BusiVip _self;
  final $Res Function(BusiVip) _then;

/// Create a copy of BusiVip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isVip = null,Object? purchasedIosType = null,Object? purchasedType = null,Object? isPaidVip = null,Object? vipClearday = null,Object? latestProductId = null,Object? productType = null,Object? vipBeginTime = null,Object? yType = null,Object? vipEndTime = null,Object? userid = null,Object? vipLimitQuota = null,Object? paidVipExpireTime = null,Object? busiType = null,}) {
  return _then(_self.copyWith(
isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,purchasedIosType: null == purchasedIosType ? _self.purchasedIosType : purchasedIosType // ignore: cast_nullable_to_non_nullable
as int,purchasedType: null == purchasedType ? _self.purchasedType : purchasedType // ignore: cast_nullable_to_non_nullable
as int,isPaidVip: null == isPaidVip ? _self.isPaidVip : isPaidVip // ignore: cast_nullable_to_non_nullable
as int,vipClearday: null == vipClearday ? _self.vipClearday : vipClearday // ignore: cast_nullable_to_non_nullable
as String,latestProductId: null == latestProductId ? _self.latestProductId : latestProductId // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,vipBeginTime: null == vipBeginTime ? _self.vipBeginTime : vipBeginTime // ignore: cast_nullable_to_non_nullable
as String,yType: null == yType ? _self.yType : yType // ignore: cast_nullable_to_non_nullable
as int,vipEndTime: null == vipEndTime ? _self.vipEndTime : vipEndTime // ignore: cast_nullable_to_non_nullable
as String,userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as int,vipLimitQuota: null == vipLimitQuota ? _self.vipLimitQuota : vipLimitQuota // ignore: cast_nullable_to_non_nullable
as VipLimitQuota,paidVipExpireTime: null == paidVipExpireTime ? _self.paidVipExpireTime : paidVipExpireTime // ignore: cast_nullable_to_non_nullable
as String,busiType: null == busiType ? _self.busiType : busiType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of BusiVip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VipLimitQuotaCopyWith<$Res> get vipLimitQuota {
  
  return $VipLimitQuotaCopyWith<$Res>(_self.vipLimitQuota, (value) {
    return _then(_self.copyWith(vipLimitQuota: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusiVip].
extension BusiVipPatterns on BusiVip {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusiVip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusiVip() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusiVip value)  $default,){
final _that = this;
switch (_that) {
case _BusiVip():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusiVip value)?  $default,){
final _that = this;
switch (_that) {
case _BusiVip() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'is_vip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'purchased_ios_type')  int purchasedIosType, @IntFromStringConverter()@JsonKey(name: 'purchased_type')  int purchasedType, @IntFromStringConverter()@JsonKey(name: 'is_paid_vip')  int isPaidVip, @JsonKey(name: 'vip_clearday')  String vipClearday, @JsonKey(name: 'latest_product_id')  String latestProductId, @JsonKey(name: 'product_type')  String productType, @JsonKey(name: 'vip_begin_time')  String vipBeginTime, @IntFromStringConverter()@JsonKey(name: 'y_type')  int yType, @JsonKey(name: 'vip_end_time')  String vipEndTime, @IntFromStringConverter()  int userid, @JsonKey(name: 'vip_limit_quota')  VipLimitQuota vipLimitQuota, @JsonKey(name: 'paid_vip_expire_time')  String paidVipExpireTime, @JsonKey(name: 'busi_type')  String busiType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusiVip() when $default != null:
return $default(_that.isVip,_that.purchasedIosType,_that.purchasedType,_that.isPaidVip,_that.vipClearday,_that.latestProductId,_that.productType,_that.vipBeginTime,_that.yType,_that.vipEndTime,_that.userid,_that.vipLimitQuota,_that.paidVipExpireTime,_that.busiType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'is_vip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'purchased_ios_type')  int purchasedIosType, @IntFromStringConverter()@JsonKey(name: 'purchased_type')  int purchasedType, @IntFromStringConverter()@JsonKey(name: 'is_paid_vip')  int isPaidVip, @JsonKey(name: 'vip_clearday')  String vipClearday, @JsonKey(name: 'latest_product_id')  String latestProductId, @JsonKey(name: 'product_type')  String productType, @JsonKey(name: 'vip_begin_time')  String vipBeginTime, @IntFromStringConverter()@JsonKey(name: 'y_type')  int yType, @JsonKey(name: 'vip_end_time')  String vipEndTime, @IntFromStringConverter()  int userid, @JsonKey(name: 'vip_limit_quota')  VipLimitQuota vipLimitQuota, @JsonKey(name: 'paid_vip_expire_time')  String paidVipExpireTime, @JsonKey(name: 'busi_type')  String busiType)  $default,) {final _that = this;
switch (_that) {
case _BusiVip():
return $default(_that.isVip,_that.purchasedIosType,_that.purchasedType,_that.isPaidVip,_that.vipClearday,_that.latestProductId,_that.productType,_that.vipBeginTime,_that.yType,_that.vipEndTime,_that.userid,_that.vipLimitQuota,_that.paidVipExpireTime,_that.busiType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'is_vip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'purchased_ios_type')  int purchasedIosType, @IntFromStringConverter()@JsonKey(name: 'purchased_type')  int purchasedType, @IntFromStringConverter()@JsonKey(name: 'is_paid_vip')  int isPaidVip, @JsonKey(name: 'vip_clearday')  String vipClearday, @JsonKey(name: 'latest_product_id')  String latestProductId, @JsonKey(name: 'product_type')  String productType, @JsonKey(name: 'vip_begin_time')  String vipBeginTime, @IntFromStringConverter()@JsonKey(name: 'y_type')  int yType, @JsonKey(name: 'vip_end_time')  String vipEndTime, @IntFromStringConverter()  int userid, @JsonKey(name: 'vip_limit_quota')  VipLimitQuota vipLimitQuota, @JsonKey(name: 'paid_vip_expire_time')  String paidVipExpireTime, @JsonKey(name: 'busi_type')  String busiType)?  $default,) {final _that = this;
switch (_that) {
case _BusiVip() when $default != null:
return $default(_that.isVip,_that.purchasedIosType,_that.purchasedType,_that.isPaidVip,_that.vipClearday,_that.latestProductId,_that.productType,_that.vipBeginTime,_that.yType,_that.vipEndTime,_that.userid,_that.vipLimitQuota,_that.paidVipExpireTime,_that.busiType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusiVip extends BusiVip {
  const _BusiVip({@IntFromStringConverter()@JsonKey(name: 'is_vip') this.isVip = 0, @IntFromStringConverter()@JsonKey(name: 'purchased_ios_type') this.purchasedIosType = 0, @IntFromStringConverter()@JsonKey(name: 'purchased_type') this.purchasedType = 0, @IntFromStringConverter()@JsonKey(name: 'is_paid_vip') this.isPaidVip = 0, @JsonKey(name: 'vip_clearday') this.vipClearday = '', @JsonKey(name: 'latest_product_id') this.latestProductId = '', @JsonKey(name: 'product_type') this.productType = '', @JsonKey(name: 'vip_begin_time') this.vipBeginTime = '', @IntFromStringConverter()@JsonKey(name: 'y_type') this.yType = 0, @JsonKey(name: 'vip_end_time') this.vipEndTime = '', @IntFromStringConverter() this.userid = 0, @JsonKey(name: 'vip_limit_quota') this.vipLimitQuota = const VipLimitQuota(), @JsonKey(name: 'paid_vip_expire_time') this.paidVipExpireTime = '', @JsonKey(name: 'busi_type') this.busiType = ''}): super._();
  factory _BusiVip.fromJson(Map<String, dynamic> json) => _$BusiVipFromJson(json);

@override@IntFromStringConverter()@JsonKey(name: 'is_vip') final  int isVip;
@override@IntFromStringConverter()@JsonKey(name: 'purchased_ios_type') final  int purchasedIosType;
@override@IntFromStringConverter()@JsonKey(name: 'purchased_type') final  int purchasedType;
@override@IntFromStringConverter()@JsonKey(name: 'is_paid_vip') final  int isPaidVip;
@override@JsonKey(name: 'vip_clearday') final  String vipClearday;
@override@JsonKey(name: 'latest_product_id') final  String latestProductId;
@override@JsonKey(name: 'product_type') final  String productType;
@override@JsonKey(name: 'vip_begin_time') final  String vipBeginTime;
@override@IntFromStringConverter()@JsonKey(name: 'y_type') final  int yType;
@override@JsonKey(name: 'vip_end_time') final  String vipEndTime;
@override@JsonKey()@IntFromStringConverter() final  int userid;
@override@JsonKey(name: 'vip_limit_quota') final  VipLimitQuota vipLimitQuota;
@override@JsonKey(name: 'paid_vip_expire_time') final  String paidVipExpireTime;
@override@JsonKey(name: 'busi_type') final  String busiType;

/// Create a copy of BusiVip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusiVipCopyWith<_BusiVip> get copyWith => __$BusiVipCopyWithImpl<_BusiVip>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusiVipToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusiVip&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.purchasedIosType, purchasedIosType) || other.purchasedIosType == purchasedIosType)&&(identical(other.purchasedType, purchasedType) || other.purchasedType == purchasedType)&&(identical(other.isPaidVip, isPaidVip) || other.isPaidVip == isPaidVip)&&(identical(other.vipClearday, vipClearday) || other.vipClearday == vipClearday)&&(identical(other.latestProductId, latestProductId) || other.latestProductId == latestProductId)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.vipBeginTime, vipBeginTime) || other.vipBeginTime == vipBeginTime)&&(identical(other.yType, yType) || other.yType == yType)&&(identical(other.vipEndTime, vipEndTime) || other.vipEndTime == vipEndTime)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.vipLimitQuota, vipLimitQuota) || other.vipLimitQuota == vipLimitQuota)&&(identical(other.paidVipExpireTime, paidVipExpireTime) || other.paidVipExpireTime == paidVipExpireTime)&&(identical(other.busiType, busiType) || other.busiType == busiType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isVip,purchasedIosType,purchasedType,isPaidVip,vipClearday,latestProductId,productType,vipBeginTime,yType,vipEndTime,userid,vipLimitQuota,paidVipExpireTime,busiType);

@override
String toString() {
  return 'BusiVip(isVip: $isVip, purchasedIosType: $purchasedIosType, purchasedType: $purchasedType, isPaidVip: $isPaidVip, vipClearday: $vipClearday, latestProductId: $latestProductId, productType: $productType, vipBeginTime: $vipBeginTime, yType: $yType, vipEndTime: $vipEndTime, userid: $userid, vipLimitQuota: $vipLimitQuota, paidVipExpireTime: $paidVipExpireTime, busiType: $busiType)';
}


}

/// @nodoc
abstract mixin class _$BusiVipCopyWith<$Res> implements $BusiVipCopyWith<$Res> {
  factory _$BusiVipCopyWith(_BusiVip value, $Res Function(_BusiVip) _then) = __$BusiVipCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'is_vip') int isVip,@IntFromStringConverter()@JsonKey(name: 'purchased_ios_type') int purchasedIosType,@IntFromStringConverter()@JsonKey(name: 'purchased_type') int purchasedType,@IntFromStringConverter()@JsonKey(name: 'is_paid_vip') int isPaidVip,@JsonKey(name: 'vip_clearday') String vipClearday,@JsonKey(name: 'latest_product_id') String latestProductId,@JsonKey(name: 'product_type') String productType,@JsonKey(name: 'vip_begin_time') String vipBeginTime,@IntFromStringConverter()@JsonKey(name: 'y_type') int yType,@JsonKey(name: 'vip_end_time') String vipEndTime,@IntFromStringConverter() int userid,@JsonKey(name: 'vip_limit_quota') VipLimitQuota vipLimitQuota,@JsonKey(name: 'paid_vip_expire_time') String paidVipExpireTime,@JsonKey(name: 'busi_type') String busiType
});


@override $VipLimitQuotaCopyWith<$Res> get vipLimitQuota;

}
/// @nodoc
class __$BusiVipCopyWithImpl<$Res>
    implements _$BusiVipCopyWith<$Res> {
  __$BusiVipCopyWithImpl(this._self, this._then);

  final _BusiVip _self;
  final $Res Function(_BusiVip) _then;

/// Create a copy of BusiVip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isVip = null,Object? purchasedIosType = null,Object? purchasedType = null,Object? isPaidVip = null,Object? vipClearday = null,Object? latestProductId = null,Object? productType = null,Object? vipBeginTime = null,Object? yType = null,Object? vipEndTime = null,Object? userid = null,Object? vipLimitQuota = null,Object? paidVipExpireTime = null,Object? busiType = null,}) {
  return _then(_BusiVip(
isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,purchasedIosType: null == purchasedIosType ? _self.purchasedIosType : purchasedIosType // ignore: cast_nullable_to_non_nullable
as int,purchasedType: null == purchasedType ? _self.purchasedType : purchasedType // ignore: cast_nullable_to_non_nullable
as int,isPaidVip: null == isPaidVip ? _self.isPaidVip : isPaidVip // ignore: cast_nullable_to_non_nullable
as int,vipClearday: null == vipClearday ? _self.vipClearday : vipClearday // ignore: cast_nullable_to_non_nullable
as String,latestProductId: null == latestProductId ? _self.latestProductId : latestProductId // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,vipBeginTime: null == vipBeginTime ? _self.vipBeginTime : vipBeginTime // ignore: cast_nullable_to_non_nullable
as String,yType: null == yType ? _self.yType : yType // ignore: cast_nullable_to_non_nullable
as int,vipEndTime: null == vipEndTime ? _self.vipEndTime : vipEndTime // ignore: cast_nullable_to_non_nullable
as String,userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as int,vipLimitQuota: null == vipLimitQuota ? _self.vipLimitQuota : vipLimitQuota // ignore: cast_nullable_to_non_nullable
as VipLimitQuota,paidVipExpireTime: null == paidVipExpireTime ? _self.paidVipExpireTime : paidVipExpireTime // ignore: cast_nullable_to_non_nullable
as String,busiType: null == busiType ? _self.busiType : busiType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of BusiVip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VipLimitQuotaCopyWith<$Res> get vipLimitQuota {
  
  return $VipLimitQuotaCopyWith<$Res>(_self.vipLimitQuota, (value) {
    return _then(_self.copyWith(vipLimitQuota: value));
  });
}
}

// dart format on

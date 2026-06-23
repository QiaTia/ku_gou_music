// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vip_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VipInfo {

@IntFromStringConverter()@JsonKey(name: 'is_vip') int get isVip;@IntFromStringConverter()@JsonKey(name: 'roam_type') int get roamType;@JsonKey(name: 'm_reset_time') String get mResetTime;@JsonKey(name: 'm_y_endtime') String get mYEndtime;@JsonKey(name: 'vip_clearday') String get vipClearday;@IntFromStringConverter()@JsonKey(name: 'vip_type') int get vipType;@JsonKey(name: 'vip_begin_time') String get vipBeginTime;@JsonKey(name: 'roam_begin_time') String get roamBeginTime;@JsonKey(name: 'vip_end_time') String get vipEndTime;@IntFromStringConverter() int get userid;@JsonKey(name: 'vip_y_endtime') String get vipYEndtime;@JsonKey(name: 'm_clearday') String get mClearday;@IntFromStringConverter()@JsonKey(name: 'svip_level') int get svipLevel;@IntFromStringConverter()@JsonKey(name: 'svip_score') int get svipScore;@JsonKey(name: 'su_vip_clearday') String get suVipClearday;@JsonKey(name: 'su_vip_end_time') String get suVipEndTime;@JsonKey(name: 'su_vip_y_endtime') String get suVipYEndtime;@JsonKey(name: 'su_vip_begin_time') String get suVipBeginTime;@JsonKey(name: 'busi_vip') List<BusiVip> get busiVip;@JsonKey(name: 'm_begin_time') String get mBeginTime;@IntFromStringConverter()@JsonKey(name: 'user_y_type') int get userYType;@IntFromStringConverter()@JsonKey(name: 'user_type') int get userType;@IntFromStringConverter()@JsonKey(name: 'y_type') int get yType;@JsonKey(name: 'm_end_time') String get mEndTime;@JsonKey(name: 'roam_end_time') String get roamEndTime;@IntFromStringConverter()@JsonKey(name: 'm_is_old') int get mIsOld;@IntFromStringConverter()@JsonKey(name: 'm_type') int get mType;
/// Create a copy of VipInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VipInfoCopyWith<VipInfo> get copyWith => _$VipInfoCopyWithImpl<VipInfo>(this as VipInfo, _$identity);

  /// Serializes this VipInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VipInfo&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.roamType, roamType) || other.roamType == roamType)&&(identical(other.mResetTime, mResetTime) || other.mResetTime == mResetTime)&&(identical(other.mYEndtime, mYEndtime) || other.mYEndtime == mYEndtime)&&(identical(other.vipClearday, vipClearday) || other.vipClearday == vipClearday)&&(identical(other.vipType, vipType) || other.vipType == vipType)&&(identical(other.vipBeginTime, vipBeginTime) || other.vipBeginTime == vipBeginTime)&&(identical(other.roamBeginTime, roamBeginTime) || other.roamBeginTime == roamBeginTime)&&(identical(other.vipEndTime, vipEndTime) || other.vipEndTime == vipEndTime)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.vipYEndtime, vipYEndtime) || other.vipYEndtime == vipYEndtime)&&(identical(other.mClearday, mClearday) || other.mClearday == mClearday)&&(identical(other.svipLevel, svipLevel) || other.svipLevel == svipLevel)&&(identical(other.svipScore, svipScore) || other.svipScore == svipScore)&&(identical(other.suVipClearday, suVipClearday) || other.suVipClearday == suVipClearday)&&(identical(other.suVipEndTime, suVipEndTime) || other.suVipEndTime == suVipEndTime)&&(identical(other.suVipYEndtime, suVipYEndtime) || other.suVipYEndtime == suVipYEndtime)&&(identical(other.suVipBeginTime, suVipBeginTime) || other.suVipBeginTime == suVipBeginTime)&&const DeepCollectionEquality().equals(other.busiVip, busiVip)&&(identical(other.mBeginTime, mBeginTime) || other.mBeginTime == mBeginTime)&&(identical(other.userYType, userYType) || other.userYType == userYType)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.yType, yType) || other.yType == yType)&&(identical(other.mEndTime, mEndTime) || other.mEndTime == mEndTime)&&(identical(other.roamEndTime, roamEndTime) || other.roamEndTime == roamEndTime)&&(identical(other.mIsOld, mIsOld) || other.mIsOld == mIsOld)&&(identical(other.mType, mType) || other.mType == mType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,isVip,roamType,mResetTime,mYEndtime,vipClearday,vipType,vipBeginTime,roamBeginTime,vipEndTime,userid,vipYEndtime,mClearday,svipLevel,svipScore,suVipClearday,suVipEndTime,suVipYEndtime,suVipBeginTime,const DeepCollectionEquality().hash(busiVip),mBeginTime,userYType,userType,yType,mEndTime,roamEndTime,mIsOld,mType]);

@override
String toString() {
  return 'VipInfo(isVip: $isVip, roamType: $roamType, mResetTime: $mResetTime, mYEndtime: $mYEndtime, vipClearday: $vipClearday, vipType: $vipType, vipBeginTime: $vipBeginTime, roamBeginTime: $roamBeginTime, vipEndTime: $vipEndTime, userid: $userid, vipYEndtime: $vipYEndtime, mClearday: $mClearday, svipLevel: $svipLevel, svipScore: $svipScore, suVipClearday: $suVipClearday, suVipEndTime: $suVipEndTime, suVipYEndtime: $suVipYEndtime, suVipBeginTime: $suVipBeginTime, busiVip: $busiVip, mBeginTime: $mBeginTime, userYType: $userYType, userType: $userType, yType: $yType, mEndTime: $mEndTime, roamEndTime: $roamEndTime, mIsOld: $mIsOld, mType: $mType)';
}


}

/// @nodoc
abstract mixin class $VipInfoCopyWith<$Res>  {
  factory $VipInfoCopyWith(VipInfo value, $Res Function(VipInfo) _then) = _$VipInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'is_vip') int isVip,@IntFromStringConverter()@JsonKey(name: 'roam_type') int roamType,@JsonKey(name: 'm_reset_time') String mResetTime,@JsonKey(name: 'm_y_endtime') String mYEndtime,@JsonKey(name: 'vip_clearday') String vipClearday,@IntFromStringConverter()@JsonKey(name: 'vip_type') int vipType,@JsonKey(name: 'vip_begin_time') String vipBeginTime,@JsonKey(name: 'roam_begin_time') String roamBeginTime,@JsonKey(name: 'vip_end_time') String vipEndTime,@IntFromStringConverter() int userid,@JsonKey(name: 'vip_y_endtime') String vipYEndtime,@JsonKey(name: 'm_clearday') String mClearday,@IntFromStringConverter()@JsonKey(name: 'svip_level') int svipLevel,@IntFromStringConverter()@JsonKey(name: 'svip_score') int svipScore,@JsonKey(name: 'su_vip_clearday') String suVipClearday,@JsonKey(name: 'su_vip_end_time') String suVipEndTime,@JsonKey(name: 'su_vip_y_endtime') String suVipYEndtime,@JsonKey(name: 'su_vip_begin_time') String suVipBeginTime,@JsonKey(name: 'busi_vip') List<BusiVip> busiVip,@JsonKey(name: 'm_begin_time') String mBeginTime,@IntFromStringConverter()@JsonKey(name: 'user_y_type') int userYType,@IntFromStringConverter()@JsonKey(name: 'user_type') int userType,@IntFromStringConverter()@JsonKey(name: 'y_type') int yType,@JsonKey(name: 'm_end_time') String mEndTime,@JsonKey(name: 'roam_end_time') String roamEndTime,@IntFromStringConverter()@JsonKey(name: 'm_is_old') int mIsOld,@IntFromStringConverter()@JsonKey(name: 'm_type') int mType
});




}
/// @nodoc
class _$VipInfoCopyWithImpl<$Res>
    implements $VipInfoCopyWith<$Res> {
  _$VipInfoCopyWithImpl(this._self, this._then);

  final VipInfo _self;
  final $Res Function(VipInfo) _then;

/// Create a copy of VipInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isVip = null,Object? roamType = null,Object? mResetTime = null,Object? mYEndtime = null,Object? vipClearday = null,Object? vipType = null,Object? vipBeginTime = null,Object? roamBeginTime = null,Object? vipEndTime = null,Object? userid = null,Object? vipYEndtime = null,Object? mClearday = null,Object? svipLevel = null,Object? svipScore = null,Object? suVipClearday = null,Object? suVipEndTime = null,Object? suVipYEndtime = null,Object? suVipBeginTime = null,Object? busiVip = null,Object? mBeginTime = null,Object? userYType = null,Object? userType = null,Object? yType = null,Object? mEndTime = null,Object? roamEndTime = null,Object? mIsOld = null,Object? mType = null,}) {
  return _then(_self.copyWith(
isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,roamType: null == roamType ? _self.roamType : roamType // ignore: cast_nullable_to_non_nullable
as int,mResetTime: null == mResetTime ? _self.mResetTime : mResetTime // ignore: cast_nullable_to_non_nullable
as String,mYEndtime: null == mYEndtime ? _self.mYEndtime : mYEndtime // ignore: cast_nullable_to_non_nullable
as String,vipClearday: null == vipClearday ? _self.vipClearday : vipClearday // ignore: cast_nullable_to_non_nullable
as String,vipType: null == vipType ? _self.vipType : vipType // ignore: cast_nullable_to_non_nullable
as int,vipBeginTime: null == vipBeginTime ? _self.vipBeginTime : vipBeginTime // ignore: cast_nullable_to_non_nullable
as String,roamBeginTime: null == roamBeginTime ? _self.roamBeginTime : roamBeginTime // ignore: cast_nullable_to_non_nullable
as String,vipEndTime: null == vipEndTime ? _self.vipEndTime : vipEndTime // ignore: cast_nullable_to_non_nullable
as String,userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as int,vipYEndtime: null == vipYEndtime ? _self.vipYEndtime : vipYEndtime // ignore: cast_nullable_to_non_nullable
as String,mClearday: null == mClearday ? _self.mClearday : mClearday // ignore: cast_nullable_to_non_nullable
as String,svipLevel: null == svipLevel ? _self.svipLevel : svipLevel // ignore: cast_nullable_to_non_nullable
as int,svipScore: null == svipScore ? _self.svipScore : svipScore // ignore: cast_nullable_to_non_nullable
as int,suVipClearday: null == suVipClearday ? _self.suVipClearday : suVipClearday // ignore: cast_nullable_to_non_nullable
as String,suVipEndTime: null == suVipEndTime ? _self.suVipEndTime : suVipEndTime // ignore: cast_nullable_to_non_nullable
as String,suVipYEndtime: null == suVipYEndtime ? _self.suVipYEndtime : suVipYEndtime // ignore: cast_nullable_to_non_nullable
as String,suVipBeginTime: null == suVipBeginTime ? _self.suVipBeginTime : suVipBeginTime // ignore: cast_nullable_to_non_nullable
as String,busiVip: null == busiVip ? _self.busiVip : busiVip // ignore: cast_nullable_to_non_nullable
as List<BusiVip>,mBeginTime: null == mBeginTime ? _self.mBeginTime : mBeginTime // ignore: cast_nullable_to_non_nullable
as String,userYType: null == userYType ? _self.userYType : userYType // ignore: cast_nullable_to_non_nullable
as int,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as int,yType: null == yType ? _self.yType : yType // ignore: cast_nullable_to_non_nullable
as int,mEndTime: null == mEndTime ? _self.mEndTime : mEndTime // ignore: cast_nullable_to_non_nullable
as String,roamEndTime: null == roamEndTime ? _self.roamEndTime : roamEndTime // ignore: cast_nullable_to_non_nullable
as String,mIsOld: null == mIsOld ? _self.mIsOld : mIsOld // ignore: cast_nullable_to_non_nullable
as int,mType: null == mType ? _self.mType : mType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VipInfo].
extension VipInfoPatterns on VipInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VipInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VipInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VipInfo value)  $default,){
final _that = this;
switch (_that) {
case _VipInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VipInfo value)?  $default,){
final _that = this;
switch (_that) {
case _VipInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'is_vip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'roam_type')  int roamType, @JsonKey(name: 'm_reset_time')  String mResetTime, @JsonKey(name: 'm_y_endtime')  String mYEndtime, @JsonKey(name: 'vip_clearday')  String vipClearday, @IntFromStringConverter()@JsonKey(name: 'vip_type')  int vipType, @JsonKey(name: 'vip_begin_time')  String vipBeginTime, @JsonKey(name: 'roam_begin_time')  String roamBeginTime, @JsonKey(name: 'vip_end_time')  String vipEndTime, @IntFromStringConverter()  int userid, @JsonKey(name: 'vip_y_endtime')  String vipYEndtime, @JsonKey(name: 'm_clearday')  String mClearday, @IntFromStringConverter()@JsonKey(name: 'svip_level')  int svipLevel, @IntFromStringConverter()@JsonKey(name: 'svip_score')  int svipScore, @JsonKey(name: 'su_vip_clearday')  String suVipClearday, @JsonKey(name: 'su_vip_end_time')  String suVipEndTime, @JsonKey(name: 'su_vip_y_endtime')  String suVipYEndtime, @JsonKey(name: 'su_vip_begin_time')  String suVipBeginTime, @JsonKey(name: 'busi_vip')  List<BusiVip> busiVip, @JsonKey(name: 'm_begin_time')  String mBeginTime, @IntFromStringConverter()@JsonKey(name: 'user_y_type')  int userYType, @IntFromStringConverter()@JsonKey(name: 'user_type')  int userType, @IntFromStringConverter()@JsonKey(name: 'y_type')  int yType, @JsonKey(name: 'm_end_time')  String mEndTime, @JsonKey(name: 'roam_end_time')  String roamEndTime, @IntFromStringConverter()@JsonKey(name: 'm_is_old')  int mIsOld, @IntFromStringConverter()@JsonKey(name: 'm_type')  int mType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VipInfo() when $default != null:
return $default(_that.isVip,_that.roamType,_that.mResetTime,_that.mYEndtime,_that.vipClearday,_that.vipType,_that.vipBeginTime,_that.roamBeginTime,_that.vipEndTime,_that.userid,_that.vipYEndtime,_that.mClearday,_that.svipLevel,_that.svipScore,_that.suVipClearday,_that.suVipEndTime,_that.suVipYEndtime,_that.suVipBeginTime,_that.busiVip,_that.mBeginTime,_that.userYType,_that.userType,_that.yType,_that.mEndTime,_that.roamEndTime,_that.mIsOld,_that.mType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'is_vip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'roam_type')  int roamType, @JsonKey(name: 'm_reset_time')  String mResetTime, @JsonKey(name: 'm_y_endtime')  String mYEndtime, @JsonKey(name: 'vip_clearday')  String vipClearday, @IntFromStringConverter()@JsonKey(name: 'vip_type')  int vipType, @JsonKey(name: 'vip_begin_time')  String vipBeginTime, @JsonKey(name: 'roam_begin_time')  String roamBeginTime, @JsonKey(name: 'vip_end_time')  String vipEndTime, @IntFromStringConverter()  int userid, @JsonKey(name: 'vip_y_endtime')  String vipYEndtime, @JsonKey(name: 'm_clearday')  String mClearday, @IntFromStringConverter()@JsonKey(name: 'svip_level')  int svipLevel, @IntFromStringConverter()@JsonKey(name: 'svip_score')  int svipScore, @JsonKey(name: 'su_vip_clearday')  String suVipClearday, @JsonKey(name: 'su_vip_end_time')  String suVipEndTime, @JsonKey(name: 'su_vip_y_endtime')  String suVipYEndtime, @JsonKey(name: 'su_vip_begin_time')  String suVipBeginTime, @JsonKey(name: 'busi_vip')  List<BusiVip> busiVip, @JsonKey(name: 'm_begin_time')  String mBeginTime, @IntFromStringConverter()@JsonKey(name: 'user_y_type')  int userYType, @IntFromStringConverter()@JsonKey(name: 'user_type')  int userType, @IntFromStringConverter()@JsonKey(name: 'y_type')  int yType, @JsonKey(name: 'm_end_time')  String mEndTime, @JsonKey(name: 'roam_end_time')  String roamEndTime, @IntFromStringConverter()@JsonKey(name: 'm_is_old')  int mIsOld, @IntFromStringConverter()@JsonKey(name: 'm_type')  int mType)  $default,) {final _that = this;
switch (_that) {
case _VipInfo():
return $default(_that.isVip,_that.roamType,_that.mResetTime,_that.mYEndtime,_that.vipClearday,_that.vipType,_that.vipBeginTime,_that.roamBeginTime,_that.vipEndTime,_that.userid,_that.vipYEndtime,_that.mClearday,_that.svipLevel,_that.svipScore,_that.suVipClearday,_that.suVipEndTime,_that.suVipYEndtime,_that.suVipBeginTime,_that.busiVip,_that.mBeginTime,_that.userYType,_that.userType,_that.yType,_that.mEndTime,_that.roamEndTime,_that.mIsOld,_that.mType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'is_vip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'roam_type')  int roamType, @JsonKey(name: 'm_reset_time')  String mResetTime, @JsonKey(name: 'm_y_endtime')  String mYEndtime, @JsonKey(name: 'vip_clearday')  String vipClearday, @IntFromStringConverter()@JsonKey(name: 'vip_type')  int vipType, @JsonKey(name: 'vip_begin_time')  String vipBeginTime, @JsonKey(name: 'roam_begin_time')  String roamBeginTime, @JsonKey(name: 'vip_end_time')  String vipEndTime, @IntFromStringConverter()  int userid, @JsonKey(name: 'vip_y_endtime')  String vipYEndtime, @JsonKey(name: 'm_clearday')  String mClearday, @IntFromStringConverter()@JsonKey(name: 'svip_level')  int svipLevel, @IntFromStringConverter()@JsonKey(name: 'svip_score')  int svipScore, @JsonKey(name: 'su_vip_clearday')  String suVipClearday, @JsonKey(name: 'su_vip_end_time')  String suVipEndTime, @JsonKey(name: 'su_vip_y_endtime')  String suVipYEndtime, @JsonKey(name: 'su_vip_begin_time')  String suVipBeginTime, @JsonKey(name: 'busi_vip')  List<BusiVip> busiVip, @JsonKey(name: 'm_begin_time')  String mBeginTime, @IntFromStringConverter()@JsonKey(name: 'user_y_type')  int userYType, @IntFromStringConverter()@JsonKey(name: 'user_type')  int userType, @IntFromStringConverter()@JsonKey(name: 'y_type')  int yType, @JsonKey(name: 'm_end_time')  String mEndTime, @JsonKey(name: 'roam_end_time')  String roamEndTime, @IntFromStringConverter()@JsonKey(name: 'm_is_old')  int mIsOld, @IntFromStringConverter()@JsonKey(name: 'm_type')  int mType)?  $default,) {final _that = this;
switch (_that) {
case _VipInfo() when $default != null:
return $default(_that.isVip,_that.roamType,_that.mResetTime,_that.mYEndtime,_that.vipClearday,_that.vipType,_that.vipBeginTime,_that.roamBeginTime,_that.vipEndTime,_that.userid,_that.vipYEndtime,_that.mClearday,_that.svipLevel,_that.svipScore,_that.suVipClearday,_that.suVipEndTime,_that.suVipYEndtime,_that.suVipBeginTime,_that.busiVip,_that.mBeginTime,_that.userYType,_that.userType,_that.yType,_that.mEndTime,_that.roamEndTime,_that.mIsOld,_that.mType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VipInfo extends VipInfo {
  const _VipInfo({@IntFromStringConverter()@JsonKey(name: 'is_vip') this.isVip = 0, @IntFromStringConverter()@JsonKey(name: 'roam_type') this.roamType = 0, @JsonKey(name: 'm_reset_time') this.mResetTime = '', @JsonKey(name: 'm_y_endtime') this.mYEndtime = '', @JsonKey(name: 'vip_clearday') this.vipClearday = '', @IntFromStringConverter()@JsonKey(name: 'vip_type') this.vipType = 0, @JsonKey(name: 'vip_begin_time') this.vipBeginTime = '', @JsonKey(name: 'roam_begin_time') this.roamBeginTime = '', @JsonKey(name: 'vip_end_time') this.vipEndTime = '', @IntFromStringConverter() this.userid = 0, @JsonKey(name: 'vip_y_endtime') this.vipYEndtime = '', @JsonKey(name: 'm_clearday') this.mClearday = '', @IntFromStringConverter()@JsonKey(name: 'svip_level') this.svipLevel = 0, @IntFromStringConverter()@JsonKey(name: 'svip_score') this.svipScore = 0, @JsonKey(name: 'su_vip_clearday') this.suVipClearday = '', @JsonKey(name: 'su_vip_end_time') this.suVipEndTime = '', @JsonKey(name: 'su_vip_y_endtime') this.suVipYEndtime = '', @JsonKey(name: 'su_vip_begin_time') this.suVipBeginTime = '', @JsonKey(name: 'busi_vip') final  List<BusiVip> busiVip = const [], @JsonKey(name: 'm_begin_time') this.mBeginTime = '', @IntFromStringConverter()@JsonKey(name: 'user_y_type') this.userYType = 0, @IntFromStringConverter()@JsonKey(name: 'user_type') this.userType = 0, @IntFromStringConverter()@JsonKey(name: 'y_type') this.yType = 0, @JsonKey(name: 'm_end_time') this.mEndTime = '', @JsonKey(name: 'roam_end_time') this.roamEndTime = '', @IntFromStringConverter()@JsonKey(name: 'm_is_old') this.mIsOld = 0, @IntFromStringConverter()@JsonKey(name: 'm_type') this.mType = 0}): _busiVip = busiVip,super._();
  factory _VipInfo.fromJson(Map<String, dynamic> json) => _$VipInfoFromJson(json);

@override@IntFromStringConverter()@JsonKey(name: 'is_vip') final  int isVip;
@override@IntFromStringConverter()@JsonKey(name: 'roam_type') final  int roamType;
@override@JsonKey(name: 'm_reset_time') final  String mResetTime;
@override@JsonKey(name: 'm_y_endtime') final  String mYEndtime;
@override@JsonKey(name: 'vip_clearday') final  String vipClearday;
@override@IntFromStringConverter()@JsonKey(name: 'vip_type') final  int vipType;
@override@JsonKey(name: 'vip_begin_time') final  String vipBeginTime;
@override@JsonKey(name: 'roam_begin_time') final  String roamBeginTime;
@override@JsonKey(name: 'vip_end_time') final  String vipEndTime;
@override@JsonKey()@IntFromStringConverter() final  int userid;
@override@JsonKey(name: 'vip_y_endtime') final  String vipYEndtime;
@override@JsonKey(name: 'm_clearday') final  String mClearday;
@override@IntFromStringConverter()@JsonKey(name: 'svip_level') final  int svipLevel;
@override@IntFromStringConverter()@JsonKey(name: 'svip_score') final  int svipScore;
@override@JsonKey(name: 'su_vip_clearday') final  String suVipClearday;
@override@JsonKey(name: 'su_vip_end_time') final  String suVipEndTime;
@override@JsonKey(name: 'su_vip_y_endtime') final  String suVipYEndtime;
@override@JsonKey(name: 'su_vip_begin_time') final  String suVipBeginTime;
 final  List<BusiVip> _busiVip;
@override@JsonKey(name: 'busi_vip') List<BusiVip> get busiVip {
  if (_busiVip is EqualUnmodifiableListView) return _busiVip;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_busiVip);
}

@override@JsonKey(name: 'm_begin_time') final  String mBeginTime;
@override@IntFromStringConverter()@JsonKey(name: 'user_y_type') final  int userYType;
@override@IntFromStringConverter()@JsonKey(name: 'user_type') final  int userType;
@override@IntFromStringConverter()@JsonKey(name: 'y_type') final  int yType;
@override@JsonKey(name: 'm_end_time') final  String mEndTime;
@override@JsonKey(name: 'roam_end_time') final  String roamEndTime;
@override@IntFromStringConverter()@JsonKey(name: 'm_is_old') final  int mIsOld;
@override@IntFromStringConverter()@JsonKey(name: 'm_type') final  int mType;

/// Create a copy of VipInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VipInfoCopyWith<_VipInfo> get copyWith => __$VipInfoCopyWithImpl<_VipInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VipInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VipInfo&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.roamType, roamType) || other.roamType == roamType)&&(identical(other.mResetTime, mResetTime) || other.mResetTime == mResetTime)&&(identical(other.mYEndtime, mYEndtime) || other.mYEndtime == mYEndtime)&&(identical(other.vipClearday, vipClearday) || other.vipClearday == vipClearday)&&(identical(other.vipType, vipType) || other.vipType == vipType)&&(identical(other.vipBeginTime, vipBeginTime) || other.vipBeginTime == vipBeginTime)&&(identical(other.roamBeginTime, roamBeginTime) || other.roamBeginTime == roamBeginTime)&&(identical(other.vipEndTime, vipEndTime) || other.vipEndTime == vipEndTime)&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.vipYEndtime, vipYEndtime) || other.vipYEndtime == vipYEndtime)&&(identical(other.mClearday, mClearday) || other.mClearday == mClearday)&&(identical(other.svipLevel, svipLevel) || other.svipLevel == svipLevel)&&(identical(other.svipScore, svipScore) || other.svipScore == svipScore)&&(identical(other.suVipClearday, suVipClearday) || other.suVipClearday == suVipClearday)&&(identical(other.suVipEndTime, suVipEndTime) || other.suVipEndTime == suVipEndTime)&&(identical(other.suVipYEndtime, suVipYEndtime) || other.suVipYEndtime == suVipYEndtime)&&(identical(other.suVipBeginTime, suVipBeginTime) || other.suVipBeginTime == suVipBeginTime)&&const DeepCollectionEquality().equals(other._busiVip, _busiVip)&&(identical(other.mBeginTime, mBeginTime) || other.mBeginTime == mBeginTime)&&(identical(other.userYType, userYType) || other.userYType == userYType)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.yType, yType) || other.yType == yType)&&(identical(other.mEndTime, mEndTime) || other.mEndTime == mEndTime)&&(identical(other.roamEndTime, roamEndTime) || other.roamEndTime == roamEndTime)&&(identical(other.mIsOld, mIsOld) || other.mIsOld == mIsOld)&&(identical(other.mType, mType) || other.mType == mType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,isVip,roamType,mResetTime,mYEndtime,vipClearday,vipType,vipBeginTime,roamBeginTime,vipEndTime,userid,vipYEndtime,mClearday,svipLevel,svipScore,suVipClearday,suVipEndTime,suVipYEndtime,suVipBeginTime,const DeepCollectionEquality().hash(_busiVip),mBeginTime,userYType,userType,yType,mEndTime,roamEndTime,mIsOld,mType]);

@override
String toString() {
  return 'VipInfo(isVip: $isVip, roamType: $roamType, mResetTime: $mResetTime, mYEndtime: $mYEndtime, vipClearday: $vipClearday, vipType: $vipType, vipBeginTime: $vipBeginTime, roamBeginTime: $roamBeginTime, vipEndTime: $vipEndTime, userid: $userid, vipYEndtime: $vipYEndtime, mClearday: $mClearday, svipLevel: $svipLevel, svipScore: $svipScore, suVipClearday: $suVipClearday, suVipEndTime: $suVipEndTime, suVipYEndtime: $suVipYEndtime, suVipBeginTime: $suVipBeginTime, busiVip: $busiVip, mBeginTime: $mBeginTime, userYType: $userYType, userType: $userType, yType: $yType, mEndTime: $mEndTime, roamEndTime: $roamEndTime, mIsOld: $mIsOld, mType: $mType)';
}


}

/// @nodoc
abstract mixin class _$VipInfoCopyWith<$Res> implements $VipInfoCopyWith<$Res> {
  factory _$VipInfoCopyWith(_VipInfo value, $Res Function(_VipInfo) _then) = __$VipInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'is_vip') int isVip,@IntFromStringConverter()@JsonKey(name: 'roam_type') int roamType,@JsonKey(name: 'm_reset_time') String mResetTime,@JsonKey(name: 'm_y_endtime') String mYEndtime,@JsonKey(name: 'vip_clearday') String vipClearday,@IntFromStringConverter()@JsonKey(name: 'vip_type') int vipType,@JsonKey(name: 'vip_begin_time') String vipBeginTime,@JsonKey(name: 'roam_begin_time') String roamBeginTime,@JsonKey(name: 'vip_end_time') String vipEndTime,@IntFromStringConverter() int userid,@JsonKey(name: 'vip_y_endtime') String vipYEndtime,@JsonKey(name: 'm_clearday') String mClearday,@IntFromStringConverter()@JsonKey(name: 'svip_level') int svipLevel,@IntFromStringConverter()@JsonKey(name: 'svip_score') int svipScore,@JsonKey(name: 'su_vip_clearday') String suVipClearday,@JsonKey(name: 'su_vip_end_time') String suVipEndTime,@JsonKey(name: 'su_vip_y_endtime') String suVipYEndtime,@JsonKey(name: 'su_vip_begin_time') String suVipBeginTime,@JsonKey(name: 'busi_vip') List<BusiVip> busiVip,@JsonKey(name: 'm_begin_time') String mBeginTime,@IntFromStringConverter()@JsonKey(name: 'user_y_type') int userYType,@IntFromStringConverter()@JsonKey(name: 'user_type') int userType,@IntFromStringConverter()@JsonKey(name: 'y_type') int yType,@JsonKey(name: 'm_end_time') String mEndTime,@JsonKey(name: 'roam_end_time') String roamEndTime,@IntFromStringConverter()@JsonKey(name: 'm_is_old') int mIsOld,@IntFromStringConverter()@JsonKey(name: 'm_type') int mType
});




}
/// @nodoc
class __$VipInfoCopyWithImpl<$Res>
    implements _$VipInfoCopyWith<$Res> {
  __$VipInfoCopyWithImpl(this._self, this._then);

  final _VipInfo _self;
  final $Res Function(_VipInfo) _then;

/// Create a copy of VipInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isVip = null,Object? roamType = null,Object? mResetTime = null,Object? mYEndtime = null,Object? vipClearday = null,Object? vipType = null,Object? vipBeginTime = null,Object? roamBeginTime = null,Object? vipEndTime = null,Object? userid = null,Object? vipYEndtime = null,Object? mClearday = null,Object? svipLevel = null,Object? svipScore = null,Object? suVipClearday = null,Object? suVipEndTime = null,Object? suVipYEndtime = null,Object? suVipBeginTime = null,Object? busiVip = null,Object? mBeginTime = null,Object? userYType = null,Object? userType = null,Object? yType = null,Object? mEndTime = null,Object? roamEndTime = null,Object? mIsOld = null,Object? mType = null,}) {
  return _then(_VipInfo(
isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,roamType: null == roamType ? _self.roamType : roamType // ignore: cast_nullable_to_non_nullable
as int,mResetTime: null == mResetTime ? _self.mResetTime : mResetTime // ignore: cast_nullable_to_non_nullable
as String,mYEndtime: null == mYEndtime ? _self.mYEndtime : mYEndtime // ignore: cast_nullable_to_non_nullable
as String,vipClearday: null == vipClearday ? _self.vipClearday : vipClearday // ignore: cast_nullable_to_non_nullable
as String,vipType: null == vipType ? _self.vipType : vipType // ignore: cast_nullable_to_non_nullable
as int,vipBeginTime: null == vipBeginTime ? _self.vipBeginTime : vipBeginTime // ignore: cast_nullable_to_non_nullable
as String,roamBeginTime: null == roamBeginTime ? _self.roamBeginTime : roamBeginTime // ignore: cast_nullable_to_non_nullable
as String,vipEndTime: null == vipEndTime ? _self.vipEndTime : vipEndTime // ignore: cast_nullable_to_non_nullable
as String,userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as int,vipYEndtime: null == vipYEndtime ? _self.vipYEndtime : vipYEndtime // ignore: cast_nullable_to_non_nullable
as String,mClearday: null == mClearday ? _self.mClearday : mClearday // ignore: cast_nullable_to_non_nullable
as String,svipLevel: null == svipLevel ? _self.svipLevel : svipLevel // ignore: cast_nullable_to_non_nullable
as int,svipScore: null == svipScore ? _self.svipScore : svipScore // ignore: cast_nullable_to_non_nullable
as int,suVipClearday: null == suVipClearday ? _self.suVipClearday : suVipClearday // ignore: cast_nullable_to_non_nullable
as String,suVipEndTime: null == suVipEndTime ? _self.suVipEndTime : suVipEndTime // ignore: cast_nullable_to_non_nullable
as String,suVipYEndtime: null == suVipYEndtime ? _self.suVipYEndtime : suVipYEndtime // ignore: cast_nullable_to_non_nullable
as String,suVipBeginTime: null == suVipBeginTime ? _self.suVipBeginTime : suVipBeginTime // ignore: cast_nullable_to_non_nullable
as String,busiVip: null == busiVip ? _self._busiVip : busiVip // ignore: cast_nullable_to_non_nullable
as List<BusiVip>,mBeginTime: null == mBeginTime ? _self.mBeginTime : mBeginTime // ignore: cast_nullable_to_non_nullable
as String,userYType: null == userYType ? _self.userYType : userYType // ignore: cast_nullable_to_non_nullable
as int,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as int,yType: null == yType ? _self.yType : yType // ignore: cast_nullable_to_non_nullable
as int,mEndTime: null == mEndTime ? _self.mEndTime : mEndTime // ignore: cast_nullable_to_non_nullable
as String,roamEndTime: null == roamEndTime ? _self.roamEndTime : roamEndTime // ignore: cast_nullable_to_non_nullable
as String,mIsOld: null == mIsOld ? _self.mIsOld : mIsOld // ignore: cast_nullable_to_non_nullable
as int,mType: null == mType ? _self.mType : mType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

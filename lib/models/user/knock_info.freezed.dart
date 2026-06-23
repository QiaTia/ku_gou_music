// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knock_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KnockInfo {

@IntFromStringConverter() int get userid; String get pic; String get nickname;@IntFromStringConverter() int get addtime;
/// Create a copy of KnockInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnockInfoCopyWith<KnockInfo> get copyWith => _$KnockInfoCopyWithImpl<KnockInfo>(this as KnockInfo, _$identity);

  /// Serializes this KnockInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnockInfo&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.addtime, addtime) || other.addtime == addtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userid,pic,nickname,addtime);

@override
String toString() {
  return 'KnockInfo(userid: $userid, pic: $pic, nickname: $nickname, addtime: $addtime)';
}


}

/// @nodoc
abstract mixin class $KnockInfoCopyWith<$Res>  {
  factory $KnockInfoCopyWith(KnockInfo value, $Res Function(KnockInfo) _then) = _$KnockInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter() int userid, String pic, String nickname,@IntFromStringConverter() int addtime
});




}
/// @nodoc
class _$KnockInfoCopyWithImpl<$Res>
    implements $KnockInfoCopyWith<$Res> {
  _$KnockInfoCopyWithImpl(this._self, this._then);

  final KnockInfo _self;
  final $Res Function(KnockInfo) _then;

/// Create a copy of KnockInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userid = null,Object? pic = null,Object? nickname = null,Object? addtime = null,}) {
  return _then(_self.copyWith(
userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as int,pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,addtime: null == addtime ? _self.addtime : addtime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [KnockInfo].
extension KnockInfoPatterns on KnockInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnockInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnockInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnockInfo value)  $default,){
final _that = this;
switch (_that) {
case _KnockInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnockInfo value)?  $default,){
final _that = this;
switch (_that) {
case _KnockInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int userid,  String pic,  String nickname, @IntFromStringConverter()  int addtime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnockInfo() when $default != null:
return $default(_that.userid,_that.pic,_that.nickname,_that.addtime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int userid,  String pic,  String nickname, @IntFromStringConverter()  int addtime)  $default,) {final _that = this;
switch (_that) {
case _KnockInfo():
return $default(_that.userid,_that.pic,_that.nickname,_that.addtime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()  int userid,  String pic,  String nickname, @IntFromStringConverter()  int addtime)?  $default,) {final _that = this;
switch (_that) {
case _KnockInfo() when $default != null:
return $default(_that.userid,_that.pic,_that.nickname,_that.addtime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KnockInfo implements KnockInfo {
  const _KnockInfo({@IntFromStringConverter() this.userid = 0, this.pic = '', this.nickname = '', @IntFromStringConverter() this.addtime = 0});
  factory _KnockInfo.fromJson(Map<String, dynamic> json) => _$KnockInfoFromJson(json);

@override@JsonKey()@IntFromStringConverter() final  int userid;
@override@JsonKey() final  String pic;
@override@JsonKey() final  String nickname;
@override@JsonKey()@IntFromStringConverter() final  int addtime;

/// Create a copy of KnockInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnockInfoCopyWith<_KnockInfo> get copyWith => __$KnockInfoCopyWithImpl<_KnockInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KnockInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnockInfo&&(identical(other.userid, userid) || other.userid == userid)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.addtime, addtime) || other.addtime == addtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userid,pic,nickname,addtime);

@override
String toString() {
  return 'KnockInfo(userid: $userid, pic: $pic, nickname: $nickname, addtime: $addtime)';
}


}

/// @nodoc
abstract mixin class _$KnockInfoCopyWith<$Res> implements $KnockInfoCopyWith<$Res> {
  factory _$KnockInfoCopyWith(_KnockInfo value, $Res Function(_KnockInfo) _then) = __$KnockInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter() int userid, String pic, String nickname,@IntFromStringConverter() int addtime
});




}
/// @nodoc
class __$KnockInfoCopyWithImpl<$Res>
    implements _$KnockInfoCopyWith<$Res> {
  __$KnockInfoCopyWithImpl(this._self, this._then);

  final _KnockInfo _self;
  final $Res Function(_KnockInfo) _then;

/// Create a copy of KnockInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userid = null,Object? pic = null,Object? nickname = null,Object? addtime = null,}) {
  return _then(_KnockInfo(
userid: null == userid ? _self.userid : userid // ignore: cast_nullable_to_non_nullable
as int,pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,addtime: null == addtime ? _self.addtime : addtime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

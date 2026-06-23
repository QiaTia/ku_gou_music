// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedalInfo {

 KtvMedal get ktv; FxMedal get fx;
/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedalInfoCopyWith<MedalInfo> get copyWith => _$MedalInfoCopyWithImpl<MedalInfo>(this as MedalInfo, _$identity);

  /// Serializes this MedalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedalInfo&&(identical(other.ktv, ktv) || other.ktv == ktv)&&(identical(other.fx, fx) || other.fx == fx));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ktv,fx);

@override
String toString() {
  return 'MedalInfo(ktv: $ktv, fx: $fx)';
}


}

/// @nodoc
abstract mixin class $MedalInfoCopyWith<$Res>  {
  factory $MedalInfoCopyWith(MedalInfo value, $Res Function(MedalInfo) _then) = _$MedalInfoCopyWithImpl;
@useResult
$Res call({
 KtvMedal ktv, FxMedal fx
});


$KtvMedalCopyWith<$Res> get ktv;$FxMedalCopyWith<$Res> get fx;

}
/// @nodoc
class _$MedalInfoCopyWithImpl<$Res>
    implements $MedalInfoCopyWith<$Res> {
  _$MedalInfoCopyWithImpl(this._self, this._then);

  final MedalInfo _self;
  final $Res Function(MedalInfo) _then;

/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ktv = null,Object? fx = null,}) {
  return _then(_self.copyWith(
ktv: null == ktv ? _self.ktv : ktv // ignore: cast_nullable_to_non_nullable
as KtvMedal,fx: null == fx ? _self.fx : fx // ignore: cast_nullable_to_non_nullable
as FxMedal,
  ));
}
/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KtvMedalCopyWith<$Res> get ktv {
  
  return $KtvMedalCopyWith<$Res>(_self.ktv, (value) {
    return _then(_self.copyWith(ktv: value));
  });
}/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FxMedalCopyWith<$Res> get fx {
  
  return $FxMedalCopyWith<$Res>(_self.fx, (value) {
    return _then(_self.copyWith(fx: value));
  });
}
}


/// Adds pattern-matching-related methods to [MedalInfo].
extension MedalInfoPatterns on MedalInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedalInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedalInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedalInfo value)  $default,){
final _that = this;
switch (_that) {
case _MedalInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedalInfo value)?  $default,){
final _that = this;
switch (_that) {
case _MedalInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( KtvMedal ktv,  FxMedal fx)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedalInfo() when $default != null:
return $default(_that.ktv,_that.fx);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( KtvMedal ktv,  FxMedal fx)  $default,) {final _that = this;
switch (_that) {
case _MedalInfo():
return $default(_that.ktv,_that.fx);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( KtvMedal ktv,  FxMedal fx)?  $default,) {final _that = this;
switch (_that) {
case _MedalInfo() when $default != null:
return $default(_that.ktv,_that.fx);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedalInfo implements MedalInfo {
  const _MedalInfo({this.ktv = const KtvMedal(), this.fx = const FxMedal()});
  factory _MedalInfo.fromJson(Map<String, dynamic> json) => _$MedalInfoFromJson(json);

@override@JsonKey() final  KtvMedal ktv;
@override@JsonKey() final  FxMedal fx;

/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedalInfoCopyWith<_MedalInfo> get copyWith => __$MedalInfoCopyWithImpl<_MedalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedalInfo&&(identical(other.ktv, ktv) || other.ktv == ktv)&&(identical(other.fx, fx) || other.fx == fx));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ktv,fx);

@override
String toString() {
  return 'MedalInfo(ktv: $ktv, fx: $fx)';
}


}

/// @nodoc
abstract mixin class _$MedalInfoCopyWith<$Res> implements $MedalInfoCopyWith<$Res> {
  factory _$MedalInfoCopyWith(_MedalInfo value, $Res Function(_MedalInfo) _then) = __$MedalInfoCopyWithImpl;
@override @useResult
$Res call({
 KtvMedal ktv, FxMedal fx
});


@override $KtvMedalCopyWith<$Res> get ktv;@override $FxMedalCopyWith<$Res> get fx;

}
/// @nodoc
class __$MedalInfoCopyWithImpl<$Res>
    implements _$MedalInfoCopyWith<$Res> {
  __$MedalInfoCopyWithImpl(this._self, this._then);

  final _MedalInfo _self;
  final $Res Function(_MedalInfo) _then;

/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ktv = null,Object? fx = null,}) {
  return _then(_MedalInfo(
ktv: null == ktv ? _self.ktv : ktv // ignore: cast_nullable_to_non_nullable
as KtvMedal,fx: null == fx ? _self.fx : fx // ignore: cast_nullable_to_non_nullable
as FxMedal,
  ));
}

/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KtvMedalCopyWith<$Res> get ktv {
  
  return $KtvMedalCopyWith<$Res>(_self.ktv, (value) {
    return _then(_self.copyWith(ktv: value));
  });
}/// Create a copy of MedalInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FxMedalCopyWith<$Res> get fx {
  
  return $FxMedalCopyWith<$Res>(_self.fx, (value) {
    return _then(_self.copyWith(fx: value));
  });
}
}

// dart format on

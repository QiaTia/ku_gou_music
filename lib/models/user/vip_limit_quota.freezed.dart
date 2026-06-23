// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vip_limit_quota.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VipLimitQuota {

@IntFromStringConverter() int get total;
/// Create a copy of VipLimitQuota
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VipLimitQuotaCopyWith<VipLimitQuota> get copyWith => _$VipLimitQuotaCopyWithImpl<VipLimitQuota>(this as VipLimitQuota, _$identity);

  /// Serializes this VipLimitQuota to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VipLimitQuota&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'VipLimitQuota(total: $total)';
}


}

/// @nodoc
abstract mixin class $VipLimitQuotaCopyWith<$Res>  {
  factory $VipLimitQuotaCopyWith(VipLimitQuota value, $Res Function(VipLimitQuota) _then) = _$VipLimitQuotaCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter() int total
});




}
/// @nodoc
class _$VipLimitQuotaCopyWithImpl<$Res>
    implements $VipLimitQuotaCopyWith<$Res> {
  _$VipLimitQuotaCopyWithImpl(this._self, this._then);

  final VipLimitQuota _self;
  final $Res Function(VipLimitQuota) _then;

/// Create a copy of VipLimitQuota
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VipLimitQuota].
extension VipLimitQuotaPatterns on VipLimitQuota {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VipLimitQuota value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VipLimitQuota() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VipLimitQuota value)  $default,){
final _that = this;
switch (_that) {
case _VipLimitQuota():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VipLimitQuota value)?  $default,){
final _that = this;
switch (_that) {
case _VipLimitQuota() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VipLimitQuota() when $default != null:
return $default(_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int total)  $default,) {final _that = this;
switch (_that) {
case _VipLimitQuota():
return $default(_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()  int total)?  $default,) {final _that = this;
switch (_that) {
case _VipLimitQuota() when $default != null:
return $default(_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VipLimitQuota implements VipLimitQuota {
  const _VipLimitQuota({@IntFromStringConverter() this.total = 0});
  factory _VipLimitQuota.fromJson(Map<String, dynamic> json) => _$VipLimitQuotaFromJson(json);

@override@JsonKey()@IntFromStringConverter() final  int total;

/// Create a copy of VipLimitQuota
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VipLimitQuotaCopyWith<_VipLimitQuota> get copyWith => __$VipLimitQuotaCopyWithImpl<_VipLimitQuota>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VipLimitQuotaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VipLimitQuota&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total);

@override
String toString() {
  return 'VipLimitQuota(total: $total)';
}


}

/// @nodoc
abstract mixin class _$VipLimitQuotaCopyWith<$Res> implements $VipLimitQuotaCopyWith<$Res> {
  factory _$VipLimitQuotaCopyWith(_VipLimitQuota value, $Res Function(_VipLimitQuota) _then) = __$VipLimitQuotaCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter() int total
});




}
/// @nodoc
class __$VipLimitQuotaCopyWithImpl<$Res>
    implements _$VipLimitQuotaCopyWith<$Res> {
  __$VipLimitQuotaCopyWithImpl(this._self, this._then);

  final _VipLimitQuota _self;
  final $Res Function(_VipLimitQuota) _then;

/// Create a copy of VipLimitQuota
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,}) {
  return _then(_VipLimitQuota(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

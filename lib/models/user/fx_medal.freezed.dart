// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fx_medal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FxMedal {

@IntFromStringConverter() int get vipLevel;@IntFromStringConverter() int get richLevel;@IntFromStringConverter() int get starLevel;
/// Create a copy of FxMedal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FxMedalCopyWith<FxMedal> get copyWith => _$FxMedalCopyWithImpl<FxMedal>(this as FxMedal, _$identity);

  /// Serializes this FxMedal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FxMedal&&(identical(other.vipLevel, vipLevel) || other.vipLevel == vipLevel)&&(identical(other.richLevel, richLevel) || other.richLevel == richLevel)&&(identical(other.starLevel, starLevel) || other.starLevel == starLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vipLevel,richLevel,starLevel);

@override
String toString() {
  return 'FxMedal(vipLevel: $vipLevel, richLevel: $richLevel, starLevel: $starLevel)';
}


}

/// @nodoc
abstract mixin class $FxMedalCopyWith<$Res>  {
  factory $FxMedalCopyWith(FxMedal value, $Res Function(FxMedal) _then) = _$FxMedalCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter() int vipLevel,@IntFromStringConverter() int richLevel,@IntFromStringConverter() int starLevel
});




}
/// @nodoc
class _$FxMedalCopyWithImpl<$Res>
    implements $FxMedalCopyWith<$Res> {
  _$FxMedalCopyWithImpl(this._self, this._then);

  final FxMedal _self;
  final $Res Function(FxMedal) _then;

/// Create a copy of FxMedal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vipLevel = null,Object? richLevel = null,Object? starLevel = null,}) {
  return _then(_self.copyWith(
vipLevel: null == vipLevel ? _self.vipLevel : vipLevel // ignore: cast_nullable_to_non_nullable
as int,richLevel: null == richLevel ? _self.richLevel : richLevel // ignore: cast_nullable_to_non_nullable
as int,starLevel: null == starLevel ? _self.starLevel : starLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FxMedal].
extension FxMedalPatterns on FxMedal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FxMedal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FxMedal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FxMedal value)  $default,){
final _that = this;
switch (_that) {
case _FxMedal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FxMedal value)?  $default,){
final _that = this;
switch (_that) {
case _FxMedal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int vipLevel, @IntFromStringConverter()  int richLevel, @IntFromStringConverter()  int starLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FxMedal() when $default != null:
return $default(_that.vipLevel,_that.richLevel,_that.starLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int vipLevel, @IntFromStringConverter()  int richLevel, @IntFromStringConverter()  int starLevel)  $default,) {final _that = this;
switch (_that) {
case _FxMedal():
return $default(_that.vipLevel,_that.richLevel,_that.starLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()  int vipLevel, @IntFromStringConverter()  int richLevel, @IntFromStringConverter()  int starLevel)?  $default,) {final _that = this;
switch (_that) {
case _FxMedal() when $default != null:
return $default(_that.vipLevel,_that.richLevel,_that.starLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FxMedal implements FxMedal {
  const _FxMedal({@IntFromStringConverter() this.vipLevel = 0, @IntFromStringConverter() this.richLevel = 0, @IntFromStringConverter() this.starLevel = 0});
  factory _FxMedal.fromJson(Map<String, dynamic> json) => _$FxMedalFromJson(json);

@override@JsonKey()@IntFromStringConverter() final  int vipLevel;
@override@JsonKey()@IntFromStringConverter() final  int richLevel;
@override@JsonKey()@IntFromStringConverter() final  int starLevel;

/// Create a copy of FxMedal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FxMedalCopyWith<_FxMedal> get copyWith => __$FxMedalCopyWithImpl<_FxMedal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FxMedalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FxMedal&&(identical(other.vipLevel, vipLevel) || other.vipLevel == vipLevel)&&(identical(other.richLevel, richLevel) || other.richLevel == richLevel)&&(identical(other.starLevel, starLevel) || other.starLevel == starLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vipLevel,richLevel,starLevel);

@override
String toString() {
  return 'FxMedal(vipLevel: $vipLevel, richLevel: $richLevel, starLevel: $starLevel)';
}


}

/// @nodoc
abstract mixin class _$FxMedalCopyWith<$Res> implements $FxMedalCopyWith<$Res> {
  factory _$FxMedalCopyWith(_FxMedal value, $Res Function(_FxMedal) _then) = __$FxMedalCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter() int vipLevel,@IntFromStringConverter() int richLevel,@IntFromStringConverter() int starLevel
});




}
/// @nodoc
class __$FxMedalCopyWithImpl<$Res>
    implements _$FxMedalCopyWith<$Res> {
  __$FxMedalCopyWithImpl(this._self, this._then);

  final _FxMedal _self;
  final $Res Function(_FxMedal) _then;

/// Create a copy of FxMedal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vipLevel = null,Object? richLevel = null,Object? starLevel = null,}) {
  return _then(_FxMedal(
vipLevel: null == vipLevel ? _self.vipLevel : vipLevel // ignore: cast_nullable_to_non_nullable
as int,richLevel: null == richLevel ? _self.richLevel : richLevel // ignore: cast_nullable_to_non_nullable
as int,starLevel: null == starLevel ? _self.starLevel : starLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

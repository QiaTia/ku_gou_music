// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ktv_medal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KtvMedal {

 String get type3; String get type2; String get type1;
/// Create a copy of KtvMedal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KtvMedalCopyWith<KtvMedal> get copyWith => _$KtvMedalCopyWithImpl<KtvMedal>(this as KtvMedal, _$identity);

  /// Serializes this KtvMedal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KtvMedal&&(identical(other.type3, type3) || other.type3 == type3)&&(identical(other.type2, type2) || other.type2 == type2)&&(identical(other.type1, type1) || other.type1 == type1));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type3,type2,type1);

@override
String toString() {
  return 'KtvMedal(type3: $type3, type2: $type2, type1: $type1)';
}


}

/// @nodoc
abstract mixin class $KtvMedalCopyWith<$Res>  {
  factory $KtvMedalCopyWith(KtvMedal value, $Res Function(KtvMedal) _then) = _$KtvMedalCopyWithImpl;
@useResult
$Res call({
 String type3, String type2, String type1
});




}
/// @nodoc
class _$KtvMedalCopyWithImpl<$Res>
    implements $KtvMedalCopyWith<$Res> {
  _$KtvMedalCopyWithImpl(this._self, this._then);

  final KtvMedal _self;
  final $Res Function(KtvMedal) _then;

/// Create a copy of KtvMedal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type3 = null,Object? type2 = null,Object? type1 = null,}) {
  return _then(_self.copyWith(
type3: null == type3 ? _self.type3 : type3 // ignore: cast_nullable_to_non_nullable
as String,type2: null == type2 ? _self.type2 : type2 // ignore: cast_nullable_to_non_nullable
as String,type1: null == type1 ? _self.type1 : type1 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KtvMedal].
extension KtvMedalPatterns on KtvMedal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KtvMedal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KtvMedal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KtvMedal value)  $default,){
final _that = this;
switch (_that) {
case _KtvMedal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KtvMedal value)?  $default,){
final _that = this;
switch (_that) {
case _KtvMedal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type3,  String type2,  String type1)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KtvMedal() when $default != null:
return $default(_that.type3,_that.type2,_that.type1);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type3,  String type2,  String type1)  $default,) {final _that = this;
switch (_that) {
case _KtvMedal():
return $default(_that.type3,_that.type2,_that.type1);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type3,  String type2,  String type1)?  $default,) {final _that = this;
switch (_that) {
case _KtvMedal() when $default != null:
return $default(_that.type3,_that.type2,_that.type1);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KtvMedal implements KtvMedal {
  const _KtvMedal({this.type3 = '', this.type2 = '', this.type1 = ''});
  factory _KtvMedal.fromJson(Map<String, dynamic> json) => _$KtvMedalFromJson(json);

@override@JsonKey() final  String type3;
@override@JsonKey() final  String type2;
@override@JsonKey() final  String type1;

/// Create a copy of KtvMedal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KtvMedalCopyWith<_KtvMedal> get copyWith => __$KtvMedalCopyWithImpl<_KtvMedal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KtvMedalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KtvMedal&&(identical(other.type3, type3) || other.type3 == type3)&&(identical(other.type2, type2) || other.type2 == type2)&&(identical(other.type1, type1) || other.type1 == type1));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type3,type2,type1);

@override
String toString() {
  return 'KtvMedal(type3: $type3, type2: $type2, type1: $type1)';
}


}

/// @nodoc
abstract mixin class _$KtvMedalCopyWith<$Res> implements $KtvMedalCopyWith<$Res> {
  factory _$KtvMedalCopyWith(_KtvMedal value, $Res Function(_KtvMedal) _then) = __$KtvMedalCopyWithImpl;
@override @useResult
$Res call({
 String type3, String type2, String type1
});




}
/// @nodoc
class __$KtvMedalCopyWithImpl<$Res>
    implements _$KtvMedalCopyWith<$Res> {
  __$KtvMedalCopyWithImpl(this._self, this._then);

  final _KtvMedal _self;
  final $Res Function(_KtvMedal) _then;

/// Create a copy of KtvMedal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type3 = null,Object? type2 = null,Object? type1 = null,}) {
  return _then(_KtvMedal(
type3: null == type3 ? _self.type3 : type3 // ignore: cast_nullable_to_non_nullable
as String,type2: null == type2 ? _self.type2 : type2 // ignore: cast_nullable_to_non_nullable
as String,type1: null == type1 ? _self.type1 : type1 // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

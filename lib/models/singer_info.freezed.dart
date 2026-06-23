// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'singer_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingerInfo {

 String get name;@JsonKey(name: 'is_publish') int get isPublish; Object get id;
/// Create a copy of SingerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingerInfoCopyWith<SingerInfo> get copyWith => _$SingerInfoCopyWithImpl<SingerInfo>(this as SingerInfo, _$identity);

  /// Serializes this SingerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingerInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish)&&const DeepCollectionEquality().equals(other.id, id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,isPublish,const DeepCollectionEquality().hash(id));

@override
String toString() {
  return 'SingerInfo(name: $name, isPublish: $isPublish, id: $id)';
}


}

/// @nodoc
abstract mixin class $SingerInfoCopyWith<$Res>  {
  factory $SingerInfoCopyWith(SingerInfo value, $Res Function(SingerInfo) _then) = _$SingerInfoCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'is_publish') int isPublish, Object id
});




}
/// @nodoc
class _$SingerInfoCopyWithImpl<$Res>
    implements $SingerInfoCopyWith<$Res> {
  _$SingerInfoCopyWithImpl(this._self, this._then);

  final SingerInfo _self;
  final $Res Function(SingerInfo) _then;

/// Create a copy of SingerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? isPublish = null,Object? id = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id ,
  ));
}

}


/// Adds pattern-matching-related methods to [SingerInfo].
extension SingerInfoPatterns on SingerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SingerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SingerInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SingerInfo value)  $default,){
final _that = this;
switch (_that) {
case _SingerInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SingerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SingerInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'is_publish')  int isPublish,  Object id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SingerInfo() when $default != null:
return $default(_that.name,_that.isPublish,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'is_publish')  int isPublish,  Object id)  $default,) {final _that = this;
switch (_that) {
case _SingerInfo():
return $default(_that.name,_that.isPublish,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'is_publish')  int isPublish,  Object id)?  $default,) {final _that = this;
switch (_that) {
case _SingerInfo() when $default != null:
return $default(_that.name,_that.isPublish,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SingerInfo implements SingerInfo {
  const _SingerInfo({required this.name, @JsonKey(name: 'is_publish') required this.isPublish, required this.id});
  factory _SingerInfo.fromJson(Map<String, dynamic> json) => _$SingerInfoFromJson(json);

@override final  String name;
@override@JsonKey(name: 'is_publish') final  int isPublish;
@override final  Object id;

/// Create a copy of SingerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingerInfoCopyWith<_SingerInfo> get copyWith => __$SingerInfoCopyWithImpl<_SingerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SingerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingerInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish)&&const DeepCollectionEquality().equals(other.id, id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,isPublish,const DeepCollectionEquality().hash(id));

@override
String toString() {
  return 'SingerInfo(name: $name, isPublish: $isPublish, id: $id)';
}


}

/// @nodoc
abstract mixin class _$SingerInfoCopyWith<$Res> implements $SingerInfoCopyWith<$Res> {
  factory _$SingerInfoCopyWith(_SingerInfo value, $Res Function(_SingerInfo) _then) = __$SingerInfoCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'is_publish') int isPublish, Object id
});




}
/// @nodoc
class __$SingerInfoCopyWithImpl<$Res>
    implements _$SingerInfoCopyWith<$Res> {
  __$SingerInfoCopyWithImpl(this._self, this._then);

  final _SingerInfo _self;
  final $Res Function(_SingerInfo) _then;

/// Create a copy of SingerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? isPublish = null,Object? id = null,}) {
  return _then(_SingerInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id ,
  ));
}


}

// dart format on

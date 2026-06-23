// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendResponse {

@JsonKey(name: 'sign') String get sign;@JsonKey(name: 'song_list_size') int get songListSize;@JsonKey(name: 'song_list') List<Song> get songList;
/// Create a copy of RecommendResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendResponseCopyWith<RecommendResponse> get copyWith => _$RecommendResponseCopyWithImpl<RecommendResponse>(this as RecommendResponse, _$identity);

  /// Serializes this RecommendResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendResponse&&(identical(other.sign, sign) || other.sign == sign)&&(identical(other.songListSize, songListSize) || other.songListSize == songListSize)&&const DeepCollectionEquality().equals(other.songList, songList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sign,songListSize,const DeepCollectionEquality().hash(songList));

@override
String toString() {
  return 'RecommendResponse(sign: $sign, songListSize: $songListSize, songList: $songList)';
}


}

/// @nodoc
abstract mixin class $RecommendResponseCopyWith<$Res>  {
  factory $RecommendResponseCopyWith(RecommendResponse value, $Res Function(RecommendResponse) _then) = _$RecommendResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sign') String sign,@JsonKey(name: 'song_list_size') int songListSize,@JsonKey(name: 'song_list') List<Song> songList
});




}
/// @nodoc
class _$RecommendResponseCopyWithImpl<$Res>
    implements $RecommendResponseCopyWith<$Res> {
  _$RecommendResponseCopyWithImpl(this._self, this._then);

  final RecommendResponse _self;
  final $Res Function(RecommendResponse) _then;

/// Create a copy of RecommendResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sign = null,Object? songListSize = null,Object? songList = null,}) {
  return _then(_self.copyWith(
sign: null == sign ? _self.sign : sign // ignore: cast_nullable_to_non_nullable
as String,songListSize: null == songListSize ? _self.songListSize : songListSize // ignore: cast_nullable_to_non_nullable
as int,songList: null == songList ? _self.songList : songList // ignore: cast_nullable_to_non_nullable
as List<Song>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendResponse].
extension RecommendResponsePatterns on RecommendResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecommendResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sign')  String sign, @JsonKey(name: 'song_list_size')  int songListSize, @JsonKey(name: 'song_list')  List<Song> songList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendResponse() when $default != null:
return $default(_that.sign,_that.songListSize,_that.songList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sign')  String sign, @JsonKey(name: 'song_list_size')  int songListSize, @JsonKey(name: 'song_list')  List<Song> songList)  $default,) {final _that = this;
switch (_that) {
case _RecommendResponse():
return $default(_that.sign,_that.songListSize,_that.songList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sign')  String sign, @JsonKey(name: 'song_list_size')  int songListSize, @JsonKey(name: 'song_list')  List<Song> songList)?  $default,) {final _that = this;
switch (_that) {
case _RecommendResponse() when $default != null:
return $default(_that.sign,_that.songListSize,_that.songList);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendResponse implements RecommendResponse {
  const _RecommendResponse({@JsonKey(name: 'sign') required this.sign, @JsonKey(name: 'song_list_size') required this.songListSize, @JsonKey(name: 'song_list') final  List<Song> songList = const []}): _songList = songList;
  factory _RecommendResponse.fromJson(Map<String, dynamic> json) => _$RecommendResponseFromJson(json);

@override@JsonKey(name: 'sign') final  String sign;
@override@JsonKey(name: 'song_list_size') final  int songListSize;
 final  List<Song> _songList;
@override@JsonKey(name: 'song_list') List<Song> get songList {
  if (_songList is EqualUnmodifiableListView) return _songList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songList);
}


/// Create a copy of RecommendResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendResponseCopyWith<_RecommendResponse> get copyWith => __$RecommendResponseCopyWithImpl<_RecommendResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendResponse&&(identical(other.sign, sign) || other.sign == sign)&&(identical(other.songListSize, songListSize) || other.songListSize == songListSize)&&const DeepCollectionEquality().equals(other._songList, _songList));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sign,songListSize,const DeepCollectionEquality().hash(_songList));

@override
String toString() {
  return 'RecommendResponse(sign: $sign, songListSize: $songListSize, songList: $songList)';
}


}

/// @nodoc
abstract mixin class _$RecommendResponseCopyWith<$Res> implements $RecommendResponseCopyWith<$Res> {
  factory _$RecommendResponseCopyWith(_RecommendResponse value, $Res Function(_RecommendResponse) _then) = __$RecommendResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sign') String sign,@JsonKey(name: 'song_list_size') int songListSize,@JsonKey(name: 'song_list') List<Song> songList
});




}
/// @nodoc
class __$RecommendResponseCopyWithImpl<$Res>
    implements _$RecommendResponseCopyWith<$Res> {
  __$RecommendResponseCopyWithImpl(this._self, this._then);

  final _RecommendResponse _self;
  final $Res Function(_RecommendResponse) _then;

/// Create a copy of RecommendResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sign = null,Object? songListSize = null,Object? songList = null,}) {
  return _then(_RecommendResponse(
sign: null == sign ? _self.sign : sign // ignore: cast_nullable_to_non_nullable
as String,songListSize: null == songListSize ? _self.songListSize : songListSize // ignore: cast_nullable_to_non_nullable
as int,songList: null == songList ? _self._songList : songList // ignore: cast_nullable_to_non_nullable
as List<Song>,
  ));
}


}

// dart format on

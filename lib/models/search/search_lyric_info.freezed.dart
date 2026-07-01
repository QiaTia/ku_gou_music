// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_lyric_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchLyricInfo {

/// 歌词ID
@IntFromStringConverter() int get id;/// 歌词访问密钥
 String get accesskey;/// 歌曲名
@JsonKey(name: 'songname') String get songName;/// 歌手名
@JsonKey(name: 'singername') String get singerName;/// 歌曲hash
 String get hash;/// 歌曲时长
@IntFromStringConverter()@JsonKey(name: 'duration') int get duration;/// 专辑ID
@IntFromStringConverter()@JsonKey(name: 'album_id') int get albumId;/// 专辑音频ID
@IntFromStringConverter()@JsonKey(name: 'album_audio_id') int get albumAudioId;
/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchLyricInfoCopyWith<SearchLyricInfo> get copyWith => _$SearchLyricInfoCopyWithImpl<SearchLyricInfo>(this as SearchLyricInfo, _$identity);

  /// Serializes this SearchLyricInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLyricInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.accesskey, accesskey) || other.accesskey == accesskey)&&(identical(other.songName, songName) || other.songName == songName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumAudioId, albumAudioId) || other.albumAudioId == albumAudioId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accesskey,songName,singerName,hash,duration,albumId,albumAudioId);

@override
String toString() {
  return 'SearchLyricInfo(id: $id, accesskey: $accesskey, songName: $songName, singerName: $singerName, hash: $hash, duration: $duration, albumId: $albumId, albumAudioId: $albumAudioId)';
}


}

/// @nodoc
abstract mixin class $SearchLyricInfoCopyWith<$Res>  {
  factory $SearchLyricInfoCopyWith(SearchLyricInfo value, $Res Function(SearchLyricInfo) _then) = _$SearchLyricInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter() int id, String accesskey,@JsonKey(name: 'songname') String songName,@JsonKey(name: 'singername') String singerName, String hash,@IntFromStringConverter()@JsonKey(name: 'duration') int duration,@IntFromStringConverter()@JsonKey(name: 'album_id') int albumId,@IntFromStringConverter()@JsonKey(name: 'album_audio_id') int albumAudioId
});




}
/// @nodoc
class _$SearchLyricInfoCopyWithImpl<$Res>
    implements $SearchLyricInfoCopyWith<$Res> {
  _$SearchLyricInfoCopyWithImpl(this._self, this._then);

  final SearchLyricInfo _self;
  final $Res Function(SearchLyricInfo) _then;

/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accesskey = null,Object? songName = null,Object? singerName = null,Object? hash = null,Object? duration = null,Object? albumId = null,Object? albumAudioId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accesskey: null == accesskey ? _self.accesskey : accesskey // ignore: cast_nullable_to_non_nullable
as String,songName: null == songName ? _self.songName : songName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumAudioId: null == albumAudioId ? _self.albumAudioId : albumAudioId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchLyricInfo].
extension SearchLyricInfoPatterns on SearchLyricInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchLyricInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchLyricInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchLyricInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchLyricInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int id,  String accesskey, @JsonKey(name: 'songname')  String songName, @JsonKey(name: 'singername')  String singerName,  String hash, @IntFromStringConverter()@JsonKey(name: 'duration')  int duration, @IntFromStringConverter()@JsonKey(name: 'album_id')  int albumId, @IntFromStringConverter()@JsonKey(name: 'album_audio_id')  int albumAudioId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
return $default(_that.id,_that.accesskey,_that.songName,_that.singerName,_that.hash,_that.duration,_that.albumId,_that.albumAudioId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()  int id,  String accesskey, @JsonKey(name: 'songname')  String songName, @JsonKey(name: 'singername')  String singerName,  String hash, @IntFromStringConverter()@JsonKey(name: 'duration')  int duration, @IntFromStringConverter()@JsonKey(name: 'album_id')  int albumId, @IntFromStringConverter()@JsonKey(name: 'album_audio_id')  int albumAudioId)  $default,) {final _that = this;
switch (_that) {
case _SearchLyricInfo():
return $default(_that.id,_that.accesskey,_that.songName,_that.singerName,_that.hash,_that.duration,_that.albumId,_that.albumAudioId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()  int id,  String accesskey, @JsonKey(name: 'songname')  String songName, @JsonKey(name: 'singername')  String singerName,  String hash, @IntFromStringConverter()@JsonKey(name: 'duration')  int duration, @IntFromStringConverter()@JsonKey(name: 'album_id')  int albumId, @IntFromStringConverter()@JsonKey(name: 'album_audio_id')  int albumAudioId)?  $default,) {final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
return $default(_that.id,_that.accesskey,_that.songName,_that.singerName,_that.hash,_that.duration,_that.albumId,_that.albumAudioId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchLyricInfo implements SearchLyricInfo {
  const _SearchLyricInfo({@IntFromStringConverter() required this.id, this.accesskey = '', @JsonKey(name: 'songname') this.songName = '', @JsonKey(name: 'singername') this.singerName = '', this.hash = '', @IntFromStringConverter()@JsonKey(name: 'duration') this.duration = 0, @IntFromStringConverter()@JsonKey(name: 'album_id') this.albumId = 0, @IntFromStringConverter()@JsonKey(name: 'album_audio_id') this.albumAudioId = 0});
  factory _SearchLyricInfo.fromJson(Map<String, dynamic> json) => _$SearchLyricInfoFromJson(json);

/// 歌词ID
@override@IntFromStringConverter() final  int id;
/// 歌词访问密钥
@override@JsonKey() final  String accesskey;
/// 歌曲名
@override@JsonKey(name: 'songname') final  String songName;
/// 歌手名
@override@JsonKey(name: 'singername') final  String singerName;
/// 歌曲hash
@override@JsonKey() final  String hash;
/// 歌曲时长
@override@IntFromStringConverter()@JsonKey(name: 'duration') final  int duration;
/// 专辑ID
@override@IntFromStringConverter()@JsonKey(name: 'album_id') final  int albumId;
/// 专辑音频ID
@override@IntFromStringConverter()@JsonKey(name: 'album_audio_id') final  int albumAudioId;

/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchLyricInfoCopyWith<_SearchLyricInfo> get copyWith => __$SearchLyricInfoCopyWithImpl<_SearchLyricInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchLyricInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchLyricInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.accesskey, accesskey) || other.accesskey == accesskey)&&(identical(other.songName, songName) || other.songName == songName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumAudioId, albumAudioId) || other.albumAudioId == albumAudioId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accesskey,songName,singerName,hash,duration,albumId,albumAudioId);

@override
String toString() {
  return 'SearchLyricInfo(id: $id, accesskey: $accesskey, songName: $songName, singerName: $singerName, hash: $hash, duration: $duration, albumId: $albumId, albumAudioId: $albumAudioId)';
}


}

/// @nodoc
abstract mixin class _$SearchLyricInfoCopyWith<$Res> implements $SearchLyricInfoCopyWith<$Res> {
  factory _$SearchLyricInfoCopyWith(_SearchLyricInfo value, $Res Function(_SearchLyricInfo) _then) = __$SearchLyricInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter() int id, String accesskey,@JsonKey(name: 'songname') String songName,@JsonKey(name: 'singername') String singerName, String hash,@IntFromStringConverter()@JsonKey(name: 'duration') int duration,@IntFromStringConverter()@JsonKey(name: 'album_id') int albumId,@IntFromStringConverter()@JsonKey(name: 'album_audio_id') int albumAudioId
});




}
/// @nodoc
class __$SearchLyricInfoCopyWithImpl<$Res>
    implements _$SearchLyricInfoCopyWith<$Res> {
  __$SearchLyricInfoCopyWithImpl(this._self, this._then);

  final _SearchLyricInfo _self;
  final $Res Function(_SearchLyricInfo) _then;

/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accesskey = null,Object? songName = null,Object? singerName = null,Object? hash = null,Object? duration = null,Object? albumId = null,Object? albumAudioId = null,}) {
  return _then(_SearchLyricInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accesskey: null == accesskey ? _self.accesskey : accesskey // ignore: cast_nullable_to_non_nullable
as String,songName: null == songName ? _self.songName : songName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumAudioId: null == albumAudioId ? _self.albumAudioId : albumAudioId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

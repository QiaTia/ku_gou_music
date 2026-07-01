// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_album_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchAlbumInfo {

/// 专辑ID
@IntFromStringConverter()@JsonKey(name: 'albumid') int get albumId;/// 专辑名称
@JsonKey(name: 'albumname') String get albumName;/// 歌手名
@JsonKey(name: 'singername') String get singerName;/// 封面图
@JsonKey(name: 'imgurl') String get imgUrl;/// 介绍
 String get intro;/// 发布日期
@JsonKey(name: 'publish_date') String get publishDate;/// 歌曲数量
@IntFromStringConverter()@JsonKey(name: 'song_count') int get songCount;/// 类型标识
@IntFromStringConverter() int get type;
/// Create a copy of SearchAlbumInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchAlbumInfoCopyWith<SearchAlbumInfo> get copyWith => _$SearchAlbumInfoCopyWithImpl<SearchAlbumInfo>(this as SearchAlbumInfo, _$identity);

  /// Serializes this SearchAlbumInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAlbumInfo&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,albumId,albumName,singerName,imgUrl,intro,publishDate,songCount,type);

@override
String toString() {
  return 'SearchAlbumInfo(albumId: $albumId, albumName: $albumName, singerName: $singerName, imgUrl: $imgUrl, intro: $intro, publishDate: $publishDate, songCount: $songCount, type: $type)';
}


}

/// @nodoc
abstract mixin class $SearchAlbumInfoCopyWith<$Res>  {
  factory $SearchAlbumInfoCopyWith(SearchAlbumInfo value, $Res Function(SearchAlbumInfo) _then) = _$SearchAlbumInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'albumid') int albumId,@JsonKey(name: 'albumname') String albumName,@JsonKey(name: 'singername') String singerName,@JsonKey(name: 'imgurl') String imgUrl, String intro,@JsonKey(name: 'publish_date') String publishDate,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@IntFromStringConverter() int type
});




}
/// @nodoc
class _$SearchAlbumInfoCopyWithImpl<$Res>
    implements $SearchAlbumInfoCopyWith<$Res> {
  _$SearchAlbumInfoCopyWithImpl(this._self, this._then);

  final SearchAlbumInfo _self;
  final $Res Function(SearchAlbumInfo) _then;

/// Create a copy of SearchAlbumInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? albumId = null,Object? albumName = null,Object? singerName = null,Object? imgUrl = null,Object? intro = null,Object? publishDate = null,Object? songCount = null,Object? type = null,}) {
  return _then(_self.copyWith(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchAlbumInfo].
extension SearchAlbumInfoPatterns on SearchAlbumInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchAlbumInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchAlbumInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchAlbumInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchAlbumInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchAlbumInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchAlbumInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl,  String intro, @JsonKey(name: 'publish_date')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()  int type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAlbumInfo() when $default != null:
return $default(_that.albumId,_that.albumName,_that.singerName,_that.imgUrl,_that.intro,_that.publishDate,_that.songCount,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl,  String intro, @JsonKey(name: 'publish_date')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()  int type)  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumInfo():
return $default(_that.albumId,_that.albumName,_that.singerName,_that.imgUrl,_that.intro,_that.publishDate,_that.songCount,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl,  String intro, @JsonKey(name: 'publish_date')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()  int type)?  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumInfo() when $default != null:
return $default(_that.albumId,_that.albumName,_that.singerName,_that.imgUrl,_that.intro,_that.publishDate,_that.songCount,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchAlbumInfo implements SearchAlbumInfo {
  const _SearchAlbumInfo({@IntFromStringConverter()@JsonKey(name: 'albumid') this.albumId = 0, @JsonKey(name: 'albumname') this.albumName = '', @JsonKey(name: 'singername') this.singerName = '', @JsonKey(name: 'imgurl') this.imgUrl = '', this.intro = '', @JsonKey(name: 'publish_date') this.publishDate = '', @IntFromStringConverter()@JsonKey(name: 'song_count') this.songCount = 0, @IntFromStringConverter() this.type = 0});
  factory _SearchAlbumInfo.fromJson(Map<String, dynamic> json) => _$SearchAlbumInfoFromJson(json);

/// 专辑ID
@override@IntFromStringConverter()@JsonKey(name: 'albumid') final  int albumId;
/// 专辑名称
@override@JsonKey(name: 'albumname') final  String albumName;
/// 歌手名
@override@JsonKey(name: 'singername') final  String singerName;
/// 封面图
@override@JsonKey(name: 'imgurl') final  String imgUrl;
/// 介绍
@override@JsonKey() final  String intro;
/// 发布日期
@override@JsonKey(name: 'publish_date') final  String publishDate;
/// 歌曲数量
@override@IntFromStringConverter()@JsonKey(name: 'song_count') final  int songCount;
/// 类型标识
@override@JsonKey()@IntFromStringConverter() final  int type;

/// Create a copy of SearchAlbumInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchAlbumInfoCopyWith<_SearchAlbumInfo> get copyWith => __$SearchAlbumInfoCopyWithImpl<_SearchAlbumInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchAlbumInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAlbumInfo&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,albumId,albumName,singerName,imgUrl,intro,publishDate,songCount,type);

@override
String toString() {
  return 'SearchAlbumInfo(albumId: $albumId, albumName: $albumName, singerName: $singerName, imgUrl: $imgUrl, intro: $intro, publishDate: $publishDate, songCount: $songCount, type: $type)';
}


}

/// @nodoc
abstract mixin class _$SearchAlbumInfoCopyWith<$Res> implements $SearchAlbumInfoCopyWith<$Res> {
  factory _$SearchAlbumInfoCopyWith(_SearchAlbumInfo value, $Res Function(_SearchAlbumInfo) _then) = __$SearchAlbumInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'albumid') int albumId,@JsonKey(name: 'albumname') String albumName,@JsonKey(name: 'singername') String singerName,@JsonKey(name: 'imgurl') String imgUrl, String intro,@JsonKey(name: 'publish_date') String publishDate,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@IntFromStringConverter() int type
});




}
/// @nodoc
class __$SearchAlbumInfoCopyWithImpl<$Res>
    implements _$SearchAlbumInfoCopyWith<$Res> {
  __$SearchAlbumInfoCopyWithImpl(this._self, this._then);

  final _SearchAlbumInfo _self;
  final $Res Function(_SearchAlbumInfo) _then;

/// Create a copy of SearchAlbumInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? albumId = null,Object? albumName = null,Object? singerName = null,Object? imgUrl = null,Object? intro = null,Object? publishDate = null,Object? songCount = null,Object? type = null,}) {
  return _then(_SearchAlbumInfo(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_author_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchAuthorInfo {

/// 歌手ID
@IntFromStringConverter()@JsonKey(name: 'authorid') int get authorId;/// 歌手名
@JsonKey(name: 'author_name') String get authorName;/// 歌手头像
@JsonKey(name: 'imgurl') String get imgUrl;/// 歌曲数量
@IntFromStringConverter()@JsonKey(name: 'song_count') int get songCount;/// 专辑数量
@IntFromStringConverter()@JsonKey(name: 'album_count') int get albumCount;/// MV数量
@IntFromStringConverter()@JsonKey(name: 'mv_count') int get mvCount;/// 粉丝数量
@IntFromStringConverter()@JsonKey(name: 'fans_count') int get fansCount;/// 是否认证
@IntFromStringConverter()@JsonKey(name: 'is_publish') int get isPublish;
/// Create a copy of SearchAuthorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchAuthorInfoCopyWith<SearchAuthorInfo> get copyWith => _$SearchAuthorInfoCopyWithImpl<SearchAuthorInfo>(this as SearchAuthorInfo, _$identity);

  /// Serializes this SearchAuthorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAuthorInfo&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.albumCount, albumCount) || other.albumCount == albumCount)&&(identical(other.mvCount, mvCount) || other.mvCount == mvCount)&&(identical(other.fansCount, fansCount) || other.fansCount == fansCount)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorId,authorName,imgUrl,songCount,albumCount,mvCount,fansCount,isPublish);

@override
String toString() {
  return 'SearchAuthorInfo(authorId: $authorId, authorName: $authorName, imgUrl: $imgUrl, songCount: $songCount, albumCount: $albumCount, mvCount: $mvCount, fansCount: $fansCount, isPublish: $isPublish)';
}


}

/// @nodoc
abstract mixin class $SearchAuthorInfoCopyWith<$Res>  {
  factory $SearchAuthorInfoCopyWith(SearchAuthorInfo value, $Res Function(SearchAuthorInfo) _then) = _$SearchAuthorInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'authorid') int authorId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'imgurl') String imgUrl,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@IntFromStringConverter()@JsonKey(name: 'album_count') int albumCount,@IntFromStringConverter()@JsonKey(name: 'mv_count') int mvCount,@IntFromStringConverter()@JsonKey(name: 'fans_count') int fansCount,@IntFromStringConverter()@JsonKey(name: 'is_publish') int isPublish
});




}
/// @nodoc
class _$SearchAuthorInfoCopyWithImpl<$Res>
    implements $SearchAuthorInfoCopyWith<$Res> {
  _$SearchAuthorInfoCopyWithImpl(this._self, this._then);

  final SearchAuthorInfo _self;
  final $Res Function(SearchAuthorInfo) _then;

/// Create a copy of SearchAuthorInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authorId = null,Object? authorName = null,Object? imgUrl = null,Object? songCount = null,Object? albumCount = null,Object? mvCount = null,Object? fansCount = null,Object? isPublish = null,}) {
  return _then(_self.copyWith(
authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,albumCount: null == albumCount ? _self.albumCount : albumCount // ignore: cast_nullable_to_non_nullable
as int,mvCount: null == mvCount ? _self.mvCount : mvCount // ignore: cast_nullable_to_non_nullable
as int,fansCount: null == fansCount ? _self.fansCount : fansCount // ignore: cast_nullable_to_non_nullable
as int,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchAuthorInfo].
extension SearchAuthorInfoPatterns on SearchAuthorInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchAuthorInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchAuthorInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchAuthorInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchAuthorInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchAuthorInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchAuthorInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'authorid')  int authorId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'imgurl')  String imgUrl, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()@JsonKey(name: 'album_count')  int albumCount, @IntFromStringConverter()@JsonKey(name: 'mv_count')  int mvCount, @IntFromStringConverter()@JsonKey(name: 'fans_count')  int fansCount, @IntFromStringConverter()@JsonKey(name: 'is_publish')  int isPublish)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAuthorInfo() when $default != null:
return $default(_that.authorId,_that.authorName,_that.imgUrl,_that.songCount,_that.albumCount,_that.mvCount,_that.fansCount,_that.isPublish);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'authorid')  int authorId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'imgurl')  String imgUrl, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()@JsonKey(name: 'album_count')  int albumCount, @IntFromStringConverter()@JsonKey(name: 'mv_count')  int mvCount, @IntFromStringConverter()@JsonKey(name: 'fans_count')  int fansCount, @IntFromStringConverter()@JsonKey(name: 'is_publish')  int isPublish)  $default,) {final _that = this;
switch (_that) {
case _SearchAuthorInfo():
return $default(_that.authorId,_that.authorName,_that.imgUrl,_that.songCount,_that.albumCount,_that.mvCount,_that.fansCount,_that.isPublish);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'authorid')  int authorId, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'imgurl')  String imgUrl, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()@JsonKey(name: 'album_count')  int albumCount, @IntFromStringConverter()@JsonKey(name: 'mv_count')  int mvCount, @IntFromStringConverter()@JsonKey(name: 'fans_count')  int fansCount, @IntFromStringConverter()@JsonKey(name: 'is_publish')  int isPublish)?  $default,) {final _that = this;
switch (_that) {
case _SearchAuthorInfo() when $default != null:
return $default(_that.authorId,_that.authorName,_that.imgUrl,_that.songCount,_that.albumCount,_that.mvCount,_that.fansCount,_that.isPublish);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchAuthorInfo implements SearchAuthorInfo {
  const _SearchAuthorInfo({@IntFromStringConverter()@JsonKey(name: 'authorid') this.authorId = 0, @JsonKey(name: 'author_name') this.authorName = '', @JsonKey(name: 'imgurl') this.imgUrl = '', @IntFromStringConverter()@JsonKey(name: 'song_count') this.songCount = 0, @IntFromStringConverter()@JsonKey(name: 'album_count') this.albumCount = 0, @IntFromStringConverter()@JsonKey(name: 'mv_count') this.mvCount = 0, @IntFromStringConverter()@JsonKey(name: 'fans_count') this.fansCount = 0, @IntFromStringConverter()@JsonKey(name: 'is_publish') this.isPublish = 0});
  factory _SearchAuthorInfo.fromJson(Map<String, dynamic> json) => _$SearchAuthorInfoFromJson(json);

/// 歌手ID
@override@IntFromStringConverter()@JsonKey(name: 'authorid') final  int authorId;
/// 歌手名
@override@JsonKey(name: 'author_name') final  String authorName;
/// 歌手头像
@override@JsonKey(name: 'imgurl') final  String imgUrl;
/// 歌曲数量
@override@IntFromStringConverter()@JsonKey(name: 'song_count') final  int songCount;
/// 专辑数量
@override@IntFromStringConverter()@JsonKey(name: 'album_count') final  int albumCount;
/// MV数量
@override@IntFromStringConverter()@JsonKey(name: 'mv_count') final  int mvCount;
/// 粉丝数量
@override@IntFromStringConverter()@JsonKey(name: 'fans_count') final  int fansCount;
/// 是否认证
@override@IntFromStringConverter()@JsonKey(name: 'is_publish') final  int isPublish;

/// Create a copy of SearchAuthorInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchAuthorInfoCopyWith<_SearchAuthorInfo> get copyWith => __$SearchAuthorInfoCopyWithImpl<_SearchAuthorInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchAuthorInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAuthorInfo&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.albumCount, albumCount) || other.albumCount == albumCount)&&(identical(other.mvCount, mvCount) || other.mvCount == mvCount)&&(identical(other.fansCount, fansCount) || other.fansCount == fansCount)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorId,authorName,imgUrl,songCount,albumCount,mvCount,fansCount,isPublish);

@override
String toString() {
  return 'SearchAuthorInfo(authorId: $authorId, authorName: $authorName, imgUrl: $imgUrl, songCount: $songCount, albumCount: $albumCount, mvCount: $mvCount, fansCount: $fansCount, isPublish: $isPublish)';
}


}

/// @nodoc
abstract mixin class _$SearchAuthorInfoCopyWith<$Res> implements $SearchAuthorInfoCopyWith<$Res> {
  factory _$SearchAuthorInfoCopyWith(_SearchAuthorInfo value, $Res Function(_SearchAuthorInfo) _then) = __$SearchAuthorInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'authorid') int authorId,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'imgurl') String imgUrl,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@IntFromStringConverter()@JsonKey(name: 'album_count') int albumCount,@IntFromStringConverter()@JsonKey(name: 'mv_count') int mvCount,@IntFromStringConverter()@JsonKey(name: 'fans_count') int fansCount,@IntFromStringConverter()@JsonKey(name: 'is_publish') int isPublish
});




}
/// @nodoc
class __$SearchAuthorInfoCopyWithImpl<$Res>
    implements _$SearchAuthorInfoCopyWith<$Res> {
  __$SearchAuthorInfoCopyWithImpl(this._self, this._then);

  final _SearchAuthorInfo _self;
  final $Res Function(_SearchAuthorInfo) _then;

/// Create a copy of SearchAuthorInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authorId = null,Object? authorName = null,Object? imgUrl = null,Object? songCount = null,Object? albumCount = null,Object? mvCount = null,Object? fansCount = null,Object? isPublish = null,}) {
  return _then(_SearchAuthorInfo(
authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,albumCount: null == albumCount ? _self.albumCount : albumCount // ignore: cast_nullable_to_non_nullable
as int,mvCount: null == mvCount ? _self.mvCount : mvCount // ignore: cast_nullable_to_non_nullable
as int,fansCount: null == fansCount ? _self.fansCount : fansCount // ignore: cast_nullable_to_non_nullable
as int,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

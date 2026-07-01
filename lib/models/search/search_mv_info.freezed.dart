// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_mv_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchMvInfo {

/// MV ID
@IntFromStringConverter()@JsonKey(name: 'mvid') int get mvId;/// MV名称
@JsonKey(name: 'mvname') String get mvName;/// 歌手名
@JsonKey(name: 'singername') String get singerName;/// 封面图
@JsonKey(name: 'imgurl') String get imgUrl;/// 播放次数
@IntFromStringConverter()@JsonKey(name: 'play_count') int get playCount;/// 发布日期
@JsonKey(name: 'publish_date') String get publishDate;/// MV时长(秒)
@IntFromStringConverter()@JsonKey(name: 'time_length') int get timeLength;/// 关联歌曲hash
 String get hash;/// 关联歌曲ID
@IntFromStringConverter()@JsonKey(name: 'songid') int get songId;
/// Create a copy of SearchMvInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMvInfoCopyWith<SearchMvInfo> get copyWith => _$SearchMvInfoCopyWithImpl<SearchMvInfo>(this as SearchMvInfo, _$identity);

  /// Serializes this SearchMvInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMvInfo&&(identical(other.mvId, mvId) || other.mvId == mvId)&&(identical(other.mvName, mvName) || other.mvName == mvName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.timeLength, timeLength) || other.timeLength == timeLength)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.songId, songId) || other.songId == songId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mvId,mvName,singerName,imgUrl,playCount,publishDate,timeLength,hash,songId);

@override
String toString() {
  return 'SearchMvInfo(mvId: $mvId, mvName: $mvName, singerName: $singerName, imgUrl: $imgUrl, playCount: $playCount, publishDate: $publishDate, timeLength: $timeLength, hash: $hash, songId: $songId)';
}


}

/// @nodoc
abstract mixin class $SearchMvInfoCopyWith<$Res>  {
  factory $SearchMvInfoCopyWith(SearchMvInfo value, $Res Function(SearchMvInfo) _then) = _$SearchMvInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'mvid') int mvId,@JsonKey(name: 'mvname') String mvName,@JsonKey(name: 'singername') String singerName,@JsonKey(name: 'imgurl') String imgUrl,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@JsonKey(name: 'publish_date') String publishDate,@IntFromStringConverter()@JsonKey(name: 'time_length') int timeLength, String hash,@IntFromStringConverter()@JsonKey(name: 'songid') int songId
});




}
/// @nodoc
class _$SearchMvInfoCopyWithImpl<$Res>
    implements $SearchMvInfoCopyWith<$Res> {
  _$SearchMvInfoCopyWithImpl(this._self, this._then);

  final SearchMvInfo _self;
  final $Res Function(SearchMvInfo) _then;

/// Create a copy of SearchMvInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mvId = null,Object? mvName = null,Object? singerName = null,Object? imgUrl = null,Object? playCount = null,Object? publishDate = null,Object? timeLength = null,Object? hash = null,Object? songId = null,}) {
  return _then(_self.copyWith(
mvId: null == mvId ? _self.mvId : mvId // ignore: cast_nullable_to_non_nullable
as int,mvName: null == mvName ? _self.mvName : mvName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,timeLength: null == timeLength ? _self.timeLength : timeLength // ignore: cast_nullable_to_non_nullable
as int,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,songId: null == songId ? _self.songId : songId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchMvInfo].
extension SearchMvInfoPatterns on SearchMvInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchMvInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchMvInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchMvInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchMvInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchMvInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchMvInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'mvid')  int mvId, @JsonKey(name: 'mvname')  String mvName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @JsonKey(name: 'publish_date')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'time_length')  int timeLength,  String hash, @IntFromStringConverter()@JsonKey(name: 'songid')  int songId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchMvInfo() when $default != null:
return $default(_that.mvId,_that.mvName,_that.singerName,_that.imgUrl,_that.playCount,_that.publishDate,_that.timeLength,_that.hash,_that.songId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'mvid')  int mvId, @JsonKey(name: 'mvname')  String mvName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @JsonKey(name: 'publish_date')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'time_length')  int timeLength,  String hash, @IntFromStringConverter()@JsonKey(name: 'songid')  int songId)  $default,) {final _that = this;
switch (_that) {
case _SearchMvInfo():
return $default(_that.mvId,_that.mvName,_that.singerName,_that.imgUrl,_that.playCount,_that.publishDate,_that.timeLength,_that.hash,_that.songId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'mvid')  int mvId, @JsonKey(name: 'mvname')  String mvName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @JsonKey(name: 'publish_date')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'time_length')  int timeLength,  String hash, @IntFromStringConverter()@JsonKey(name: 'songid')  int songId)?  $default,) {final _that = this;
switch (_that) {
case _SearchMvInfo() when $default != null:
return $default(_that.mvId,_that.mvName,_that.singerName,_that.imgUrl,_that.playCount,_that.publishDate,_that.timeLength,_that.hash,_that.songId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchMvInfo implements SearchMvInfo {
  const _SearchMvInfo({@IntFromStringConverter()@JsonKey(name: 'mvid') this.mvId = 0, @JsonKey(name: 'mvname') this.mvName = '', @JsonKey(name: 'singername') this.singerName = '', @JsonKey(name: 'imgurl') this.imgUrl = '', @IntFromStringConverter()@JsonKey(name: 'play_count') this.playCount = 0, @JsonKey(name: 'publish_date') this.publishDate = '', @IntFromStringConverter()@JsonKey(name: 'time_length') this.timeLength = 0, this.hash = '', @IntFromStringConverter()@JsonKey(name: 'songid') this.songId = 0});
  factory _SearchMvInfo.fromJson(Map<String, dynamic> json) => _$SearchMvInfoFromJson(json);

/// MV ID
@override@IntFromStringConverter()@JsonKey(name: 'mvid') final  int mvId;
/// MV名称
@override@JsonKey(name: 'mvname') final  String mvName;
/// 歌手名
@override@JsonKey(name: 'singername') final  String singerName;
/// 封面图
@override@JsonKey(name: 'imgurl') final  String imgUrl;
/// 播放次数
@override@IntFromStringConverter()@JsonKey(name: 'play_count') final  int playCount;
/// 发布日期
@override@JsonKey(name: 'publish_date') final  String publishDate;
/// MV时长(秒)
@override@IntFromStringConverter()@JsonKey(name: 'time_length') final  int timeLength;
/// 关联歌曲hash
@override@JsonKey() final  String hash;
/// 关联歌曲ID
@override@IntFromStringConverter()@JsonKey(name: 'songid') final  int songId;

/// Create a copy of SearchMvInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchMvInfoCopyWith<_SearchMvInfo> get copyWith => __$SearchMvInfoCopyWithImpl<_SearchMvInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchMvInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchMvInfo&&(identical(other.mvId, mvId) || other.mvId == mvId)&&(identical(other.mvName, mvName) || other.mvName == mvName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.timeLength, timeLength) || other.timeLength == timeLength)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.songId, songId) || other.songId == songId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mvId,mvName,singerName,imgUrl,playCount,publishDate,timeLength,hash,songId);

@override
String toString() {
  return 'SearchMvInfo(mvId: $mvId, mvName: $mvName, singerName: $singerName, imgUrl: $imgUrl, playCount: $playCount, publishDate: $publishDate, timeLength: $timeLength, hash: $hash, songId: $songId)';
}


}

/// @nodoc
abstract mixin class _$SearchMvInfoCopyWith<$Res> implements $SearchMvInfoCopyWith<$Res> {
  factory _$SearchMvInfoCopyWith(_SearchMvInfo value, $Res Function(_SearchMvInfo) _then) = __$SearchMvInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'mvid') int mvId,@JsonKey(name: 'mvname') String mvName,@JsonKey(name: 'singername') String singerName,@JsonKey(name: 'imgurl') String imgUrl,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@JsonKey(name: 'publish_date') String publishDate,@IntFromStringConverter()@JsonKey(name: 'time_length') int timeLength, String hash,@IntFromStringConverter()@JsonKey(name: 'songid') int songId
});




}
/// @nodoc
class __$SearchMvInfoCopyWithImpl<$Res>
    implements _$SearchMvInfoCopyWith<$Res> {
  __$SearchMvInfoCopyWithImpl(this._self, this._then);

  final _SearchMvInfo _self;
  final $Res Function(_SearchMvInfo) _then;

/// Create a copy of SearchMvInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mvId = null,Object? mvName = null,Object? singerName = null,Object? imgUrl = null,Object? playCount = null,Object? publishDate = null,Object? timeLength = null,Object? hash = null,Object? songId = null,}) {
  return _then(_SearchMvInfo(
mvId: null == mvId ? _self.mvId : mvId // ignore: cast_nullable_to_non_nullable
as int,mvName: null == mvName ? _self.mvName : mvName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,timeLength: null == timeLength ? _self.timeLength : timeLength // ignore: cast_nullable_to_non_nullable
as int,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,songId: null == songId ? _self.songId : songId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

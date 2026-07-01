// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_special_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchSpecialInfo {

/// 歌单ID
@IntFromStringConverter()@JsonKey(name: 'specialid') int get specialId;/// 歌单名称
@JsonKey(name: 'specialname') String get specialName;/// 歌手名
@JsonKey(name: 'singername') String get singerName;/// 封面图
@JsonKey(name: 'imgurl') String get imgUrl;/// 介绍
 String get intro;/// 播放次数
@IntFromStringConverter()@JsonKey(name: 'play_count') int get playCount;/// 收藏数
@IntFromStringConverter() int get collectcount;/// 全局收藏ID
@JsonKey(name: 'global_collection_id') String get globalCollectionId;/// 创建者昵称
 String get nickname;/// 歌曲数量
@IntFromStringConverter()@JsonKey(name: 'song_count') int get songCount;/// 标签
 String get tag;/// 发布时间
 String get publishtime;
/// Create a copy of SearchSpecialInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSpecialInfoCopyWith<SearchSpecialInfo> get copyWith => _$SearchSpecialInfoCopyWithImpl<SearchSpecialInfo>(this as SearchSpecialInfo, _$identity);

  /// Serializes this SearchSpecialInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSpecialInfo&&(identical(other.specialId, specialId) || other.specialId == specialId)&&(identical(other.specialName, specialName) || other.specialName == specialName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.collectcount, collectcount) || other.collectcount == collectcount)&&(identical(other.globalCollectionId, globalCollectionId) || other.globalCollectionId == globalCollectionId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.publishtime, publishtime) || other.publishtime == publishtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,specialId,specialName,singerName,imgUrl,intro,playCount,collectcount,globalCollectionId,nickname,songCount,tag,publishtime);

@override
String toString() {
  return 'SearchSpecialInfo(specialId: $specialId, specialName: $specialName, singerName: $singerName, imgUrl: $imgUrl, intro: $intro, playCount: $playCount, collectcount: $collectcount, globalCollectionId: $globalCollectionId, nickname: $nickname, songCount: $songCount, tag: $tag, publishtime: $publishtime)';
}


}

/// @nodoc
abstract mixin class $SearchSpecialInfoCopyWith<$Res>  {
  factory $SearchSpecialInfoCopyWith(SearchSpecialInfo value, $Res Function(SearchSpecialInfo) _then) = _$SearchSpecialInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'specialid') int specialId,@JsonKey(name: 'specialname') String specialName,@JsonKey(name: 'singername') String singerName,@JsonKey(name: 'imgurl') String imgUrl, String intro,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@IntFromStringConverter() int collectcount,@JsonKey(name: 'global_collection_id') String globalCollectionId, String nickname,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount, String tag, String publishtime
});




}
/// @nodoc
class _$SearchSpecialInfoCopyWithImpl<$Res>
    implements $SearchSpecialInfoCopyWith<$Res> {
  _$SearchSpecialInfoCopyWithImpl(this._self, this._then);

  final SearchSpecialInfo _self;
  final $Res Function(SearchSpecialInfo) _then;

/// Create a copy of SearchSpecialInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? specialId = null,Object? specialName = null,Object? singerName = null,Object? imgUrl = null,Object? intro = null,Object? playCount = null,Object? collectcount = null,Object? globalCollectionId = null,Object? nickname = null,Object? songCount = null,Object? tag = null,Object? publishtime = null,}) {
  return _then(_self.copyWith(
specialId: null == specialId ? _self.specialId : specialId // ignore: cast_nullable_to_non_nullable
as int,specialName: null == specialName ? _self.specialName : specialName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,collectcount: null == collectcount ? _self.collectcount : collectcount // ignore: cast_nullable_to_non_nullable
as int,globalCollectionId: null == globalCollectionId ? _self.globalCollectionId : globalCollectionId // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,publishtime: null == publishtime ? _self.publishtime : publishtime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSpecialInfo].
extension SearchSpecialInfoPatterns on SearchSpecialInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSpecialInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSpecialInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSpecialInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchSpecialInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSpecialInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSpecialInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl,  String intro, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()  int collectcount, @JsonKey(name: 'global_collection_id')  String globalCollectionId,  String nickname, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount,  String tag,  String publishtime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSpecialInfo() when $default != null:
return $default(_that.specialId,_that.specialName,_that.singerName,_that.imgUrl,_that.intro,_that.playCount,_that.collectcount,_that.globalCollectionId,_that.nickname,_that.songCount,_that.tag,_that.publishtime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl,  String intro, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()  int collectcount, @JsonKey(name: 'global_collection_id')  String globalCollectionId,  String nickname, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount,  String tag,  String publishtime)  $default,) {final _that = this;
switch (_that) {
case _SearchSpecialInfo():
return $default(_that.specialId,_that.specialName,_that.singerName,_that.imgUrl,_that.intro,_that.playCount,_that.collectcount,_that.globalCollectionId,_that.nickname,_that.songCount,_that.tag,_that.publishtime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'singername')  String singerName, @JsonKey(name: 'imgurl')  String imgUrl,  String intro, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()  int collectcount, @JsonKey(name: 'global_collection_id')  String globalCollectionId,  String nickname, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount,  String tag,  String publishtime)?  $default,) {final _that = this;
switch (_that) {
case _SearchSpecialInfo() when $default != null:
return $default(_that.specialId,_that.specialName,_that.singerName,_that.imgUrl,_that.intro,_that.playCount,_that.collectcount,_that.globalCollectionId,_that.nickname,_that.songCount,_that.tag,_that.publishtime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSpecialInfo implements SearchSpecialInfo {
  const _SearchSpecialInfo({@IntFromStringConverter()@JsonKey(name: 'specialid') this.specialId = 0, @JsonKey(name: 'specialname') this.specialName = '', @JsonKey(name: 'singername') this.singerName = '', @JsonKey(name: 'imgurl') this.imgUrl = '', this.intro = '', @IntFromStringConverter()@JsonKey(name: 'play_count') this.playCount = 0, @IntFromStringConverter() this.collectcount = 0, @JsonKey(name: 'global_collection_id') this.globalCollectionId = '', this.nickname = '', @IntFromStringConverter()@JsonKey(name: 'song_count') this.songCount = 0, this.tag = '', this.publishtime = ''});
  factory _SearchSpecialInfo.fromJson(Map<String, dynamic> json) => _$SearchSpecialInfoFromJson(json);

/// 歌单ID
@override@IntFromStringConverter()@JsonKey(name: 'specialid') final  int specialId;
/// 歌单名称
@override@JsonKey(name: 'specialname') final  String specialName;
/// 歌手名
@override@JsonKey(name: 'singername') final  String singerName;
/// 封面图
@override@JsonKey(name: 'imgurl') final  String imgUrl;
/// 介绍
@override@JsonKey() final  String intro;
/// 播放次数
@override@IntFromStringConverter()@JsonKey(name: 'play_count') final  int playCount;
/// 收藏数
@override@JsonKey()@IntFromStringConverter() final  int collectcount;
/// 全局收藏ID
@override@JsonKey(name: 'global_collection_id') final  String globalCollectionId;
/// 创建者昵称
@override@JsonKey() final  String nickname;
/// 歌曲数量
@override@IntFromStringConverter()@JsonKey(name: 'song_count') final  int songCount;
/// 标签
@override@JsonKey() final  String tag;
/// 发布时间
@override@JsonKey() final  String publishtime;

/// Create a copy of SearchSpecialInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSpecialInfoCopyWith<_SearchSpecialInfo> get copyWith => __$SearchSpecialInfoCopyWithImpl<_SearchSpecialInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSpecialInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSpecialInfo&&(identical(other.specialId, specialId) || other.specialId == specialId)&&(identical(other.specialName, specialName) || other.specialName == specialName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.collectcount, collectcount) || other.collectcount == collectcount)&&(identical(other.globalCollectionId, globalCollectionId) || other.globalCollectionId == globalCollectionId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.publishtime, publishtime) || other.publishtime == publishtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,specialId,specialName,singerName,imgUrl,intro,playCount,collectcount,globalCollectionId,nickname,songCount,tag,publishtime);

@override
String toString() {
  return 'SearchSpecialInfo(specialId: $specialId, specialName: $specialName, singerName: $singerName, imgUrl: $imgUrl, intro: $intro, playCount: $playCount, collectcount: $collectcount, globalCollectionId: $globalCollectionId, nickname: $nickname, songCount: $songCount, tag: $tag, publishtime: $publishtime)';
}


}

/// @nodoc
abstract mixin class _$SearchSpecialInfoCopyWith<$Res> implements $SearchSpecialInfoCopyWith<$Res> {
  factory _$SearchSpecialInfoCopyWith(_SearchSpecialInfo value, $Res Function(_SearchSpecialInfo) _then) = __$SearchSpecialInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'specialid') int specialId,@JsonKey(name: 'specialname') String specialName,@JsonKey(name: 'singername') String singerName,@JsonKey(name: 'imgurl') String imgUrl, String intro,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@IntFromStringConverter() int collectcount,@JsonKey(name: 'global_collection_id') String globalCollectionId, String nickname,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount, String tag, String publishtime
});




}
/// @nodoc
class __$SearchSpecialInfoCopyWithImpl<$Res>
    implements _$SearchSpecialInfoCopyWith<$Res> {
  __$SearchSpecialInfoCopyWithImpl(this._self, this._then);

  final _SearchSpecialInfo _self;
  final $Res Function(_SearchSpecialInfo) _then;

/// Create a copy of SearchSpecialInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? specialId = null,Object? specialName = null,Object? singerName = null,Object? imgUrl = null,Object? intro = null,Object? playCount = null,Object? collectcount = null,Object? globalCollectionId = null,Object? nickname = null,Object? songCount = null,Object? tag = null,Object? publishtime = null,}) {
  return _then(_SearchSpecialInfo(
specialId: null == specialId ? _self.specialId : specialId // ignore: cast_nullable_to_non_nullable
as int,specialName: null == specialName ? _self.specialName : specialName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,imgUrl: null == imgUrl ? _self.imgUrl : imgUrl // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,collectcount: null == collectcount ? _self.collectcount : collectcount // ignore: cast_nullable_to_non_nullable
as int,globalCollectionId: null == globalCollectionId ? _self.globalCollectionId : globalCollectionId // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,publishtime: null == publishtime ? _self.publishtime : publishtime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

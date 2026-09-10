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
@IntFromStringConverter()@JsonKey(name: 'specialid') int get specialId;/// 歌单名称（可能含 <em> 高亮标记）
@JsonKey(name: 'specialname') String get specialName;/// 封面图（完整URL）
@JsonKey(name: 'img') String get img;/// 歌曲数量
@IntFromStringConverter()@JsonKey(name: 'song_count') int get songCount;/// 播放次数
@IntFromStringConverter()@JsonKey(name: 'play_count') int get playCount;/// 收藏数
@IntFromStringConverter()@JsonKey(name: 'collect_count') int get collectCount;/// 全局播放量
@IntFromStringConverter()@JsonKey(name: 'total_play_count') int get totalPlayCount;/// 创建者昵称
@JsonKey(name: 'nickname') String get nickname;/// 创建者用户ID
@JsonKey(name: 'suid') String get suid;/// 介绍
@JsonKey(name: 'intro') String get intro;/// 发布时间
@JsonKey(name: 'publish_time') String get publishTime;/// 全局收藏ID
@JsonKey(name: 'gid') String get gid;/// 加密全局收藏ID
@JsonKey(name: 'egid') String get egid;/// 是否VIP歌单
@IntFromStringConverter()@JsonKey(name: 'isvip') int get isVip;/// 是否UGC歌单
@IntFromStringConverter()@JsonKey(name: 'isugc') int get isUgc;/// 是否发布
@IntFromStringConverter()@JsonKey(name: 'ispublish') int get isPublish;/// 是否期刊
@IntFromStringConverter()@JsonKey(name: 'isperiodical') int get isPeriodical;/// 是否定制
@IntFromStringConverter()@JsonKey(name: 'iscustom') int get isCustom;/// 标签
@JsonKey(name: 'tag_str') String get tagStr;/// 包含内容
@JsonKey(name: 'contain') String get contain;/// 评分（整数部分）
@JsonKey(name: 'grade_int') String get gradeInt;/// 评分（浮点部分）
@JsonKey(name: 'grade_float') String get gradeFloat;/// 质量
@IntFromStringConverter()@JsonKey(name: 'quality') int get quality;
/// Create a copy of SearchSpecialInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSpecialInfoCopyWith<SearchSpecialInfo> get copyWith => _$SearchSpecialInfoCopyWithImpl<SearchSpecialInfo>(this as SearchSpecialInfo, _$identity);

  /// Serializes this SearchSpecialInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSpecialInfo&&(identical(other.specialId, specialId) || other.specialId == specialId)&&(identical(other.specialName, specialName) || other.specialName == specialName)&&(identical(other.img, img) || other.img == img)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.totalPlayCount, totalPlayCount) || other.totalPlayCount == totalPlayCount)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.suid, suid) || other.suid == suid)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.egid, egid) || other.egid == egid)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.isUgc, isUgc) || other.isUgc == isUgc)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish)&&(identical(other.isPeriodical, isPeriodical) || other.isPeriodical == isPeriodical)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.tagStr, tagStr) || other.tagStr == tagStr)&&(identical(other.contain, contain) || other.contain == contain)&&(identical(other.gradeInt, gradeInt) || other.gradeInt == gradeInt)&&(identical(other.gradeFloat, gradeFloat) || other.gradeFloat == gradeFloat)&&(identical(other.quality, quality) || other.quality == quality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,specialId,specialName,img,songCount,playCount,collectCount,totalPlayCount,nickname,suid,intro,publishTime,gid,egid,isVip,isUgc,isPublish,isPeriodical,isCustom,tagStr,contain,gradeInt,gradeFloat,quality]);

@override
String toString() {
  return 'SearchSpecialInfo(specialId: $specialId, specialName: $specialName, img: $img, songCount: $songCount, playCount: $playCount, collectCount: $collectCount, totalPlayCount: $totalPlayCount, nickname: $nickname, suid: $suid, intro: $intro, publishTime: $publishTime, gid: $gid, egid: $egid, isVip: $isVip, isUgc: $isUgc, isPublish: $isPublish, isPeriodical: $isPeriodical, isCustom: $isCustom, tagStr: $tagStr, contain: $contain, gradeInt: $gradeInt, gradeFloat: $gradeFloat, quality: $quality)';
}


}

/// @nodoc
abstract mixin class $SearchSpecialInfoCopyWith<$Res>  {
  factory $SearchSpecialInfoCopyWith(SearchSpecialInfo value, $Res Function(SearchSpecialInfo) _then) = _$SearchSpecialInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'specialid') int specialId,@JsonKey(name: 'specialname') String specialName,@JsonKey(name: 'img') String img,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@IntFromStringConverter()@JsonKey(name: 'collect_count') int collectCount,@IntFromStringConverter()@JsonKey(name: 'total_play_count') int totalPlayCount,@JsonKey(name: 'nickname') String nickname,@JsonKey(name: 'suid') String suid,@JsonKey(name: 'intro') String intro,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'gid') String gid,@JsonKey(name: 'egid') String egid,@IntFromStringConverter()@JsonKey(name: 'isvip') int isVip,@IntFromStringConverter()@JsonKey(name: 'isugc') int isUgc,@IntFromStringConverter()@JsonKey(name: 'ispublish') int isPublish,@IntFromStringConverter()@JsonKey(name: 'isperiodical') int isPeriodical,@IntFromStringConverter()@JsonKey(name: 'iscustom') int isCustom,@JsonKey(name: 'tag_str') String tagStr,@JsonKey(name: 'contain') String contain,@JsonKey(name: 'grade_int') String gradeInt,@JsonKey(name: 'grade_float') String gradeFloat,@IntFromStringConverter()@JsonKey(name: 'quality') int quality
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
@pragma('vm:prefer-inline') @override $Res call({Object? specialId = null,Object? specialName = null,Object? img = null,Object? songCount = null,Object? playCount = null,Object? collectCount = null,Object? totalPlayCount = null,Object? nickname = null,Object? suid = null,Object? intro = null,Object? publishTime = null,Object? gid = null,Object? egid = null,Object? isVip = null,Object? isUgc = null,Object? isPublish = null,Object? isPeriodical = null,Object? isCustom = null,Object? tagStr = null,Object? contain = null,Object? gradeInt = null,Object? gradeFloat = null,Object? quality = null,}) {
  return _then(_self.copyWith(
specialId: null == specialId ? _self.specialId : specialId // ignore: cast_nullable_to_non_nullable
as int,specialName: null == specialName ? _self.specialName : specialName // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as int,totalPlayCount: null == totalPlayCount ? _self.totalPlayCount : totalPlayCount // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,suid: null == suid ? _self.suid : suid // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,gid: null == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as String,egid: null == egid ? _self.egid : egid // ignore: cast_nullable_to_non_nullable
as String,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,isUgc: null == isUgc ? _self.isUgc : isUgc // ignore: cast_nullable_to_non_nullable
as int,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,isPeriodical: null == isPeriodical ? _self.isPeriodical : isPeriodical // ignore: cast_nullable_to_non_nullable
as int,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as int,tagStr: null == tagStr ? _self.tagStr : tagStr // ignore: cast_nullable_to_non_nullable
as String,contain: null == contain ? _self.contain : contain // ignore: cast_nullable_to_non_nullable
as String,gradeInt: null == gradeInt ? _self.gradeInt : gradeInt // ignore: cast_nullable_to_non_nullable
as String,gradeFloat: null == gradeFloat ? _self.gradeFloat : gradeFloat // ignore: cast_nullable_to_non_nullable
as String,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'img')  String img, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'total_play_count')  int totalPlayCount, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'suid')  String suid, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'gid')  String gid, @JsonKey(name: 'egid')  String egid, @IntFromStringConverter()@JsonKey(name: 'isvip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'isugc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'ispublish')  int isPublish, @IntFromStringConverter()@JsonKey(name: 'isperiodical')  int isPeriodical, @IntFromStringConverter()@JsonKey(name: 'iscustom')  int isCustom, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'contain')  String contain, @JsonKey(name: 'grade_int')  String gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSpecialInfo() when $default != null:
return $default(_that.specialId,_that.specialName,_that.img,_that.songCount,_that.playCount,_that.collectCount,_that.totalPlayCount,_that.nickname,_that.suid,_that.intro,_that.publishTime,_that.gid,_that.egid,_that.isVip,_that.isUgc,_that.isPublish,_that.isPeriodical,_that.isCustom,_that.tagStr,_that.contain,_that.gradeInt,_that.gradeFloat,_that.quality);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'img')  String img, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'total_play_count')  int totalPlayCount, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'suid')  String suid, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'gid')  String gid, @JsonKey(name: 'egid')  String egid, @IntFromStringConverter()@JsonKey(name: 'isvip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'isugc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'ispublish')  int isPublish, @IntFromStringConverter()@JsonKey(name: 'isperiodical')  int isPeriodical, @IntFromStringConverter()@JsonKey(name: 'iscustom')  int isCustom, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'contain')  String contain, @JsonKey(name: 'grade_int')  String gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality)  $default,) {final _that = this;
switch (_that) {
case _SearchSpecialInfo():
return $default(_that.specialId,_that.specialName,_that.img,_that.songCount,_that.playCount,_that.collectCount,_that.totalPlayCount,_that.nickname,_that.suid,_that.intro,_that.publishTime,_that.gid,_that.egid,_that.isVip,_that.isUgc,_that.isPublish,_that.isPeriodical,_that.isCustom,_that.tagStr,_that.contain,_that.gradeInt,_that.gradeFloat,_that.quality);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'img')  String img, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'total_play_count')  int totalPlayCount, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'suid')  String suid, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'gid')  String gid, @JsonKey(name: 'egid')  String egid, @IntFromStringConverter()@JsonKey(name: 'isvip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'isugc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'ispublish')  int isPublish, @IntFromStringConverter()@JsonKey(name: 'isperiodical')  int isPeriodical, @IntFromStringConverter()@JsonKey(name: 'iscustom')  int isCustom, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'contain')  String contain, @JsonKey(name: 'grade_int')  String gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality)?  $default,) {final _that = this;
switch (_that) {
case _SearchSpecialInfo() when $default != null:
return $default(_that.specialId,_that.specialName,_that.img,_that.songCount,_that.playCount,_that.collectCount,_that.totalPlayCount,_that.nickname,_that.suid,_that.intro,_that.publishTime,_that.gid,_that.egid,_that.isVip,_that.isUgc,_that.isPublish,_that.isPeriodical,_that.isCustom,_that.tagStr,_that.contain,_that.gradeInt,_that.gradeFloat,_that.quality);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSpecialInfo extends SearchSpecialInfo {
  const _SearchSpecialInfo({@IntFromStringConverter()@JsonKey(name: 'specialid') this.specialId = 0, @JsonKey(name: 'specialname') this.specialName = '', @JsonKey(name: 'img') this.img = '', @IntFromStringConverter()@JsonKey(name: 'song_count') this.songCount = 0, @IntFromStringConverter()@JsonKey(name: 'play_count') this.playCount = 0, @IntFromStringConverter()@JsonKey(name: 'collect_count') this.collectCount = 0, @IntFromStringConverter()@JsonKey(name: 'total_play_count') this.totalPlayCount = 0, @JsonKey(name: 'nickname') this.nickname = '', @JsonKey(name: 'suid') this.suid = '', @JsonKey(name: 'intro') this.intro = '', @JsonKey(name: 'publish_time') this.publishTime = '', @JsonKey(name: 'gid') this.gid = '', @JsonKey(name: 'egid') this.egid = '', @IntFromStringConverter()@JsonKey(name: 'isvip') this.isVip = 0, @IntFromStringConverter()@JsonKey(name: 'isugc') this.isUgc = 0, @IntFromStringConverter()@JsonKey(name: 'ispublish') this.isPublish = 0, @IntFromStringConverter()@JsonKey(name: 'isperiodical') this.isPeriodical = 0, @IntFromStringConverter()@JsonKey(name: 'iscustom') this.isCustom = 0, @JsonKey(name: 'tag_str') this.tagStr = '', @JsonKey(name: 'contain') this.contain = '', @JsonKey(name: 'grade_int') this.gradeInt = '', @JsonKey(name: 'grade_float') this.gradeFloat = '', @IntFromStringConverter()@JsonKey(name: 'quality') this.quality = 0}): super._();
  factory _SearchSpecialInfo.fromJson(Map<String, dynamic> json) => _$SearchSpecialInfoFromJson(json);

/// 歌单ID
@override@IntFromStringConverter()@JsonKey(name: 'specialid') final  int specialId;
/// 歌单名称（可能含 <em> 高亮标记）
@override@JsonKey(name: 'specialname') final  String specialName;
/// 封面图（完整URL）
@override@JsonKey(name: 'img') final  String img;
/// 歌曲数量
@override@IntFromStringConverter()@JsonKey(name: 'song_count') final  int songCount;
/// 播放次数
@override@IntFromStringConverter()@JsonKey(name: 'play_count') final  int playCount;
/// 收藏数
@override@IntFromStringConverter()@JsonKey(name: 'collect_count') final  int collectCount;
/// 全局播放量
@override@IntFromStringConverter()@JsonKey(name: 'total_play_count') final  int totalPlayCount;
/// 创建者昵称
@override@JsonKey(name: 'nickname') final  String nickname;
/// 创建者用户ID
@override@JsonKey(name: 'suid') final  String suid;
/// 介绍
@override@JsonKey(name: 'intro') final  String intro;
/// 发布时间
@override@JsonKey(name: 'publish_time') final  String publishTime;
/// 全局收藏ID
@override@JsonKey(name: 'gid') final  String gid;
/// 加密全局收藏ID
@override@JsonKey(name: 'egid') final  String egid;
/// 是否VIP歌单
@override@IntFromStringConverter()@JsonKey(name: 'isvip') final  int isVip;
/// 是否UGC歌单
@override@IntFromStringConverter()@JsonKey(name: 'isugc') final  int isUgc;
/// 是否发布
@override@IntFromStringConverter()@JsonKey(name: 'ispublish') final  int isPublish;
/// 是否期刊
@override@IntFromStringConverter()@JsonKey(name: 'isperiodical') final  int isPeriodical;
/// 是否定制
@override@IntFromStringConverter()@JsonKey(name: 'iscustom') final  int isCustom;
/// 标签
@override@JsonKey(name: 'tag_str') final  String tagStr;
/// 包含内容
@override@JsonKey(name: 'contain') final  String contain;
/// 评分（整数部分）
@override@JsonKey(name: 'grade_int') final  String gradeInt;
/// 评分（浮点部分）
@override@JsonKey(name: 'grade_float') final  String gradeFloat;
/// 质量
@override@IntFromStringConverter()@JsonKey(name: 'quality') final  int quality;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSpecialInfo&&(identical(other.specialId, specialId) || other.specialId == specialId)&&(identical(other.specialName, specialName) || other.specialName == specialName)&&(identical(other.img, img) || other.img == img)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.totalPlayCount, totalPlayCount) || other.totalPlayCount == totalPlayCount)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.suid, suid) || other.suid == suid)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.egid, egid) || other.egid == egid)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.isUgc, isUgc) || other.isUgc == isUgc)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish)&&(identical(other.isPeriodical, isPeriodical) || other.isPeriodical == isPeriodical)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.tagStr, tagStr) || other.tagStr == tagStr)&&(identical(other.contain, contain) || other.contain == contain)&&(identical(other.gradeInt, gradeInt) || other.gradeInt == gradeInt)&&(identical(other.gradeFloat, gradeFloat) || other.gradeFloat == gradeFloat)&&(identical(other.quality, quality) || other.quality == quality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,specialId,specialName,img,songCount,playCount,collectCount,totalPlayCount,nickname,suid,intro,publishTime,gid,egid,isVip,isUgc,isPublish,isPeriodical,isCustom,tagStr,contain,gradeInt,gradeFloat,quality]);

@override
String toString() {
  return 'SearchSpecialInfo(specialId: $specialId, specialName: $specialName, img: $img, songCount: $songCount, playCount: $playCount, collectCount: $collectCount, totalPlayCount: $totalPlayCount, nickname: $nickname, suid: $suid, intro: $intro, publishTime: $publishTime, gid: $gid, egid: $egid, isVip: $isVip, isUgc: $isUgc, isPublish: $isPublish, isPeriodical: $isPeriodical, isCustom: $isCustom, tagStr: $tagStr, contain: $contain, gradeInt: $gradeInt, gradeFloat: $gradeFloat, quality: $quality)';
}


}

/// @nodoc
abstract mixin class _$SearchSpecialInfoCopyWith<$Res> implements $SearchSpecialInfoCopyWith<$Res> {
  factory _$SearchSpecialInfoCopyWith(_SearchSpecialInfo value, $Res Function(_SearchSpecialInfo) _then) = __$SearchSpecialInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'specialid') int specialId,@JsonKey(name: 'specialname') String specialName,@JsonKey(name: 'img') String img,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@IntFromStringConverter()@JsonKey(name: 'collect_count') int collectCount,@IntFromStringConverter()@JsonKey(name: 'total_play_count') int totalPlayCount,@JsonKey(name: 'nickname') String nickname,@JsonKey(name: 'suid') String suid,@JsonKey(name: 'intro') String intro,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'gid') String gid,@JsonKey(name: 'egid') String egid,@IntFromStringConverter()@JsonKey(name: 'isvip') int isVip,@IntFromStringConverter()@JsonKey(name: 'isugc') int isUgc,@IntFromStringConverter()@JsonKey(name: 'ispublish') int isPublish,@IntFromStringConverter()@JsonKey(name: 'isperiodical') int isPeriodical,@IntFromStringConverter()@JsonKey(name: 'iscustom') int isCustom,@JsonKey(name: 'tag_str') String tagStr,@JsonKey(name: 'contain') String contain,@JsonKey(name: 'grade_int') String gradeInt,@JsonKey(name: 'grade_float') String gradeFloat,@IntFromStringConverter()@JsonKey(name: 'quality') int quality
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
@override @pragma('vm:prefer-inline') $Res call({Object? specialId = null,Object? specialName = null,Object? img = null,Object? songCount = null,Object? playCount = null,Object? collectCount = null,Object? totalPlayCount = null,Object? nickname = null,Object? suid = null,Object? intro = null,Object? publishTime = null,Object? gid = null,Object? egid = null,Object? isVip = null,Object? isUgc = null,Object? isPublish = null,Object? isPeriodical = null,Object? isCustom = null,Object? tagStr = null,Object? contain = null,Object? gradeInt = null,Object? gradeFloat = null,Object? quality = null,}) {
  return _then(_SearchSpecialInfo(
specialId: null == specialId ? _self.specialId : specialId // ignore: cast_nullable_to_non_nullable
as int,specialName: null == specialName ? _self.specialName : specialName // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as int,totalPlayCount: null == totalPlayCount ? _self.totalPlayCount : totalPlayCount // ignore: cast_nullable_to_non_nullable
as int,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,suid: null == suid ? _self.suid : suid // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,gid: null == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as String,egid: null == egid ? _self.egid : egid // ignore: cast_nullable_to_non_nullable
as String,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,isUgc: null == isUgc ? _self.isUgc : isUgc // ignore: cast_nullable_to_non_nullable
as int,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,isPeriodical: null == isPeriodical ? _self.isPeriodical : isPeriodical // ignore: cast_nullable_to_non_nullable
as int,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as int,tagStr: null == tagStr ? _self.tagStr : tagStr // ignore: cast_nullable_to_non_nullable
as String,contain: null == contain ? _self.contain : contain // ignore: cast_nullable_to_non_nullable
as String,gradeInt: null == gradeInt ? _self.gradeInt : gradeInt // ignore: cast_nullable_to_non_nullable
as String,gradeFloat: null == gradeFloat ? _self.gradeFloat : gradeFloat // ignore: cast_nullable_to_non_nullable
as String,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

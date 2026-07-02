// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_collect_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchCollectInfo {

/// 歌单ID
@IntFromStringConverter()@JsonKey(name: 'specialid') int get specialId;/// 歌单名称
@JsonKey(name: 'specialname') String get specialName;/// 封面图
@JsonKey(name: 'img') String get img;/// 介绍
@JsonKey(name: 'intro') String get intro;/// 歌曲数量
@IntFromStringConverter()@JsonKey(name: 'song_count') int get songCount;/// 播放次数
@JsonKey(name: 'play_count') String get playCount;/// 收藏数
@JsonKey(name: 'collect_count') String get collectCount;/// 全局播放量
@JsonKey(name: 'total_play_count') String get totalPlayCount;/// 创建者昵称
@JsonKey(name: 'nickname') String get nickname;/// 用户ID
@JsonKey(name: 'suid') String get suid;/// 是否发布
@IntFromStringConverter()@JsonKey(name: 'ispublish') int get isPublish;/// 是否VIP
@IntFromStringConverter()@JsonKey(name: 'isvip') int get isVip;/// 是否UGC
@IntFromStringConverter()@JsonKey(name: 'isugc') int get isUgc;/// 是否互相关注
@IntFromStringConverter()@JsonKey(name: 'is_mutual') int get isMutual;/// 是否定制
@IntFromStringConverter()@JsonKey(name: 'iscustom') int get isCustom;/// 是否期刊
@IntFromStringConverter()@JsonKey(name: 'isperiodical') int get isPeriodical;/// 标签
@JsonKey(name: 'tag_str') String get tagStr;/// 包含内容
@JsonKey(name: 'contain') String get contain;/// 发布时间
@JsonKey(name: 'publish_time') String get publishTime;/// 全局ID
@JsonKey(name: 'gid') String get gid;/// 版本号
@IntFromStringConverter()@JsonKey(name: 'version') int get version;/// 质量
@IntFromStringConverter()@JsonKey(name: 'quality') int get quality;/// 新质量
@IntFromStringConverter()@JsonKey(name: 'quality_new') int get qualityNew;/// 评分
@IntFromStringConverter()@JsonKey(name: 'grade') int get grade;/// 评分(整数)
@IntFromStringConverter()@JsonKey(name: 'grade_int') int get gradeInt;/// 评分(浮点)
@JsonKey(name: 'grade_float') String get gradeFloat;/// 期数
@IntFromStringConverter()@JsonKey(name: 'nper') int get nper;/// SRID
@JsonKey(name: 'srid') String get srid;/// 算法路径
@JsonKey(name: 'alg_path') String get algPath;/// 标签信息
@JsonKey(name: 'abtags') Map<String, dynamic> get abTags;/// 传输参数
@JsonKey(name: 'trans_param') Map<String, dynamic> get transParam;/// 主题信息
@JsonKey(name: 'theme') Map<String, dynamic> get theme;
/// Create a copy of SearchCollectInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCollectInfoCopyWith<SearchCollectInfo> get copyWith => _$SearchCollectInfoCopyWithImpl<SearchCollectInfo>(this as SearchCollectInfo, _$identity);

  /// Serializes this SearchCollectInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCollectInfo&&(identical(other.specialId, specialId) || other.specialId == specialId)&&(identical(other.specialName, specialName) || other.specialName == specialName)&&(identical(other.img, img) || other.img == img)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.totalPlayCount, totalPlayCount) || other.totalPlayCount == totalPlayCount)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.suid, suid) || other.suid == suid)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.isUgc, isUgc) || other.isUgc == isUgc)&&(identical(other.isMutual, isMutual) || other.isMutual == isMutual)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.isPeriodical, isPeriodical) || other.isPeriodical == isPeriodical)&&(identical(other.tagStr, tagStr) || other.tagStr == tagStr)&&(identical(other.contain, contain) || other.contain == contain)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.version, version) || other.version == version)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.qualityNew, qualityNew) || other.qualityNew == qualityNew)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.gradeInt, gradeInt) || other.gradeInt == gradeInt)&&(identical(other.gradeFloat, gradeFloat) || other.gradeFloat == gradeFloat)&&(identical(other.nper, nper) || other.nper == nper)&&(identical(other.srid, srid) || other.srid == srid)&&(identical(other.algPath, algPath) || other.algPath == algPath)&&const DeepCollectionEquality().equals(other.abTags, abTags)&&const DeepCollectionEquality().equals(other.transParam, transParam)&&const DeepCollectionEquality().equals(other.theme, theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,specialId,specialName,img,intro,songCount,playCount,collectCount,totalPlayCount,nickname,suid,isPublish,isVip,isUgc,isMutual,isCustom,isPeriodical,tagStr,contain,publishTime,gid,version,quality,qualityNew,grade,gradeInt,gradeFloat,nper,srid,algPath,const DeepCollectionEquality().hash(abTags),const DeepCollectionEquality().hash(transParam),const DeepCollectionEquality().hash(theme)]);

@override
String toString() {
  return 'SearchCollectInfo(specialId: $specialId, specialName: $specialName, img: $img, intro: $intro, songCount: $songCount, playCount: $playCount, collectCount: $collectCount, totalPlayCount: $totalPlayCount, nickname: $nickname, suid: $suid, isPublish: $isPublish, isVip: $isVip, isUgc: $isUgc, isMutual: $isMutual, isCustom: $isCustom, isPeriodical: $isPeriodical, tagStr: $tagStr, contain: $contain, publishTime: $publishTime, gid: $gid, version: $version, quality: $quality, qualityNew: $qualityNew, grade: $grade, gradeInt: $gradeInt, gradeFloat: $gradeFloat, nper: $nper, srid: $srid, algPath: $algPath, abTags: $abTags, transParam: $transParam, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $SearchCollectInfoCopyWith<$Res>  {
  factory $SearchCollectInfoCopyWith(SearchCollectInfo value, $Res Function(SearchCollectInfo) _then) = _$SearchCollectInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'specialid') int specialId,@JsonKey(name: 'specialname') String specialName,@JsonKey(name: 'img') String img,@JsonKey(name: 'intro') String intro,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@JsonKey(name: 'play_count') String playCount,@JsonKey(name: 'collect_count') String collectCount,@JsonKey(name: 'total_play_count') String totalPlayCount,@JsonKey(name: 'nickname') String nickname,@JsonKey(name: 'suid') String suid,@IntFromStringConverter()@JsonKey(name: 'ispublish') int isPublish,@IntFromStringConverter()@JsonKey(name: 'isvip') int isVip,@IntFromStringConverter()@JsonKey(name: 'isugc') int isUgc,@IntFromStringConverter()@JsonKey(name: 'is_mutual') int isMutual,@IntFromStringConverter()@JsonKey(name: 'iscustom') int isCustom,@IntFromStringConverter()@JsonKey(name: 'isperiodical') int isPeriodical,@JsonKey(name: 'tag_str') String tagStr,@JsonKey(name: 'contain') String contain,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'gid') String gid,@IntFromStringConverter()@JsonKey(name: 'version') int version,@IntFromStringConverter()@JsonKey(name: 'quality') int quality,@IntFromStringConverter()@JsonKey(name: 'quality_new') int qualityNew,@IntFromStringConverter()@JsonKey(name: 'grade') int grade,@IntFromStringConverter()@JsonKey(name: 'grade_int') int gradeInt,@JsonKey(name: 'grade_float') String gradeFloat,@IntFromStringConverter()@JsonKey(name: 'nper') int nper,@JsonKey(name: 'srid') String srid,@JsonKey(name: 'alg_path') String algPath,@JsonKey(name: 'abtags') Map<String, dynamic> abTags,@JsonKey(name: 'trans_param') Map<String, dynamic> transParam,@JsonKey(name: 'theme') Map<String, dynamic> theme
});




}
/// @nodoc
class _$SearchCollectInfoCopyWithImpl<$Res>
    implements $SearchCollectInfoCopyWith<$Res> {
  _$SearchCollectInfoCopyWithImpl(this._self, this._then);

  final SearchCollectInfo _self;
  final $Res Function(SearchCollectInfo) _then;

/// Create a copy of SearchCollectInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? specialId = null,Object? specialName = null,Object? img = null,Object? intro = null,Object? songCount = null,Object? playCount = null,Object? collectCount = null,Object? totalPlayCount = null,Object? nickname = null,Object? suid = null,Object? isPublish = null,Object? isVip = null,Object? isUgc = null,Object? isMutual = null,Object? isCustom = null,Object? isPeriodical = null,Object? tagStr = null,Object? contain = null,Object? publishTime = null,Object? gid = null,Object? version = null,Object? quality = null,Object? qualityNew = null,Object? grade = null,Object? gradeInt = null,Object? gradeFloat = null,Object? nper = null,Object? srid = null,Object? algPath = null,Object? abTags = null,Object? transParam = null,Object? theme = null,}) {
  return _then(_self.copyWith(
specialId: null == specialId ? _self.specialId : specialId // ignore: cast_nullable_to_non_nullable
as int,specialName: null == specialName ? _self.specialName : specialName // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as String,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as String,totalPlayCount: null == totalPlayCount ? _self.totalPlayCount : totalPlayCount // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,suid: null == suid ? _self.suid : suid // ignore: cast_nullable_to_non_nullable
as String,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,isUgc: null == isUgc ? _self.isUgc : isUgc // ignore: cast_nullable_to_non_nullable
as int,isMutual: null == isMutual ? _self.isMutual : isMutual // ignore: cast_nullable_to_non_nullable
as int,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as int,isPeriodical: null == isPeriodical ? _self.isPeriodical : isPeriodical // ignore: cast_nullable_to_non_nullable
as int,tagStr: null == tagStr ? _self.tagStr : tagStr // ignore: cast_nullable_to_non_nullable
as String,contain: null == contain ? _self.contain : contain // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,gid: null == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,qualityNew: null == qualityNew ? _self.qualityNew : qualityNew // ignore: cast_nullable_to_non_nullable
as int,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int,gradeInt: null == gradeInt ? _self.gradeInt : gradeInt // ignore: cast_nullable_to_non_nullable
as int,gradeFloat: null == gradeFloat ? _self.gradeFloat : gradeFloat // ignore: cast_nullable_to_non_nullable
as String,nper: null == nper ? _self.nper : nper // ignore: cast_nullable_to_non_nullable
as int,srid: null == srid ? _self.srid : srid // ignore: cast_nullable_to_non_nullable
as String,algPath: null == algPath ? _self.algPath : algPath // ignore: cast_nullable_to_non_nullable
as String,abTags: null == abTags ? _self.abTags : abTags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,transParam: null == transParam ? _self.transParam : transParam // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchCollectInfo].
extension SearchCollectInfoPatterns on SearchCollectInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchCollectInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchCollectInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchCollectInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchCollectInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchCollectInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchCollectInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'img')  String img, @JsonKey(name: 'intro')  String intro, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @JsonKey(name: 'play_count')  String playCount, @JsonKey(name: 'collect_count')  String collectCount, @JsonKey(name: 'total_play_count')  String totalPlayCount, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'suid')  String suid, @IntFromStringConverter()@JsonKey(name: 'ispublish')  int isPublish, @IntFromStringConverter()@JsonKey(name: 'isvip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'isugc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'is_mutual')  int isMutual, @IntFromStringConverter()@JsonKey(name: 'iscustom')  int isCustom, @IntFromStringConverter()@JsonKey(name: 'isperiodical')  int isPeriodical, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'contain')  String contain, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'gid')  String gid, @IntFromStringConverter()@JsonKey(name: 'version')  int version, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'quality_new')  int qualityNew, @IntFromStringConverter()@JsonKey(name: 'grade')  int grade, @IntFromStringConverter()@JsonKey(name: 'grade_int')  int gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'nper')  int nper, @JsonKey(name: 'srid')  String srid, @JsonKey(name: 'alg_path')  String algPath, @JsonKey(name: 'abtags')  Map<String, dynamic> abTags, @JsonKey(name: 'trans_param')  Map<String, dynamic> transParam, @JsonKey(name: 'theme')  Map<String, dynamic> theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchCollectInfo() when $default != null:
return $default(_that.specialId,_that.specialName,_that.img,_that.intro,_that.songCount,_that.playCount,_that.collectCount,_that.totalPlayCount,_that.nickname,_that.suid,_that.isPublish,_that.isVip,_that.isUgc,_that.isMutual,_that.isCustom,_that.isPeriodical,_that.tagStr,_that.contain,_that.publishTime,_that.gid,_that.version,_that.quality,_that.qualityNew,_that.grade,_that.gradeInt,_that.gradeFloat,_that.nper,_that.srid,_that.algPath,_that.abTags,_that.transParam,_that.theme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'img')  String img, @JsonKey(name: 'intro')  String intro, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @JsonKey(name: 'play_count')  String playCount, @JsonKey(name: 'collect_count')  String collectCount, @JsonKey(name: 'total_play_count')  String totalPlayCount, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'suid')  String suid, @IntFromStringConverter()@JsonKey(name: 'ispublish')  int isPublish, @IntFromStringConverter()@JsonKey(name: 'isvip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'isugc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'is_mutual')  int isMutual, @IntFromStringConverter()@JsonKey(name: 'iscustom')  int isCustom, @IntFromStringConverter()@JsonKey(name: 'isperiodical')  int isPeriodical, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'contain')  String contain, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'gid')  String gid, @IntFromStringConverter()@JsonKey(name: 'version')  int version, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'quality_new')  int qualityNew, @IntFromStringConverter()@JsonKey(name: 'grade')  int grade, @IntFromStringConverter()@JsonKey(name: 'grade_int')  int gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'nper')  int nper, @JsonKey(name: 'srid')  String srid, @JsonKey(name: 'alg_path')  String algPath, @JsonKey(name: 'abtags')  Map<String, dynamic> abTags, @JsonKey(name: 'trans_param')  Map<String, dynamic> transParam, @JsonKey(name: 'theme')  Map<String, dynamic> theme)  $default,) {final _that = this;
switch (_that) {
case _SearchCollectInfo():
return $default(_that.specialId,_that.specialName,_that.img,_that.intro,_that.songCount,_that.playCount,_that.collectCount,_that.totalPlayCount,_that.nickname,_that.suid,_that.isPublish,_that.isVip,_that.isUgc,_that.isMutual,_that.isCustom,_that.isPeriodical,_that.tagStr,_that.contain,_that.publishTime,_that.gid,_that.version,_that.quality,_that.qualityNew,_that.grade,_that.gradeInt,_that.gradeFloat,_that.nper,_that.srid,_that.algPath,_that.abTags,_that.transParam,_that.theme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'specialid')  int specialId, @JsonKey(name: 'specialname')  String specialName, @JsonKey(name: 'img')  String img, @JsonKey(name: 'intro')  String intro, @IntFromStringConverter()@JsonKey(name: 'song_count')  int songCount, @JsonKey(name: 'play_count')  String playCount, @JsonKey(name: 'collect_count')  String collectCount, @JsonKey(name: 'total_play_count')  String totalPlayCount, @JsonKey(name: 'nickname')  String nickname, @JsonKey(name: 'suid')  String suid, @IntFromStringConverter()@JsonKey(name: 'ispublish')  int isPublish, @IntFromStringConverter()@JsonKey(name: 'isvip')  int isVip, @IntFromStringConverter()@JsonKey(name: 'isugc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'is_mutual')  int isMutual, @IntFromStringConverter()@JsonKey(name: 'iscustom')  int isCustom, @IntFromStringConverter()@JsonKey(name: 'isperiodical')  int isPeriodical, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'contain')  String contain, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'gid')  String gid, @IntFromStringConverter()@JsonKey(name: 'version')  int version, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'quality_new')  int qualityNew, @IntFromStringConverter()@JsonKey(name: 'grade')  int grade, @IntFromStringConverter()@JsonKey(name: 'grade_int')  int gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'nper')  int nper, @JsonKey(name: 'srid')  String srid, @JsonKey(name: 'alg_path')  String algPath, @JsonKey(name: 'abtags')  Map<String, dynamic> abTags, @JsonKey(name: 'trans_param')  Map<String, dynamic> transParam, @JsonKey(name: 'theme')  Map<String, dynamic> theme)?  $default,) {final _that = this;
switch (_that) {
case _SearchCollectInfo() when $default != null:
return $default(_that.specialId,_that.specialName,_that.img,_that.intro,_that.songCount,_that.playCount,_that.collectCount,_that.totalPlayCount,_that.nickname,_that.suid,_that.isPublish,_that.isVip,_that.isUgc,_that.isMutual,_that.isCustom,_that.isPeriodical,_that.tagStr,_that.contain,_that.publishTime,_that.gid,_that.version,_that.quality,_that.qualityNew,_that.grade,_that.gradeInt,_that.gradeFloat,_that.nper,_that.srid,_that.algPath,_that.abTags,_that.transParam,_that.theme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchCollectInfo implements SearchCollectInfo {
  const _SearchCollectInfo({@IntFromStringConverter()@JsonKey(name: 'specialid') this.specialId = 0, @JsonKey(name: 'specialname') this.specialName = '', @JsonKey(name: 'img') this.img = '', @JsonKey(name: 'intro') this.intro = '', @IntFromStringConverter()@JsonKey(name: 'song_count') this.songCount = 0, @JsonKey(name: 'play_count') this.playCount = '', @JsonKey(name: 'collect_count') this.collectCount = '', @JsonKey(name: 'total_play_count') this.totalPlayCount = '', @JsonKey(name: 'nickname') this.nickname = '', @JsonKey(name: 'suid') this.suid = '', @IntFromStringConverter()@JsonKey(name: 'ispublish') this.isPublish = 0, @IntFromStringConverter()@JsonKey(name: 'isvip') this.isVip = 0, @IntFromStringConverter()@JsonKey(name: 'isugc') this.isUgc = 0, @IntFromStringConverter()@JsonKey(name: 'is_mutual') this.isMutual = 0, @IntFromStringConverter()@JsonKey(name: 'iscustom') this.isCustom = 0, @IntFromStringConverter()@JsonKey(name: 'isperiodical') this.isPeriodical = 0, @JsonKey(name: 'tag_str') this.tagStr = '', @JsonKey(name: 'contain') this.contain = '', @JsonKey(name: 'publish_time') this.publishTime = '', @JsonKey(name: 'gid') this.gid = '', @IntFromStringConverter()@JsonKey(name: 'version') this.version = 0, @IntFromStringConverter()@JsonKey(name: 'quality') this.quality = 0, @IntFromStringConverter()@JsonKey(name: 'quality_new') this.qualityNew = 0, @IntFromStringConverter()@JsonKey(name: 'grade') this.grade = 0, @IntFromStringConverter()@JsonKey(name: 'grade_int') this.gradeInt = 0, @JsonKey(name: 'grade_float') this.gradeFloat = '', @IntFromStringConverter()@JsonKey(name: 'nper') this.nper = 0, @JsonKey(name: 'srid') this.srid = '', @JsonKey(name: 'alg_path') this.algPath = '', @JsonKey(name: 'abtags') final  Map<String, dynamic> abTags = const {}, @JsonKey(name: 'trans_param') final  Map<String, dynamic> transParam = const {}, @JsonKey(name: 'theme') final  Map<String, dynamic> theme = const {}}): _abTags = abTags,_transParam = transParam,_theme = theme;
  factory _SearchCollectInfo.fromJson(Map<String, dynamic> json) => _$SearchCollectInfoFromJson(json);

/// 歌单ID
@override@IntFromStringConverter()@JsonKey(name: 'specialid') final  int specialId;
/// 歌单名称
@override@JsonKey(name: 'specialname') final  String specialName;
/// 封面图
@override@JsonKey(name: 'img') final  String img;
/// 介绍
@override@JsonKey(name: 'intro') final  String intro;
/// 歌曲数量
@override@IntFromStringConverter()@JsonKey(name: 'song_count') final  int songCount;
/// 播放次数
@override@JsonKey(name: 'play_count') final  String playCount;
/// 收藏数
@override@JsonKey(name: 'collect_count') final  String collectCount;
/// 全局播放量
@override@JsonKey(name: 'total_play_count') final  String totalPlayCount;
/// 创建者昵称
@override@JsonKey(name: 'nickname') final  String nickname;
/// 用户ID
@override@JsonKey(name: 'suid') final  String suid;
/// 是否发布
@override@IntFromStringConverter()@JsonKey(name: 'ispublish') final  int isPublish;
/// 是否VIP
@override@IntFromStringConverter()@JsonKey(name: 'isvip') final  int isVip;
/// 是否UGC
@override@IntFromStringConverter()@JsonKey(name: 'isugc') final  int isUgc;
/// 是否互相关注
@override@IntFromStringConverter()@JsonKey(name: 'is_mutual') final  int isMutual;
/// 是否定制
@override@IntFromStringConverter()@JsonKey(name: 'iscustom') final  int isCustom;
/// 是否期刊
@override@IntFromStringConverter()@JsonKey(name: 'isperiodical') final  int isPeriodical;
/// 标签
@override@JsonKey(name: 'tag_str') final  String tagStr;
/// 包含内容
@override@JsonKey(name: 'contain') final  String contain;
/// 发布时间
@override@JsonKey(name: 'publish_time') final  String publishTime;
/// 全局ID
@override@JsonKey(name: 'gid') final  String gid;
/// 版本号
@override@IntFromStringConverter()@JsonKey(name: 'version') final  int version;
/// 质量
@override@IntFromStringConverter()@JsonKey(name: 'quality') final  int quality;
/// 新质量
@override@IntFromStringConverter()@JsonKey(name: 'quality_new') final  int qualityNew;
/// 评分
@override@IntFromStringConverter()@JsonKey(name: 'grade') final  int grade;
/// 评分(整数)
@override@IntFromStringConverter()@JsonKey(name: 'grade_int') final  int gradeInt;
/// 评分(浮点)
@override@JsonKey(name: 'grade_float') final  String gradeFloat;
/// 期数
@override@IntFromStringConverter()@JsonKey(name: 'nper') final  int nper;
/// SRID
@override@JsonKey(name: 'srid') final  String srid;
/// 算法路径
@override@JsonKey(name: 'alg_path') final  String algPath;
/// 标签信息
 final  Map<String, dynamic> _abTags;
/// 标签信息
@override@JsonKey(name: 'abtags') Map<String, dynamic> get abTags {
  if (_abTags is EqualUnmodifiableMapView) return _abTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_abTags);
}

/// 传输参数
 final  Map<String, dynamic> _transParam;
/// 传输参数
@override@JsonKey(name: 'trans_param') Map<String, dynamic> get transParam {
  if (_transParam is EqualUnmodifiableMapView) return _transParam;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_transParam);
}

/// 主题信息
 final  Map<String, dynamic> _theme;
/// 主题信息
@override@JsonKey(name: 'theme') Map<String, dynamic> get theme {
  if (_theme is EqualUnmodifiableMapView) return _theme;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_theme);
}


/// Create a copy of SearchCollectInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCollectInfoCopyWith<_SearchCollectInfo> get copyWith => __$SearchCollectInfoCopyWithImpl<_SearchCollectInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchCollectInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchCollectInfo&&(identical(other.specialId, specialId) || other.specialId == specialId)&&(identical(other.specialName, specialName) || other.specialName == specialName)&&(identical(other.img, img) || other.img == img)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.totalPlayCount, totalPlayCount) || other.totalPlayCount == totalPlayCount)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.suid, suid) || other.suid == suid)&&(identical(other.isPublish, isPublish) || other.isPublish == isPublish)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.isUgc, isUgc) || other.isUgc == isUgc)&&(identical(other.isMutual, isMutual) || other.isMutual == isMutual)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.isPeriodical, isPeriodical) || other.isPeriodical == isPeriodical)&&(identical(other.tagStr, tagStr) || other.tagStr == tagStr)&&(identical(other.contain, contain) || other.contain == contain)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.version, version) || other.version == version)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.qualityNew, qualityNew) || other.qualityNew == qualityNew)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.gradeInt, gradeInt) || other.gradeInt == gradeInt)&&(identical(other.gradeFloat, gradeFloat) || other.gradeFloat == gradeFloat)&&(identical(other.nper, nper) || other.nper == nper)&&(identical(other.srid, srid) || other.srid == srid)&&(identical(other.algPath, algPath) || other.algPath == algPath)&&const DeepCollectionEquality().equals(other._abTags, _abTags)&&const DeepCollectionEquality().equals(other._transParam, _transParam)&&const DeepCollectionEquality().equals(other._theme, _theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,specialId,specialName,img,intro,songCount,playCount,collectCount,totalPlayCount,nickname,suid,isPublish,isVip,isUgc,isMutual,isCustom,isPeriodical,tagStr,contain,publishTime,gid,version,quality,qualityNew,grade,gradeInt,gradeFloat,nper,srid,algPath,const DeepCollectionEquality().hash(_abTags),const DeepCollectionEquality().hash(_transParam),const DeepCollectionEquality().hash(_theme)]);

@override
String toString() {
  return 'SearchCollectInfo(specialId: $specialId, specialName: $specialName, img: $img, intro: $intro, songCount: $songCount, playCount: $playCount, collectCount: $collectCount, totalPlayCount: $totalPlayCount, nickname: $nickname, suid: $suid, isPublish: $isPublish, isVip: $isVip, isUgc: $isUgc, isMutual: $isMutual, isCustom: $isCustom, isPeriodical: $isPeriodical, tagStr: $tagStr, contain: $contain, publishTime: $publishTime, gid: $gid, version: $version, quality: $quality, qualityNew: $qualityNew, grade: $grade, gradeInt: $gradeInt, gradeFloat: $gradeFloat, nper: $nper, srid: $srid, algPath: $algPath, abTags: $abTags, transParam: $transParam, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$SearchCollectInfoCopyWith<$Res> implements $SearchCollectInfoCopyWith<$Res> {
  factory _$SearchCollectInfoCopyWith(_SearchCollectInfo value, $Res Function(_SearchCollectInfo) _then) = __$SearchCollectInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'specialid') int specialId,@JsonKey(name: 'specialname') String specialName,@JsonKey(name: 'img') String img,@JsonKey(name: 'intro') String intro,@IntFromStringConverter()@JsonKey(name: 'song_count') int songCount,@JsonKey(name: 'play_count') String playCount,@JsonKey(name: 'collect_count') String collectCount,@JsonKey(name: 'total_play_count') String totalPlayCount,@JsonKey(name: 'nickname') String nickname,@JsonKey(name: 'suid') String suid,@IntFromStringConverter()@JsonKey(name: 'ispublish') int isPublish,@IntFromStringConverter()@JsonKey(name: 'isvip') int isVip,@IntFromStringConverter()@JsonKey(name: 'isugc') int isUgc,@IntFromStringConverter()@JsonKey(name: 'is_mutual') int isMutual,@IntFromStringConverter()@JsonKey(name: 'iscustom') int isCustom,@IntFromStringConverter()@JsonKey(name: 'isperiodical') int isPeriodical,@JsonKey(name: 'tag_str') String tagStr,@JsonKey(name: 'contain') String contain,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'gid') String gid,@IntFromStringConverter()@JsonKey(name: 'version') int version,@IntFromStringConverter()@JsonKey(name: 'quality') int quality,@IntFromStringConverter()@JsonKey(name: 'quality_new') int qualityNew,@IntFromStringConverter()@JsonKey(name: 'grade') int grade,@IntFromStringConverter()@JsonKey(name: 'grade_int') int gradeInt,@JsonKey(name: 'grade_float') String gradeFloat,@IntFromStringConverter()@JsonKey(name: 'nper') int nper,@JsonKey(name: 'srid') String srid,@JsonKey(name: 'alg_path') String algPath,@JsonKey(name: 'abtags') Map<String, dynamic> abTags,@JsonKey(name: 'trans_param') Map<String, dynamic> transParam,@JsonKey(name: 'theme') Map<String, dynamic> theme
});




}
/// @nodoc
class __$SearchCollectInfoCopyWithImpl<$Res>
    implements _$SearchCollectInfoCopyWith<$Res> {
  __$SearchCollectInfoCopyWithImpl(this._self, this._then);

  final _SearchCollectInfo _self;
  final $Res Function(_SearchCollectInfo) _then;

/// Create a copy of SearchCollectInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? specialId = null,Object? specialName = null,Object? img = null,Object? intro = null,Object? songCount = null,Object? playCount = null,Object? collectCount = null,Object? totalPlayCount = null,Object? nickname = null,Object? suid = null,Object? isPublish = null,Object? isVip = null,Object? isUgc = null,Object? isMutual = null,Object? isCustom = null,Object? isPeriodical = null,Object? tagStr = null,Object? contain = null,Object? publishTime = null,Object? gid = null,Object? version = null,Object? quality = null,Object? qualityNew = null,Object? grade = null,Object? gradeInt = null,Object? gradeFloat = null,Object? nper = null,Object? srid = null,Object? algPath = null,Object? abTags = null,Object? transParam = null,Object? theme = null,}) {
  return _then(_SearchCollectInfo(
specialId: null == specialId ? _self.specialId : specialId // ignore: cast_nullable_to_non_nullable
as int,specialName: null == specialName ? _self.specialName : specialName // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as String,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as String,totalPlayCount: null == totalPlayCount ? _self.totalPlayCount : totalPlayCount // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,suid: null == suid ? _self.suid : suid // ignore: cast_nullable_to_non_nullable
as String,isPublish: null == isPublish ? _self.isPublish : isPublish // ignore: cast_nullable_to_non_nullable
as int,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as int,isUgc: null == isUgc ? _self.isUgc : isUgc // ignore: cast_nullable_to_non_nullable
as int,isMutual: null == isMutual ? _self.isMutual : isMutual // ignore: cast_nullable_to_non_nullable
as int,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as int,isPeriodical: null == isPeriodical ? _self.isPeriodical : isPeriodical // ignore: cast_nullable_to_non_nullable
as int,tagStr: null == tagStr ? _self.tagStr : tagStr // ignore: cast_nullable_to_non_nullable
as String,contain: null == contain ? _self.contain : contain // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,gid: null == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,qualityNew: null == qualityNew ? _self.qualityNew : qualityNew // ignore: cast_nullable_to_non_nullable
as int,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int,gradeInt: null == gradeInt ? _self.gradeInt : gradeInt // ignore: cast_nullable_to_non_nullable
as int,gradeFloat: null == gradeFloat ? _self.gradeFloat : gradeFloat // ignore: cast_nullable_to_non_nullable
as String,nper: null == nper ? _self.nper : nper // ignore: cast_nullable_to_non_nullable
as int,srid: null == srid ? _self.srid : srid // ignore: cast_nullable_to_non_nullable
as String,algPath: null == algPath ? _self.algPath : algPath // ignore: cast_nullable_to_non_nullable
as String,abTags: null == abTags ? _self._abTags : abTags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,transParam: null == transParam ? _self._transParam : transParam // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,theme: null == theme ? _self._theme : theme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on

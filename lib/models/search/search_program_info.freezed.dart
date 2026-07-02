// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_program_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchProgramInfo {

/// 专辑ID
@IntFromStringConverter()@JsonKey(name: 'albumid') int get albumId;/// 专辑名称
@JsonKey(name: 'albumname') String get albumName;/// 标题
@JsonKey(name: 'title') String get title;/// 封面图
@JsonKey(name: 'img') String get img;/// 歌手名
@JsonKey(name: 'singer') String get singer;/// 播放次数
@IntFromStringConverter()@JsonKey(name: 'play_count') int get playCount;/// 播放时长
@IntFromStringConverter()@JsonKey(name: 'play_times') int get playTimes;/// 歌曲数量
@IntFromStringConverter()@JsonKey(name: 'songcount') int get songCount;/// 收藏数
@IntFromStringConverter()@JsonKey(name: 'collect_count') int get collectCount;/// 购买者数量
@IntFromStringConverter()@JsonKey(name: 'buyercount') int get buyerCount;/// 是否首发
@IntFromStringConverter()@JsonKey(name: 'isfirst') int get isFirst;/// 是否外部
@IntFromStringConverter()@JsonKey(name: 'isouter') int get isOuter;/// 语言
@JsonKey(name: 'language') String get language;/// 分类
@IntFromStringConverter()@JsonKey(name: 'category') int get category;/// 简介
@JsonKey(name: 'intro') String get intro;/// 短简介
@JsonKey(name: 'short_intro') String get shortIntro;/// 标签
@JsonKey(name: 'tag_str') String get tagStr;/// 发布时间
@JsonKey(name: 'publish_time') String get publishTime;/// 公司
@JsonKey(name: 'company') String get company;/// CD链接
@JsonKey(name: 'cd_url') String get cdUrl;/// 跳转链接
@JsonKey(name: 'jump_url') String get jumpUrl;/// 章节名
@JsonKey(name: 'chapter_name') String get chapterName;/// 专辑辅助信息
@JsonKey(name: 'album_aux') String get albumAux;/// 辅助信息
@JsonKey(name: 'auxiliary') String get auxiliary;/// 备注
@JsonKey(name: 'ostremark') String get ostRemark;/// 评分
@JsonKey(name: 'grade') String get grade;/// 评分(整数)
@JsonKey(name: 'grade_int') String get gradeInt;/// 评分(浮点)
@JsonKey(name: 'grade_float') String get gradeFloat;/// 新质量
@IntFromStringConverter()@JsonKey(name: 'newquality') int get newQuality;/// 质量
@IntFromStringConverter()@JsonKey(name: 'quality') int get quality;/// 特权
@IntFromStringConverter()@JsonKey(name: 'privilege') int get privilege;/// 是否隐藏(旧)
@IntFromStringConverter()@JsonKey(name: 'oldhide') int get oldHide;/// 是否内部节目
@IntFromStringConverter()@JsonKey(name: 'program_inner') int get programInner;/// 特殊标签
@JsonKey(name: 'special_tag') String get specialTag;/// 推荐标签
@JsonKey(name: 'rec_tag') Map<String, dynamic> get recTag;/// 传输参数
@JsonKey(name: 'trans_param') Map<String, dynamic> get transParam;/// 外部数据
@JsonKey(name: 'outerdata') Map<String, dynamic> get outerData;/// 歌手列表
@JsonKey(name: 'singers') List<SearchProgramSinger> get singers;/// 歌手ID列表
@JsonKey(name: 'singerids') List<int> get singerIds;/// 默认歌曲列表
@JsonKey(name: 'program_def_songs') List<String> get programDefSongs;
/// Create a copy of SearchProgramInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProgramInfoCopyWith<SearchProgramInfo> get copyWith => _$SearchProgramInfoCopyWithImpl<SearchProgramInfo>(this as SearchProgramInfo, _$identity);

  /// Serializes this SearchProgramInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProgramInfo&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.title, title) || other.title == title)&&(identical(other.img, img) || other.img == img)&&(identical(other.singer, singer) || other.singer == singer)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.playTimes, playTimes) || other.playTimes == playTimes)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.buyerCount, buyerCount) || other.buyerCount == buyerCount)&&(identical(other.isFirst, isFirst) || other.isFirst == isFirst)&&(identical(other.isOuter, isOuter) || other.isOuter == isOuter)&&(identical(other.language, language) || other.language == language)&&(identical(other.category, category) || other.category == category)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.shortIntro, shortIntro) || other.shortIntro == shortIntro)&&(identical(other.tagStr, tagStr) || other.tagStr == tagStr)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.company, company) || other.company == company)&&(identical(other.cdUrl, cdUrl) || other.cdUrl == cdUrl)&&(identical(other.jumpUrl, jumpUrl) || other.jumpUrl == jumpUrl)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.albumAux, albumAux) || other.albumAux == albumAux)&&(identical(other.auxiliary, auxiliary) || other.auxiliary == auxiliary)&&(identical(other.ostRemark, ostRemark) || other.ostRemark == ostRemark)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.gradeInt, gradeInt) || other.gradeInt == gradeInt)&&(identical(other.gradeFloat, gradeFloat) || other.gradeFloat == gradeFloat)&&(identical(other.newQuality, newQuality) || other.newQuality == newQuality)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.oldHide, oldHide) || other.oldHide == oldHide)&&(identical(other.programInner, programInner) || other.programInner == programInner)&&(identical(other.specialTag, specialTag) || other.specialTag == specialTag)&&const DeepCollectionEquality().equals(other.recTag, recTag)&&const DeepCollectionEquality().equals(other.transParam, transParam)&&const DeepCollectionEquality().equals(other.outerData, outerData)&&const DeepCollectionEquality().equals(other.singers, singers)&&const DeepCollectionEquality().equals(other.singerIds, singerIds)&&const DeepCollectionEquality().equals(other.programDefSongs, programDefSongs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,albumId,albumName,title,img,singer,playCount,playTimes,songCount,collectCount,buyerCount,isFirst,isOuter,language,category,intro,shortIntro,tagStr,publishTime,company,cdUrl,jumpUrl,chapterName,albumAux,auxiliary,ostRemark,grade,gradeInt,gradeFloat,newQuality,quality,privilege,oldHide,programInner,specialTag,const DeepCollectionEquality().hash(recTag),const DeepCollectionEquality().hash(transParam),const DeepCollectionEquality().hash(outerData),const DeepCollectionEquality().hash(singers),const DeepCollectionEquality().hash(singerIds),const DeepCollectionEquality().hash(programDefSongs)]);

@override
String toString() {
  return 'SearchProgramInfo(albumId: $albumId, albumName: $albumName, title: $title, img: $img, singer: $singer, playCount: $playCount, playTimes: $playTimes, songCount: $songCount, collectCount: $collectCount, buyerCount: $buyerCount, isFirst: $isFirst, isOuter: $isOuter, language: $language, category: $category, intro: $intro, shortIntro: $shortIntro, tagStr: $tagStr, publishTime: $publishTime, company: $company, cdUrl: $cdUrl, jumpUrl: $jumpUrl, chapterName: $chapterName, albumAux: $albumAux, auxiliary: $auxiliary, ostRemark: $ostRemark, grade: $grade, gradeInt: $gradeInt, gradeFloat: $gradeFloat, newQuality: $newQuality, quality: $quality, privilege: $privilege, oldHide: $oldHide, programInner: $programInner, specialTag: $specialTag, recTag: $recTag, transParam: $transParam, outerData: $outerData, singers: $singers, singerIds: $singerIds, programDefSongs: $programDefSongs)';
}


}

/// @nodoc
abstract mixin class $SearchProgramInfoCopyWith<$Res>  {
  factory $SearchProgramInfoCopyWith(SearchProgramInfo value, $Res Function(SearchProgramInfo) _then) = _$SearchProgramInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'albumid') int albumId,@JsonKey(name: 'albumname') String albumName,@JsonKey(name: 'title') String title,@JsonKey(name: 'img') String img,@JsonKey(name: 'singer') String singer,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@IntFromStringConverter()@JsonKey(name: 'play_times') int playTimes,@IntFromStringConverter()@JsonKey(name: 'songcount') int songCount,@IntFromStringConverter()@JsonKey(name: 'collect_count') int collectCount,@IntFromStringConverter()@JsonKey(name: 'buyercount') int buyerCount,@IntFromStringConverter()@JsonKey(name: 'isfirst') int isFirst,@IntFromStringConverter()@JsonKey(name: 'isouter') int isOuter,@JsonKey(name: 'language') String language,@IntFromStringConverter()@JsonKey(name: 'category') int category,@JsonKey(name: 'intro') String intro,@JsonKey(name: 'short_intro') String shortIntro,@JsonKey(name: 'tag_str') String tagStr,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'company') String company,@JsonKey(name: 'cd_url') String cdUrl,@JsonKey(name: 'jump_url') String jumpUrl,@JsonKey(name: 'chapter_name') String chapterName,@JsonKey(name: 'album_aux') String albumAux,@JsonKey(name: 'auxiliary') String auxiliary,@JsonKey(name: 'ostremark') String ostRemark,@JsonKey(name: 'grade') String grade,@JsonKey(name: 'grade_int') String gradeInt,@JsonKey(name: 'grade_float') String gradeFloat,@IntFromStringConverter()@JsonKey(name: 'newquality') int newQuality,@IntFromStringConverter()@JsonKey(name: 'quality') int quality,@IntFromStringConverter()@JsonKey(name: 'privilege') int privilege,@IntFromStringConverter()@JsonKey(name: 'oldhide') int oldHide,@IntFromStringConverter()@JsonKey(name: 'program_inner') int programInner,@JsonKey(name: 'special_tag') String specialTag,@JsonKey(name: 'rec_tag') Map<String, dynamic> recTag,@JsonKey(name: 'trans_param') Map<String, dynamic> transParam,@JsonKey(name: 'outerdata') Map<String, dynamic> outerData,@JsonKey(name: 'singers') List<SearchProgramSinger> singers,@JsonKey(name: 'singerids') List<int> singerIds,@JsonKey(name: 'program_def_songs') List<String> programDefSongs
});




}
/// @nodoc
class _$SearchProgramInfoCopyWithImpl<$Res>
    implements $SearchProgramInfoCopyWith<$Res> {
  _$SearchProgramInfoCopyWithImpl(this._self, this._then);

  final SearchProgramInfo _self;
  final $Res Function(SearchProgramInfo) _then;

/// Create a copy of SearchProgramInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? albumId = null,Object? albumName = null,Object? title = null,Object? img = null,Object? singer = null,Object? playCount = null,Object? playTimes = null,Object? songCount = null,Object? collectCount = null,Object? buyerCount = null,Object? isFirst = null,Object? isOuter = null,Object? language = null,Object? category = null,Object? intro = null,Object? shortIntro = null,Object? tagStr = null,Object? publishTime = null,Object? company = null,Object? cdUrl = null,Object? jumpUrl = null,Object? chapterName = null,Object? albumAux = null,Object? auxiliary = null,Object? ostRemark = null,Object? grade = null,Object? gradeInt = null,Object? gradeFloat = null,Object? newQuality = null,Object? quality = null,Object? privilege = null,Object? oldHide = null,Object? programInner = null,Object? specialTag = null,Object? recTag = null,Object? transParam = null,Object? outerData = null,Object? singers = null,Object? singerIds = null,Object? programDefSongs = null,}) {
  return _then(_self.copyWith(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,singer: null == singer ? _self.singer : singer // ignore: cast_nullable_to_non_nullable
as String,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,playTimes: null == playTimes ? _self.playTimes : playTimes // ignore: cast_nullable_to_non_nullable
as int,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as int,buyerCount: null == buyerCount ? _self.buyerCount : buyerCount // ignore: cast_nullable_to_non_nullable
as int,isFirst: null == isFirst ? _self.isFirst : isFirst // ignore: cast_nullable_to_non_nullable
as int,isOuter: null == isOuter ? _self.isOuter : isOuter // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,shortIntro: null == shortIntro ? _self.shortIntro : shortIntro // ignore: cast_nullable_to_non_nullable
as String,tagStr: null == tagStr ? _self.tagStr : tagStr // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,cdUrl: null == cdUrl ? _self.cdUrl : cdUrl // ignore: cast_nullable_to_non_nullable
as String,jumpUrl: null == jumpUrl ? _self.jumpUrl : jumpUrl // ignore: cast_nullable_to_non_nullable
as String,chapterName: null == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String,albumAux: null == albumAux ? _self.albumAux : albumAux // ignore: cast_nullable_to_non_nullable
as String,auxiliary: null == auxiliary ? _self.auxiliary : auxiliary // ignore: cast_nullable_to_non_nullable
as String,ostRemark: null == ostRemark ? _self.ostRemark : ostRemark // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,gradeInt: null == gradeInt ? _self.gradeInt : gradeInt // ignore: cast_nullable_to_non_nullable
as String,gradeFloat: null == gradeFloat ? _self.gradeFloat : gradeFloat // ignore: cast_nullable_to_non_nullable
as String,newQuality: null == newQuality ? _self.newQuality : newQuality // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,oldHide: null == oldHide ? _self.oldHide : oldHide // ignore: cast_nullable_to_non_nullable
as int,programInner: null == programInner ? _self.programInner : programInner // ignore: cast_nullable_to_non_nullable
as int,specialTag: null == specialTag ? _self.specialTag : specialTag // ignore: cast_nullable_to_non_nullable
as String,recTag: null == recTag ? _self.recTag : recTag // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,transParam: null == transParam ? _self.transParam : transParam // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,outerData: null == outerData ? _self.outerData : outerData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,singers: null == singers ? _self.singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchProgramSinger>,singerIds: null == singerIds ? _self.singerIds : singerIds // ignore: cast_nullable_to_non_nullable
as List<int>,programDefSongs: null == programDefSongs ? _self.programDefSongs : programDefSongs // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchProgramInfo].
extension SearchProgramInfoPatterns on SearchProgramInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProgramInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProgramInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProgramInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchProgramInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProgramInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProgramInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'title')  String title, @JsonKey(name: 'img')  String img, @JsonKey(name: 'singer')  String singer, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()@JsonKey(name: 'play_times')  int playTimes, @IntFromStringConverter()@JsonKey(name: 'songcount')  int songCount, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'buyercount')  int buyerCount, @IntFromStringConverter()@JsonKey(name: 'isfirst')  int isFirst, @IntFromStringConverter()@JsonKey(name: 'isouter')  int isOuter, @JsonKey(name: 'language')  String language, @IntFromStringConverter()@JsonKey(name: 'category')  int category, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'short_intro')  String shortIntro, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'company')  String company, @JsonKey(name: 'cd_url')  String cdUrl, @JsonKey(name: 'jump_url')  String jumpUrl, @JsonKey(name: 'chapter_name')  String chapterName, @JsonKey(name: 'album_aux')  String albumAux, @JsonKey(name: 'auxiliary')  String auxiliary, @JsonKey(name: 'ostremark')  String ostRemark, @JsonKey(name: 'grade')  String grade, @JsonKey(name: 'grade_int')  String gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'newquality')  int newQuality, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'oldhide')  int oldHide, @IntFromStringConverter()@JsonKey(name: 'program_inner')  int programInner, @JsonKey(name: 'special_tag')  String specialTag, @JsonKey(name: 'rec_tag')  Map<String, dynamic> recTag, @JsonKey(name: 'trans_param')  Map<String, dynamic> transParam, @JsonKey(name: 'outerdata')  Map<String, dynamic> outerData, @JsonKey(name: 'singers')  List<SearchProgramSinger> singers, @JsonKey(name: 'singerids')  List<int> singerIds, @JsonKey(name: 'program_def_songs')  List<String> programDefSongs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProgramInfo() when $default != null:
return $default(_that.albumId,_that.albumName,_that.title,_that.img,_that.singer,_that.playCount,_that.playTimes,_that.songCount,_that.collectCount,_that.buyerCount,_that.isFirst,_that.isOuter,_that.language,_that.category,_that.intro,_that.shortIntro,_that.tagStr,_that.publishTime,_that.company,_that.cdUrl,_that.jumpUrl,_that.chapterName,_that.albumAux,_that.auxiliary,_that.ostRemark,_that.grade,_that.gradeInt,_that.gradeFloat,_that.newQuality,_that.quality,_that.privilege,_that.oldHide,_that.programInner,_that.specialTag,_that.recTag,_that.transParam,_that.outerData,_that.singers,_that.singerIds,_that.programDefSongs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'title')  String title, @JsonKey(name: 'img')  String img, @JsonKey(name: 'singer')  String singer, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()@JsonKey(name: 'play_times')  int playTimes, @IntFromStringConverter()@JsonKey(name: 'songcount')  int songCount, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'buyercount')  int buyerCount, @IntFromStringConverter()@JsonKey(name: 'isfirst')  int isFirst, @IntFromStringConverter()@JsonKey(name: 'isouter')  int isOuter, @JsonKey(name: 'language')  String language, @IntFromStringConverter()@JsonKey(name: 'category')  int category, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'short_intro')  String shortIntro, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'company')  String company, @JsonKey(name: 'cd_url')  String cdUrl, @JsonKey(name: 'jump_url')  String jumpUrl, @JsonKey(name: 'chapter_name')  String chapterName, @JsonKey(name: 'album_aux')  String albumAux, @JsonKey(name: 'auxiliary')  String auxiliary, @JsonKey(name: 'ostremark')  String ostRemark, @JsonKey(name: 'grade')  String grade, @JsonKey(name: 'grade_int')  String gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'newquality')  int newQuality, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'oldhide')  int oldHide, @IntFromStringConverter()@JsonKey(name: 'program_inner')  int programInner, @JsonKey(name: 'special_tag')  String specialTag, @JsonKey(name: 'rec_tag')  Map<String, dynamic> recTag, @JsonKey(name: 'trans_param')  Map<String, dynamic> transParam, @JsonKey(name: 'outerdata')  Map<String, dynamic> outerData, @JsonKey(name: 'singers')  List<SearchProgramSinger> singers, @JsonKey(name: 'singerids')  List<int> singerIds, @JsonKey(name: 'program_def_songs')  List<String> programDefSongs)  $default,) {final _that = this;
switch (_that) {
case _SearchProgramInfo():
return $default(_that.albumId,_that.albumName,_that.title,_that.img,_that.singer,_that.playCount,_that.playTimes,_that.songCount,_that.collectCount,_that.buyerCount,_that.isFirst,_that.isOuter,_that.language,_that.category,_that.intro,_that.shortIntro,_that.tagStr,_that.publishTime,_that.company,_that.cdUrl,_that.jumpUrl,_that.chapterName,_that.albumAux,_that.auxiliary,_that.ostRemark,_that.grade,_that.gradeInt,_that.gradeFloat,_that.newQuality,_that.quality,_that.privilege,_that.oldHide,_that.programInner,_that.specialTag,_that.recTag,_that.transParam,_that.outerData,_that.singers,_that.singerIds,_that.programDefSongs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'title')  String title, @JsonKey(name: 'img')  String img, @JsonKey(name: 'singer')  String singer, @IntFromStringConverter()@JsonKey(name: 'play_count')  int playCount, @IntFromStringConverter()@JsonKey(name: 'play_times')  int playTimes, @IntFromStringConverter()@JsonKey(name: 'songcount')  int songCount, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'buyercount')  int buyerCount, @IntFromStringConverter()@JsonKey(name: 'isfirst')  int isFirst, @IntFromStringConverter()@JsonKey(name: 'isouter')  int isOuter, @JsonKey(name: 'language')  String language, @IntFromStringConverter()@JsonKey(name: 'category')  int category, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'short_intro')  String shortIntro, @JsonKey(name: 'tag_str')  String tagStr, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'company')  String company, @JsonKey(name: 'cd_url')  String cdUrl, @JsonKey(name: 'jump_url')  String jumpUrl, @JsonKey(name: 'chapter_name')  String chapterName, @JsonKey(name: 'album_aux')  String albumAux, @JsonKey(name: 'auxiliary')  String auxiliary, @JsonKey(name: 'ostremark')  String ostRemark, @JsonKey(name: 'grade')  String grade, @JsonKey(name: 'grade_int')  String gradeInt, @JsonKey(name: 'grade_float')  String gradeFloat, @IntFromStringConverter()@JsonKey(name: 'newquality')  int newQuality, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'oldhide')  int oldHide, @IntFromStringConverter()@JsonKey(name: 'program_inner')  int programInner, @JsonKey(name: 'special_tag')  String specialTag, @JsonKey(name: 'rec_tag')  Map<String, dynamic> recTag, @JsonKey(name: 'trans_param')  Map<String, dynamic> transParam, @JsonKey(name: 'outerdata')  Map<String, dynamic> outerData, @JsonKey(name: 'singers')  List<SearchProgramSinger> singers, @JsonKey(name: 'singerids')  List<int> singerIds, @JsonKey(name: 'program_def_songs')  List<String> programDefSongs)?  $default,) {final _that = this;
switch (_that) {
case _SearchProgramInfo() when $default != null:
return $default(_that.albumId,_that.albumName,_that.title,_that.img,_that.singer,_that.playCount,_that.playTimes,_that.songCount,_that.collectCount,_that.buyerCount,_that.isFirst,_that.isOuter,_that.language,_that.category,_that.intro,_that.shortIntro,_that.tagStr,_that.publishTime,_that.company,_that.cdUrl,_that.jumpUrl,_that.chapterName,_that.albumAux,_that.auxiliary,_that.ostRemark,_that.grade,_that.gradeInt,_that.gradeFloat,_that.newQuality,_that.quality,_that.privilege,_that.oldHide,_that.programInner,_that.specialTag,_that.recTag,_that.transParam,_that.outerData,_that.singers,_that.singerIds,_that.programDefSongs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProgramInfo implements SearchProgramInfo {
  const _SearchProgramInfo({@IntFromStringConverter()@JsonKey(name: 'albumid') this.albumId = 0, @JsonKey(name: 'albumname') this.albumName = '', @JsonKey(name: 'title') this.title = '', @JsonKey(name: 'img') this.img = '', @JsonKey(name: 'singer') this.singer = '', @IntFromStringConverter()@JsonKey(name: 'play_count') this.playCount = 0, @IntFromStringConverter()@JsonKey(name: 'play_times') this.playTimes = 0, @IntFromStringConverter()@JsonKey(name: 'songcount') this.songCount = 0, @IntFromStringConverter()@JsonKey(name: 'collect_count') this.collectCount = 0, @IntFromStringConverter()@JsonKey(name: 'buyercount') this.buyerCount = 0, @IntFromStringConverter()@JsonKey(name: 'isfirst') this.isFirst = 0, @IntFromStringConverter()@JsonKey(name: 'isouter') this.isOuter = 0, @JsonKey(name: 'language') this.language = '', @IntFromStringConverter()@JsonKey(name: 'category') this.category = 0, @JsonKey(name: 'intro') this.intro = '', @JsonKey(name: 'short_intro') this.shortIntro = '', @JsonKey(name: 'tag_str') this.tagStr = '', @JsonKey(name: 'publish_time') this.publishTime = '', @JsonKey(name: 'company') this.company = '', @JsonKey(name: 'cd_url') this.cdUrl = '', @JsonKey(name: 'jump_url') this.jumpUrl = '', @JsonKey(name: 'chapter_name') this.chapterName = '', @JsonKey(name: 'album_aux') this.albumAux = '', @JsonKey(name: 'auxiliary') this.auxiliary = '', @JsonKey(name: 'ostremark') this.ostRemark = '', @JsonKey(name: 'grade') this.grade = '', @JsonKey(name: 'grade_int') this.gradeInt = '', @JsonKey(name: 'grade_float') this.gradeFloat = '', @IntFromStringConverter()@JsonKey(name: 'newquality') this.newQuality = 0, @IntFromStringConverter()@JsonKey(name: 'quality') this.quality = 0, @IntFromStringConverter()@JsonKey(name: 'privilege') this.privilege = 0, @IntFromStringConverter()@JsonKey(name: 'oldhide') this.oldHide = 0, @IntFromStringConverter()@JsonKey(name: 'program_inner') this.programInner = 0, @JsonKey(name: 'special_tag') this.specialTag = '', @JsonKey(name: 'rec_tag') final  Map<String, dynamic> recTag = const {}, @JsonKey(name: 'trans_param') final  Map<String, dynamic> transParam = const {}, @JsonKey(name: 'outerdata') final  Map<String, dynamic> outerData = const {}, @JsonKey(name: 'singers') final  List<SearchProgramSinger> singers = const [], @JsonKey(name: 'singerids') final  List<int> singerIds = const [], @JsonKey(name: 'program_def_songs') final  List<String> programDefSongs = const []}): _recTag = recTag,_transParam = transParam,_outerData = outerData,_singers = singers,_singerIds = singerIds,_programDefSongs = programDefSongs;
  factory _SearchProgramInfo.fromJson(Map<String, dynamic> json) => _$SearchProgramInfoFromJson(json);

/// 专辑ID
@override@IntFromStringConverter()@JsonKey(name: 'albumid') final  int albumId;
/// 专辑名称
@override@JsonKey(name: 'albumname') final  String albumName;
/// 标题
@override@JsonKey(name: 'title') final  String title;
/// 封面图
@override@JsonKey(name: 'img') final  String img;
/// 歌手名
@override@JsonKey(name: 'singer') final  String singer;
/// 播放次数
@override@IntFromStringConverter()@JsonKey(name: 'play_count') final  int playCount;
/// 播放时长
@override@IntFromStringConverter()@JsonKey(name: 'play_times') final  int playTimes;
/// 歌曲数量
@override@IntFromStringConverter()@JsonKey(name: 'songcount') final  int songCount;
/// 收藏数
@override@IntFromStringConverter()@JsonKey(name: 'collect_count') final  int collectCount;
/// 购买者数量
@override@IntFromStringConverter()@JsonKey(name: 'buyercount') final  int buyerCount;
/// 是否首发
@override@IntFromStringConverter()@JsonKey(name: 'isfirst') final  int isFirst;
/// 是否外部
@override@IntFromStringConverter()@JsonKey(name: 'isouter') final  int isOuter;
/// 语言
@override@JsonKey(name: 'language') final  String language;
/// 分类
@override@IntFromStringConverter()@JsonKey(name: 'category') final  int category;
/// 简介
@override@JsonKey(name: 'intro') final  String intro;
/// 短简介
@override@JsonKey(name: 'short_intro') final  String shortIntro;
/// 标签
@override@JsonKey(name: 'tag_str') final  String tagStr;
/// 发布时间
@override@JsonKey(name: 'publish_time') final  String publishTime;
/// 公司
@override@JsonKey(name: 'company') final  String company;
/// CD链接
@override@JsonKey(name: 'cd_url') final  String cdUrl;
/// 跳转链接
@override@JsonKey(name: 'jump_url') final  String jumpUrl;
/// 章节名
@override@JsonKey(name: 'chapter_name') final  String chapterName;
/// 专辑辅助信息
@override@JsonKey(name: 'album_aux') final  String albumAux;
/// 辅助信息
@override@JsonKey(name: 'auxiliary') final  String auxiliary;
/// 备注
@override@JsonKey(name: 'ostremark') final  String ostRemark;
/// 评分
@override@JsonKey(name: 'grade') final  String grade;
/// 评分(整数)
@override@JsonKey(name: 'grade_int') final  String gradeInt;
/// 评分(浮点)
@override@JsonKey(name: 'grade_float') final  String gradeFloat;
/// 新质量
@override@IntFromStringConverter()@JsonKey(name: 'newquality') final  int newQuality;
/// 质量
@override@IntFromStringConverter()@JsonKey(name: 'quality') final  int quality;
/// 特权
@override@IntFromStringConverter()@JsonKey(name: 'privilege') final  int privilege;
/// 是否隐藏(旧)
@override@IntFromStringConverter()@JsonKey(name: 'oldhide') final  int oldHide;
/// 是否内部节目
@override@IntFromStringConverter()@JsonKey(name: 'program_inner') final  int programInner;
/// 特殊标签
@override@JsonKey(name: 'special_tag') final  String specialTag;
/// 推荐标签
 final  Map<String, dynamic> _recTag;
/// 推荐标签
@override@JsonKey(name: 'rec_tag') Map<String, dynamic> get recTag {
  if (_recTag is EqualUnmodifiableMapView) return _recTag;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_recTag);
}

/// 传输参数
 final  Map<String, dynamic> _transParam;
/// 传输参数
@override@JsonKey(name: 'trans_param') Map<String, dynamic> get transParam {
  if (_transParam is EqualUnmodifiableMapView) return _transParam;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_transParam);
}

/// 外部数据
 final  Map<String, dynamic> _outerData;
/// 外部数据
@override@JsonKey(name: 'outerdata') Map<String, dynamic> get outerData {
  if (_outerData is EqualUnmodifiableMapView) return _outerData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_outerData);
}

/// 歌手列表
 final  List<SearchProgramSinger> _singers;
/// 歌手列表
@override@JsonKey(name: 'singers') List<SearchProgramSinger> get singers {
  if (_singers is EqualUnmodifiableListView) return _singers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singers);
}

/// 歌手ID列表
 final  List<int> _singerIds;
/// 歌手ID列表
@override@JsonKey(name: 'singerids') List<int> get singerIds {
  if (_singerIds is EqualUnmodifiableListView) return _singerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singerIds);
}

/// 默认歌曲列表
 final  List<String> _programDefSongs;
/// 默认歌曲列表
@override@JsonKey(name: 'program_def_songs') List<String> get programDefSongs {
  if (_programDefSongs is EqualUnmodifiableListView) return _programDefSongs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_programDefSongs);
}


/// Create a copy of SearchProgramInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProgramInfoCopyWith<_SearchProgramInfo> get copyWith => __$SearchProgramInfoCopyWithImpl<_SearchProgramInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProgramInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProgramInfo&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.title, title) || other.title == title)&&(identical(other.img, img) || other.img == img)&&(identical(other.singer, singer) || other.singer == singer)&&(identical(other.playCount, playCount) || other.playCount == playCount)&&(identical(other.playTimes, playTimes) || other.playTimes == playTimes)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.buyerCount, buyerCount) || other.buyerCount == buyerCount)&&(identical(other.isFirst, isFirst) || other.isFirst == isFirst)&&(identical(other.isOuter, isOuter) || other.isOuter == isOuter)&&(identical(other.language, language) || other.language == language)&&(identical(other.category, category) || other.category == category)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.shortIntro, shortIntro) || other.shortIntro == shortIntro)&&(identical(other.tagStr, tagStr) || other.tagStr == tagStr)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.company, company) || other.company == company)&&(identical(other.cdUrl, cdUrl) || other.cdUrl == cdUrl)&&(identical(other.jumpUrl, jumpUrl) || other.jumpUrl == jumpUrl)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.albumAux, albumAux) || other.albumAux == albumAux)&&(identical(other.auxiliary, auxiliary) || other.auxiliary == auxiliary)&&(identical(other.ostRemark, ostRemark) || other.ostRemark == ostRemark)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.gradeInt, gradeInt) || other.gradeInt == gradeInt)&&(identical(other.gradeFloat, gradeFloat) || other.gradeFloat == gradeFloat)&&(identical(other.newQuality, newQuality) || other.newQuality == newQuality)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.oldHide, oldHide) || other.oldHide == oldHide)&&(identical(other.programInner, programInner) || other.programInner == programInner)&&(identical(other.specialTag, specialTag) || other.specialTag == specialTag)&&const DeepCollectionEquality().equals(other._recTag, _recTag)&&const DeepCollectionEquality().equals(other._transParam, _transParam)&&const DeepCollectionEquality().equals(other._outerData, _outerData)&&const DeepCollectionEquality().equals(other._singers, _singers)&&const DeepCollectionEquality().equals(other._singerIds, _singerIds)&&const DeepCollectionEquality().equals(other._programDefSongs, _programDefSongs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,albumId,albumName,title,img,singer,playCount,playTimes,songCount,collectCount,buyerCount,isFirst,isOuter,language,category,intro,shortIntro,tagStr,publishTime,company,cdUrl,jumpUrl,chapterName,albumAux,auxiliary,ostRemark,grade,gradeInt,gradeFloat,newQuality,quality,privilege,oldHide,programInner,specialTag,const DeepCollectionEquality().hash(_recTag),const DeepCollectionEquality().hash(_transParam),const DeepCollectionEquality().hash(_outerData),const DeepCollectionEquality().hash(_singers),const DeepCollectionEquality().hash(_singerIds),const DeepCollectionEquality().hash(_programDefSongs)]);

@override
String toString() {
  return 'SearchProgramInfo(albumId: $albumId, albumName: $albumName, title: $title, img: $img, singer: $singer, playCount: $playCount, playTimes: $playTimes, songCount: $songCount, collectCount: $collectCount, buyerCount: $buyerCount, isFirst: $isFirst, isOuter: $isOuter, language: $language, category: $category, intro: $intro, shortIntro: $shortIntro, tagStr: $tagStr, publishTime: $publishTime, company: $company, cdUrl: $cdUrl, jumpUrl: $jumpUrl, chapterName: $chapterName, albumAux: $albumAux, auxiliary: $auxiliary, ostRemark: $ostRemark, grade: $grade, gradeInt: $gradeInt, gradeFloat: $gradeFloat, newQuality: $newQuality, quality: $quality, privilege: $privilege, oldHide: $oldHide, programInner: $programInner, specialTag: $specialTag, recTag: $recTag, transParam: $transParam, outerData: $outerData, singers: $singers, singerIds: $singerIds, programDefSongs: $programDefSongs)';
}


}

/// @nodoc
abstract mixin class _$SearchProgramInfoCopyWith<$Res> implements $SearchProgramInfoCopyWith<$Res> {
  factory _$SearchProgramInfoCopyWith(_SearchProgramInfo value, $Res Function(_SearchProgramInfo) _then) = __$SearchProgramInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'albumid') int albumId,@JsonKey(name: 'albumname') String albumName,@JsonKey(name: 'title') String title,@JsonKey(name: 'img') String img,@JsonKey(name: 'singer') String singer,@IntFromStringConverter()@JsonKey(name: 'play_count') int playCount,@IntFromStringConverter()@JsonKey(name: 'play_times') int playTimes,@IntFromStringConverter()@JsonKey(name: 'songcount') int songCount,@IntFromStringConverter()@JsonKey(name: 'collect_count') int collectCount,@IntFromStringConverter()@JsonKey(name: 'buyercount') int buyerCount,@IntFromStringConverter()@JsonKey(name: 'isfirst') int isFirst,@IntFromStringConverter()@JsonKey(name: 'isouter') int isOuter,@JsonKey(name: 'language') String language,@IntFromStringConverter()@JsonKey(name: 'category') int category,@JsonKey(name: 'intro') String intro,@JsonKey(name: 'short_intro') String shortIntro,@JsonKey(name: 'tag_str') String tagStr,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'company') String company,@JsonKey(name: 'cd_url') String cdUrl,@JsonKey(name: 'jump_url') String jumpUrl,@JsonKey(name: 'chapter_name') String chapterName,@JsonKey(name: 'album_aux') String albumAux,@JsonKey(name: 'auxiliary') String auxiliary,@JsonKey(name: 'ostremark') String ostRemark,@JsonKey(name: 'grade') String grade,@JsonKey(name: 'grade_int') String gradeInt,@JsonKey(name: 'grade_float') String gradeFloat,@IntFromStringConverter()@JsonKey(name: 'newquality') int newQuality,@IntFromStringConverter()@JsonKey(name: 'quality') int quality,@IntFromStringConverter()@JsonKey(name: 'privilege') int privilege,@IntFromStringConverter()@JsonKey(name: 'oldhide') int oldHide,@IntFromStringConverter()@JsonKey(name: 'program_inner') int programInner,@JsonKey(name: 'special_tag') String specialTag,@JsonKey(name: 'rec_tag') Map<String, dynamic> recTag,@JsonKey(name: 'trans_param') Map<String, dynamic> transParam,@JsonKey(name: 'outerdata') Map<String, dynamic> outerData,@JsonKey(name: 'singers') List<SearchProgramSinger> singers,@JsonKey(name: 'singerids') List<int> singerIds,@JsonKey(name: 'program_def_songs') List<String> programDefSongs
});




}
/// @nodoc
class __$SearchProgramInfoCopyWithImpl<$Res>
    implements _$SearchProgramInfoCopyWith<$Res> {
  __$SearchProgramInfoCopyWithImpl(this._self, this._then);

  final _SearchProgramInfo _self;
  final $Res Function(_SearchProgramInfo) _then;

/// Create a copy of SearchProgramInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? albumId = null,Object? albumName = null,Object? title = null,Object? img = null,Object? singer = null,Object? playCount = null,Object? playTimes = null,Object? songCount = null,Object? collectCount = null,Object? buyerCount = null,Object? isFirst = null,Object? isOuter = null,Object? language = null,Object? category = null,Object? intro = null,Object? shortIntro = null,Object? tagStr = null,Object? publishTime = null,Object? company = null,Object? cdUrl = null,Object? jumpUrl = null,Object? chapterName = null,Object? albumAux = null,Object? auxiliary = null,Object? ostRemark = null,Object? grade = null,Object? gradeInt = null,Object? gradeFloat = null,Object? newQuality = null,Object? quality = null,Object? privilege = null,Object? oldHide = null,Object? programInner = null,Object? specialTag = null,Object? recTag = null,Object? transParam = null,Object? outerData = null,Object? singers = null,Object? singerIds = null,Object? programDefSongs = null,}) {
  return _then(_SearchProgramInfo(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,singer: null == singer ? _self.singer : singer // ignore: cast_nullable_to_non_nullable
as String,playCount: null == playCount ? _self.playCount : playCount // ignore: cast_nullable_to_non_nullable
as int,playTimes: null == playTimes ? _self.playTimes : playTimes // ignore: cast_nullable_to_non_nullable
as int,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as int,buyerCount: null == buyerCount ? _self.buyerCount : buyerCount // ignore: cast_nullable_to_non_nullable
as int,isFirst: null == isFirst ? _self.isFirst : isFirst // ignore: cast_nullable_to_non_nullable
as int,isOuter: null == isOuter ? _self.isOuter : isOuter // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,shortIntro: null == shortIntro ? _self.shortIntro : shortIntro // ignore: cast_nullable_to_non_nullable
as String,tagStr: null == tagStr ? _self.tagStr : tagStr // ignore: cast_nullable_to_non_nullable
as String,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,cdUrl: null == cdUrl ? _self.cdUrl : cdUrl // ignore: cast_nullable_to_non_nullable
as String,jumpUrl: null == jumpUrl ? _self.jumpUrl : jumpUrl // ignore: cast_nullable_to_non_nullable
as String,chapterName: null == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String,albumAux: null == albumAux ? _self.albumAux : albumAux // ignore: cast_nullable_to_non_nullable
as String,auxiliary: null == auxiliary ? _self.auxiliary : auxiliary // ignore: cast_nullable_to_non_nullable
as String,ostRemark: null == ostRemark ? _self.ostRemark : ostRemark // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,gradeInt: null == gradeInt ? _self.gradeInt : gradeInt // ignore: cast_nullable_to_non_nullable
as String,gradeFloat: null == gradeFloat ? _self.gradeFloat : gradeFloat // ignore: cast_nullable_to_non_nullable
as String,newQuality: null == newQuality ? _self.newQuality : newQuality // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,oldHide: null == oldHide ? _self.oldHide : oldHide // ignore: cast_nullable_to_non_nullable
as int,programInner: null == programInner ? _self.programInner : programInner // ignore: cast_nullable_to_non_nullable
as int,specialTag: null == specialTag ? _self.specialTag : specialTag // ignore: cast_nullable_to_non_nullable
as String,recTag: null == recTag ? _self._recTag : recTag // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,transParam: null == transParam ? _self._transParam : transParam // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,outerData: null == outerData ? _self._outerData : outerData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,singers: null == singers ? _self._singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchProgramSinger>,singerIds: null == singerIds ? _self._singerIds : singerIds // ignore: cast_nullable_to_non_nullable
as List<int>,programDefSongs: null == programDefSongs ? _self._programDefSongs : programDefSongs // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SearchProgramSinger {

@IntFromStringConverter()@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;
/// Create a copy of SearchProgramSinger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProgramSingerCopyWith<SearchProgramSinger> get copyWith => _$SearchProgramSingerCopyWithImpl<SearchProgramSinger>(this as SearchProgramSinger, _$identity);

  /// Serializes this SearchProgramSinger to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProgramSinger&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SearchProgramSinger(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SearchProgramSingerCopyWith<$Res>  {
  factory $SearchProgramSingerCopyWith(SearchProgramSinger value, $Res Function(SearchProgramSinger) _then) = _$SearchProgramSingerCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$SearchProgramSingerCopyWithImpl<$Res>
    implements $SearchProgramSingerCopyWith<$Res> {
  _$SearchProgramSingerCopyWithImpl(this._self, this._then);

  final SearchProgramSinger _self;
  final $Res Function(SearchProgramSinger) _then;

/// Create a copy of SearchProgramSinger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchProgramSinger].
extension SearchProgramSingerPatterns on SearchProgramSinger {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchProgramSinger value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchProgramSinger() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchProgramSinger value)  $default,){
final _that = this;
switch (_that) {
case _SearchProgramSinger():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchProgramSinger value)?  $default,){
final _that = this;
switch (_that) {
case _SearchProgramSinger() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchProgramSinger() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name)  $default,) {final _that = this;
switch (_that) {
case _SearchProgramSinger():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name)?  $default,) {final _that = this;
switch (_that) {
case _SearchProgramSinger() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchProgramSinger implements SearchProgramSinger {
  const _SearchProgramSinger({@IntFromStringConverter()@JsonKey(name: 'id') this.id = 0, @JsonKey(name: 'name') this.name = ''});
  factory _SearchProgramSinger.fromJson(Map<String, dynamic> json) => _$SearchProgramSingerFromJson(json);

@override@IntFromStringConverter()@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;

/// Create a copy of SearchProgramSinger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchProgramSingerCopyWith<_SearchProgramSinger> get copyWith => __$SearchProgramSingerCopyWithImpl<_SearchProgramSinger>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchProgramSingerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchProgramSinger&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SearchProgramSinger(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SearchProgramSingerCopyWith<$Res> implements $SearchProgramSingerCopyWith<$Res> {
  factory _$SearchProgramSingerCopyWith(_SearchProgramSinger value, $Res Function(_SearchProgramSinger) _then) = __$SearchProgramSingerCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$SearchProgramSingerCopyWithImpl<$Res>
    implements _$SearchProgramSingerCopyWith<$Res> {
  __$SearchProgramSingerCopyWithImpl(this._self, this._then);

  final _SearchProgramSinger _self;
  final $Res Function(_SearchProgramSinger) _then;

/// Create a copy of SearchProgramSinger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_SearchProgramSinger(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

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
@IntFromStringConverter()@JsonKey(name: 'albumid') int get albumId;/// 专辑名称（可能含 <em> 高亮标记）
@JsonKey(name: 'albumname') String get albumName;/// 歌手名（可能含 <em> 高亮标记）
@JsonKey(name: 'singer') String get singer;/// 封面图（完整URL）
@JsonKey(name: 'img') String get img;/// 歌曲数量
@IntFromStringConverter()@JsonKey(name: 'songcount') int get songCount;/// 发布时间
@JsonKey(name: 'publish_time') String get publishTime;/// 语言
@JsonKey(name: 'language') String get language;/// 发行公司
@JsonKey(name: 'company') String get company;/// 介绍
@JsonKey(name: 'intro') String get intro;/// 短介绍
@JsonKey(name: 'short_intro') String get shortIntro;/// 标题（如 "魔杰座 - 周杰伦"）
@JsonKey(name: 'title') String get title;/// 收藏数
@IntFromStringConverter()@JsonKey(name: 'collect_count') int get collectCount;/// 权限
@IntFromStringConverter()@JsonKey(name: 'privilege') int get privilege;/// 质量
@IntFromStringConverter()@JsonKey(name: 'quality') int get quality;/// 是否付费
@IntFromStringConverter()@JsonKey(name: 'isfirst') int get isFirst;/// 歌手ID列表
@JsonKey(name: 'singerids') List<int> get singerIds;/// 歌手信息列表
@JsonKey(name: 'singers') List<SearchSinger> get singers;
/// Create a copy of SearchAlbumInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchAlbumInfoCopyWith<SearchAlbumInfo> get copyWith => _$SearchAlbumInfoCopyWithImpl<SearchAlbumInfo>(this as SearchAlbumInfo, _$identity);

  /// Serializes this SearchAlbumInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAlbumInfo&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.singer, singer) || other.singer == singer)&&(identical(other.img, img) || other.img == img)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.language, language) || other.language == language)&&(identical(other.company, company) || other.company == company)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.shortIntro, shortIntro) || other.shortIntro == shortIntro)&&(identical(other.title, title) || other.title == title)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.isFirst, isFirst) || other.isFirst == isFirst)&&const DeepCollectionEquality().equals(other.singerIds, singerIds)&&const DeepCollectionEquality().equals(other.singers, singers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,albumId,albumName,singer,img,songCount,publishTime,language,company,intro,shortIntro,title,collectCount,privilege,quality,isFirst,const DeepCollectionEquality().hash(singerIds),const DeepCollectionEquality().hash(singers));

@override
String toString() {
  return 'SearchAlbumInfo(albumId: $albumId, albumName: $albumName, singer: $singer, img: $img, songCount: $songCount, publishTime: $publishTime, language: $language, company: $company, intro: $intro, shortIntro: $shortIntro, title: $title, collectCount: $collectCount, privilege: $privilege, quality: $quality, isFirst: $isFirst, singerIds: $singerIds, singers: $singers)';
}


}

/// @nodoc
abstract mixin class $SearchAlbumInfoCopyWith<$Res>  {
  factory $SearchAlbumInfoCopyWith(SearchAlbumInfo value, $Res Function(SearchAlbumInfo) _then) = _$SearchAlbumInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'albumid') int albumId,@JsonKey(name: 'albumname') String albumName,@JsonKey(name: 'singer') String singer,@JsonKey(name: 'img') String img,@IntFromStringConverter()@JsonKey(name: 'songcount') int songCount,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'language') String language,@JsonKey(name: 'company') String company,@JsonKey(name: 'intro') String intro,@JsonKey(name: 'short_intro') String shortIntro,@JsonKey(name: 'title') String title,@IntFromStringConverter()@JsonKey(name: 'collect_count') int collectCount,@IntFromStringConverter()@JsonKey(name: 'privilege') int privilege,@IntFromStringConverter()@JsonKey(name: 'quality') int quality,@IntFromStringConverter()@JsonKey(name: 'isfirst') int isFirst,@JsonKey(name: 'singerids') List<int> singerIds,@JsonKey(name: 'singers') List<SearchSinger> singers
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
@pragma('vm:prefer-inline') @override $Res call({Object? albumId = null,Object? albumName = null,Object? singer = null,Object? img = null,Object? songCount = null,Object? publishTime = null,Object? language = null,Object? company = null,Object? intro = null,Object? shortIntro = null,Object? title = null,Object? collectCount = null,Object? privilege = null,Object? quality = null,Object? isFirst = null,Object? singerIds = null,Object? singers = null,}) {
  return _then(_self.copyWith(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,singer: null == singer ? _self.singer : singer // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,shortIntro: null == shortIntro ? _self.shortIntro : shortIntro // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as int,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,isFirst: null == isFirst ? _self.isFirst : isFirst // ignore: cast_nullable_to_non_nullable
as int,singerIds: null == singerIds ? _self.singerIds : singerIds // ignore: cast_nullable_to_non_nullable
as List<int>,singers: null == singers ? _self.singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'singer')  String singer, @JsonKey(name: 'img')  String img, @IntFromStringConverter()@JsonKey(name: 'songcount')  int songCount, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'language')  String language, @JsonKey(name: 'company')  String company, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'short_intro')  String shortIntro, @JsonKey(name: 'title')  String title, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'isfirst')  int isFirst, @JsonKey(name: 'singerids')  List<int> singerIds, @JsonKey(name: 'singers')  List<SearchSinger> singers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAlbumInfo() when $default != null:
return $default(_that.albumId,_that.albumName,_that.singer,_that.img,_that.songCount,_that.publishTime,_that.language,_that.company,_that.intro,_that.shortIntro,_that.title,_that.collectCount,_that.privilege,_that.quality,_that.isFirst,_that.singerIds,_that.singers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'singer')  String singer, @JsonKey(name: 'img')  String img, @IntFromStringConverter()@JsonKey(name: 'songcount')  int songCount, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'language')  String language, @JsonKey(name: 'company')  String company, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'short_intro')  String shortIntro, @JsonKey(name: 'title')  String title, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'isfirst')  int isFirst, @JsonKey(name: 'singerids')  List<int> singerIds, @JsonKey(name: 'singers')  List<SearchSinger> singers)  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumInfo():
return $default(_that.albumId,_that.albumName,_that.singer,_that.img,_that.songCount,_that.publishTime,_that.language,_that.company,_that.intro,_that.shortIntro,_that.title,_that.collectCount,_that.privilege,_that.quality,_that.isFirst,_that.singerIds,_that.singers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'albumid')  int albumId, @JsonKey(name: 'albumname')  String albumName, @JsonKey(name: 'singer')  String singer, @JsonKey(name: 'img')  String img, @IntFromStringConverter()@JsonKey(name: 'songcount')  int songCount, @JsonKey(name: 'publish_time')  String publishTime, @JsonKey(name: 'language')  String language, @JsonKey(name: 'company')  String company, @JsonKey(name: 'intro')  String intro, @JsonKey(name: 'short_intro')  String shortIntro, @JsonKey(name: 'title')  String title, @IntFromStringConverter()@JsonKey(name: 'collect_count')  int collectCount, @IntFromStringConverter()@JsonKey(name: 'privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'isfirst')  int isFirst, @JsonKey(name: 'singerids')  List<int> singerIds, @JsonKey(name: 'singers')  List<SearchSinger> singers)?  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumInfo() when $default != null:
return $default(_that.albumId,_that.albumName,_that.singer,_that.img,_that.songCount,_that.publishTime,_that.language,_that.company,_that.intro,_that.shortIntro,_that.title,_that.collectCount,_that.privilege,_that.quality,_that.isFirst,_that.singerIds,_that.singers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchAlbumInfo extends SearchAlbumInfo {
  const _SearchAlbumInfo({@IntFromStringConverter()@JsonKey(name: 'albumid') this.albumId = 0, @JsonKey(name: 'albumname') this.albumName = '', @JsonKey(name: 'singer') this.singer = '', @JsonKey(name: 'img') this.img = '', @IntFromStringConverter()@JsonKey(name: 'songcount') this.songCount = 0, @JsonKey(name: 'publish_time') this.publishTime = '', @JsonKey(name: 'language') this.language = '', @JsonKey(name: 'company') this.company = '', @JsonKey(name: 'intro') this.intro = '', @JsonKey(name: 'short_intro') this.shortIntro = '', @JsonKey(name: 'title') this.title = '', @IntFromStringConverter()@JsonKey(name: 'collect_count') this.collectCount = 0, @IntFromStringConverter()@JsonKey(name: 'privilege') this.privilege = 0, @IntFromStringConverter()@JsonKey(name: 'quality') this.quality = 0, @IntFromStringConverter()@JsonKey(name: 'isfirst') this.isFirst = 0, @JsonKey(name: 'singerids') final  List<int> singerIds = const [], @JsonKey(name: 'singers') final  List<SearchSinger> singers = const []}): _singerIds = singerIds,_singers = singers,super._();
  factory _SearchAlbumInfo.fromJson(Map<String, dynamic> json) => _$SearchAlbumInfoFromJson(json);

/// 专辑ID
@override@IntFromStringConverter()@JsonKey(name: 'albumid') final  int albumId;
/// 专辑名称（可能含 <em> 高亮标记）
@override@JsonKey(name: 'albumname') final  String albumName;
/// 歌手名（可能含 <em> 高亮标记）
@override@JsonKey(name: 'singer') final  String singer;
/// 封面图（完整URL）
@override@JsonKey(name: 'img') final  String img;
/// 歌曲数量
@override@IntFromStringConverter()@JsonKey(name: 'songcount') final  int songCount;
/// 发布时间
@override@JsonKey(name: 'publish_time') final  String publishTime;
/// 语言
@override@JsonKey(name: 'language') final  String language;
/// 发行公司
@override@JsonKey(name: 'company') final  String company;
/// 介绍
@override@JsonKey(name: 'intro') final  String intro;
/// 短介绍
@override@JsonKey(name: 'short_intro') final  String shortIntro;
/// 标题（如 "魔杰座 - 周杰伦"）
@override@JsonKey(name: 'title') final  String title;
/// 收藏数
@override@IntFromStringConverter()@JsonKey(name: 'collect_count') final  int collectCount;
/// 权限
@override@IntFromStringConverter()@JsonKey(name: 'privilege') final  int privilege;
/// 质量
@override@IntFromStringConverter()@JsonKey(name: 'quality') final  int quality;
/// 是否付费
@override@IntFromStringConverter()@JsonKey(name: 'isfirst') final  int isFirst;
/// 歌手ID列表
 final  List<int> _singerIds;
/// 歌手ID列表
@override@JsonKey(name: 'singerids') List<int> get singerIds {
  if (_singerIds is EqualUnmodifiableListView) return _singerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singerIds);
}

/// 歌手信息列表
 final  List<SearchSinger> _singers;
/// 歌手信息列表
@override@JsonKey(name: 'singers') List<SearchSinger> get singers {
  if (_singers is EqualUnmodifiableListView) return _singers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singers);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAlbumInfo&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.singer, singer) || other.singer == singer)&&(identical(other.img, img) || other.img == img)&&(identical(other.songCount, songCount) || other.songCount == songCount)&&(identical(other.publishTime, publishTime) || other.publishTime == publishTime)&&(identical(other.language, language) || other.language == language)&&(identical(other.company, company) || other.company == company)&&(identical(other.intro, intro) || other.intro == intro)&&(identical(other.shortIntro, shortIntro) || other.shortIntro == shortIntro)&&(identical(other.title, title) || other.title == title)&&(identical(other.collectCount, collectCount) || other.collectCount == collectCount)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.isFirst, isFirst) || other.isFirst == isFirst)&&const DeepCollectionEquality().equals(other._singerIds, _singerIds)&&const DeepCollectionEquality().equals(other._singers, _singers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,albumId,albumName,singer,img,songCount,publishTime,language,company,intro,shortIntro,title,collectCount,privilege,quality,isFirst,const DeepCollectionEquality().hash(_singerIds),const DeepCollectionEquality().hash(_singers));

@override
String toString() {
  return 'SearchAlbumInfo(albumId: $albumId, albumName: $albumName, singer: $singer, img: $img, songCount: $songCount, publishTime: $publishTime, language: $language, company: $company, intro: $intro, shortIntro: $shortIntro, title: $title, collectCount: $collectCount, privilege: $privilege, quality: $quality, isFirst: $isFirst, singerIds: $singerIds, singers: $singers)';
}


}

/// @nodoc
abstract mixin class _$SearchAlbumInfoCopyWith<$Res> implements $SearchAlbumInfoCopyWith<$Res> {
  factory _$SearchAlbumInfoCopyWith(_SearchAlbumInfo value, $Res Function(_SearchAlbumInfo) _then) = __$SearchAlbumInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'albumid') int albumId,@JsonKey(name: 'albumname') String albumName,@JsonKey(name: 'singer') String singer,@JsonKey(name: 'img') String img,@IntFromStringConverter()@JsonKey(name: 'songcount') int songCount,@JsonKey(name: 'publish_time') String publishTime,@JsonKey(name: 'language') String language,@JsonKey(name: 'company') String company,@JsonKey(name: 'intro') String intro,@JsonKey(name: 'short_intro') String shortIntro,@JsonKey(name: 'title') String title,@IntFromStringConverter()@JsonKey(name: 'collect_count') int collectCount,@IntFromStringConverter()@JsonKey(name: 'privilege') int privilege,@IntFromStringConverter()@JsonKey(name: 'quality') int quality,@IntFromStringConverter()@JsonKey(name: 'isfirst') int isFirst,@JsonKey(name: 'singerids') List<int> singerIds,@JsonKey(name: 'singers') List<SearchSinger> singers
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
@override @pragma('vm:prefer-inline') $Res call({Object? albumId = null,Object? albumName = null,Object? singer = null,Object? img = null,Object? songCount = null,Object? publishTime = null,Object? language = null,Object? company = null,Object? intro = null,Object? shortIntro = null,Object? title = null,Object? collectCount = null,Object? privilege = null,Object? quality = null,Object? isFirst = null,Object? singerIds = null,Object? singers = null,}) {
  return _then(_SearchAlbumInfo(
albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,singer: null == singer ? _self.singer : singer // ignore: cast_nullable_to_non_nullable
as String,img: null == img ? _self.img : img // ignore: cast_nullable_to_non_nullable
as String,songCount: null == songCount ? _self.songCount : songCount // ignore: cast_nullable_to_non_nullable
as int,publishTime: null == publishTime ? _self.publishTime : publishTime // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,intro: null == intro ? _self.intro : intro // ignore: cast_nullable_to_non_nullable
as String,shortIntro: null == shortIntro ? _self.shortIntro : shortIntro // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,collectCount: null == collectCount ? _self.collectCount : collectCount // ignore: cast_nullable_to_non_nullable
as int,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,isFirst: null == isFirst ? _self.isFirst : isFirst // ignore: cast_nullable_to_non_nullable
as int,singerIds: null == singerIds ? _self._singerIds : singerIds // ignore: cast_nullable_to_non_nullable
as List<int>,singers: null == singers ? _self._singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,
  ));
}


}

// dart format on

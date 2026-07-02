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

/// 作者ID
@IntFromStringConverter()@JsonKey(name: 'AuthorId') int get authorId;/// 作者名
@JsonKey(name: 'AuthorName') String get authorName;/// 作者头像
@JsonKey(name: 'Avatar') String get avatar;/// 粉丝数量
@IntFromStringConverter()@JsonKey(name: 'FansNum') int get fansNum;/// 音频数量
@IntFromStringConverter()@JsonKey(name: 'AudioCount') int get audioCount;/// 视频数量
@IntFromStringConverter()@JsonKey(name: 'VideoCount') int get videoCount;/// 专辑数量
@IntFromStringConverter()@JsonKey(name: 'AlbumCount') int get albumCount;/// 热度
@IntFromStringConverter()@JsonKey(name: 'Heat') int get heat;/// 作者状态
@IntFromStringConverter()@JsonKey(name: 'AuthorStatus') int get authorStatus;/// 是否入驻作者
@IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor') int get isSettledAuthor;/// 用户ID
@IntFromStringConverter()@JsonKey(name: 'UserId') int get userId;/// 复杂歌曲名
@JsonKey(name: 'ComplexSongName') String get complexSongName;/// 算法路径
@JsonKey(name: 'AlgPath') String get algPath;/// 辅助信息
@JsonKey(name: 'Auxiliary') String get auxiliary;
/// Create a copy of SearchAuthorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchAuthorInfoCopyWith<SearchAuthorInfo> get copyWith => _$SearchAuthorInfoCopyWithImpl<SearchAuthorInfo>(this as SearchAuthorInfo, _$identity);

  /// Serializes this SearchAuthorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAuthorInfo&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.fansNum, fansNum) || other.fansNum == fansNum)&&(identical(other.audioCount, audioCount) || other.audioCount == audioCount)&&(identical(other.videoCount, videoCount) || other.videoCount == videoCount)&&(identical(other.albumCount, albumCount) || other.albumCount == albumCount)&&(identical(other.heat, heat) || other.heat == heat)&&(identical(other.authorStatus, authorStatus) || other.authorStatus == authorStatus)&&(identical(other.isSettledAuthor, isSettledAuthor) || other.isSettledAuthor == isSettledAuthor)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.complexSongName, complexSongName) || other.complexSongName == complexSongName)&&(identical(other.algPath, algPath) || other.algPath == algPath)&&(identical(other.auxiliary, auxiliary) || other.auxiliary == auxiliary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorId,authorName,avatar,fansNum,audioCount,videoCount,albumCount,heat,authorStatus,isSettledAuthor,userId,complexSongName,algPath,auxiliary);

@override
String toString() {
  return 'SearchAuthorInfo(authorId: $authorId, authorName: $authorName, avatar: $avatar, fansNum: $fansNum, audioCount: $audioCount, videoCount: $videoCount, albumCount: $albumCount, heat: $heat, authorStatus: $authorStatus, isSettledAuthor: $isSettledAuthor, userId: $userId, complexSongName: $complexSongName, algPath: $algPath, auxiliary: $auxiliary)';
}


}

/// @nodoc
abstract mixin class $SearchAuthorInfoCopyWith<$Res>  {
  factory $SearchAuthorInfoCopyWith(SearchAuthorInfo value, $Res Function(SearchAuthorInfo) _then) = _$SearchAuthorInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'AuthorId') int authorId,@JsonKey(name: 'AuthorName') String authorName,@JsonKey(name: 'Avatar') String avatar,@IntFromStringConverter()@JsonKey(name: 'FansNum') int fansNum,@IntFromStringConverter()@JsonKey(name: 'AudioCount') int audioCount,@IntFromStringConverter()@JsonKey(name: 'VideoCount') int videoCount,@IntFromStringConverter()@JsonKey(name: 'AlbumCount') int albumCount,@IntFromStringConverter()@JsonKey(name: 'Heat') int heat,@IntFromStringConverter()@JsonKey(name: 'AuthorStatus') int authorStatus,@IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor') int isSettledAuthor,@IntFromStringConverter()@JsonKey(name: 'UserId') int userId,@JsonKey(name: 'ComplexSongName') String complexSongName,@JsonKey(name: 'AlgPath') String algPath,@JsonKey(name: 'Auxiliary') String auxiliary
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
@pragma('vm:prefer-inline') @override $Res call({Object? authorId = null,Object? authorName = null,Object? avatar = null,Object? fansNum = null,Object? audioCount = null,Object? videoCount = null,Object? albumCount = null,Object? heat = null,Object? authorStatus = null,Object? isSettledAuthor = null,Object? userId = null,Object? complexSongName = null,Object? algPath = null,Object? auxiliary = null,}) {
  return _then(_self.copyWith(
authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,fansNum: null == fansNum ? _self.fansNum : fansNum // ignore: cast_nullable_to_non_nullable
as int,audioCount: null == audioCount ? _self.audioCount : audioCount // ignore: cast_nullable_to_non_nullable
as int,videoCount: null == videoCount ? _self.videoCount : videoCount // ignore: cast_nullable_to_non_nullable
as int,albumCount: null == albumCount ? _self.albumCount : albumCount // ignore: cast_nullable_to_non_nullable
as int,heat: null == heat ? _self.heat : heat // ignore: cast_nullable_to_non_nullable
as int,authorStatus: null == authorStatus ? _self.authorStatus : authorStatus // ignore: cast_nullable_to_non_nullable
as int,isSettledAuthor: null == isSettledAuthor ? _self.isSettledAuthor : isSettledAuthor // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,complexSongName: null == complexSongName ? _self.complexSongName : complexSongName // ignore: cast_nullable_to_non_nullable
as String,algPath: null == algPath ? _self.algPath : algPath // ignore: cast_nullable_to_non_nullable
as String,auxiliary: null == auxiliary ? _self.auxiliary : auxiliary // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'AuthorId')  int authorId, @JsonKey(name: 'AuthorName')  String authorName, @JsonKey(name: 'Avatar')  String avatar, @IntFromStringConverter()@JsonKey(name: 'FansNum')  int fansNum, @IntFromStringConverter()@JsonKey(name: 'AudioCount')  int audioCount, @IntFromStringConverter()@JsonKey(name: 'VideoCount')  int videoCount, @IntFromStringConverter()@JsonKey(name: 'AlbumCount')  int albumCount, @IntFromStringConverter()@JsonKey(name: 'Heat')  int heat, @IntFromStringConverter()@JsonKey(name: 'AuthorStatus')  int authorStatus, @IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor')  int isSettledAuthor, @IntFromStringConverter()@JsonKey(name: 'UserId')  int userId, @JsonKey(name: 'ComplexSongName')  String complexSongName, @JsonKey(name: 'AlgPath')  String algPath, @JsonKey(name: 'Auxiliary')  String auxiliary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAuthorInfo() when $default != null:
return $default(_that.authorId,_that.authorName,_that.avatar,_that.fansNum,_that.audioCount,_that.videoCount,_that.albumCount,_that.heat,_that.authorStatus,_that.isSettledAuthor,_that.userId,_that.complexSongName,_that.algPath,_that.auxiliary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'AuthorId')  int authorId, @JsonKey(name: 'AuthorName')  String authorName, @JsonKey(name: 'Avatar')  String avatar, @IntFromStringConverter()@JsonKey(name: 'FansNum')  int fansNum, @IntFromStringConverter()@JsonKey(name: 'AudioCount')  int audioCount, @IntFromStringConverter()@JsonKey(name: 'VideoCount')  int videoCount, @IntFromStringConverter()@JsonKey(name: 'AlbumCount')  int albumCount, @IntFromStringConverter()@JsonKey(name: 'Heat')  int heat, @IntFromStringConverter()@JsonKey(name: 'AuthorStatus')  int authorStatus, @IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor')  int isSettledAuthor, @IntFromStringConverter()@JsonKey(name: 'UserId')  int userId, @JsonKey(name: 'ComplexSongName')  String complexSongName, @JsonKey(name: 'AlgPath')  String algPath, @JsonKey(name: 'Auxiliary')  String auxiliary)  $default,) {final _that = this;
switch (_that) {
case _SearchAuthorInfo():
return $default(_that.authorId,_that.authorName,_that.avatar,_that.fansNum,_that.audioCount,_that.videoCount,_that.albumCount,_that.heat,_that.authorStatus,_that.isSettledAuthor,_that.userId,_that.complexSongName,_that.algPath,_that.auxiliary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'AuthorId')  int authorId, @JsonKey(name: 'AuthorName')  String authorName, @JsonKey(name: 'Avatar')  String avatar, @IntFromStringConverter()@JsonKey(name: 'FansNum')  int fansNum, @IntFromStringConverter()@JsonKey(name: 'AudioCount')  int audioCount, @IntFromStringConverter()@JsonKey(name: 'VideoCount')  int videoCount, @IntFromStringConverter()@JsonKey(name: 'AlbumCount')  int albumCount, @IntFromStringConverter()@JsonKey(name: 'Heat')  int heat, @IntFromStringConverter()@JsonKey(name: 'AuthorStatus')  int authorStatus, @IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor')  int isSettledAuthor, @IntFromStringConverter()@JsonKey(name: 'UserId')  int userId, @JsonKey(name: 'ComplexSongName')  String complexSongName, @JsonKey(name: 'AlgPath')  String algPath, @JsonKey(name: 'Auxiliary')  String auxiliary)?  $default,) {final _that = this;
switch (_that) {
case _SearchAuthorInfo() when $default != null:
return $default(_that.authorId,_that.authorName,_that.avatar,_that.fansNum,_that.audioCount,_that.videoCount,_that.albumCount,_that.heat,_that.authorStatus,_that.isSettledAuthor,_that.userId,_that.complexSongName,_that.algPath,_that.auxiliary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchAuthorInfo implements SearchAuthorInfo {
  const _SearchAuthorInfo({@IntFromStringConverter()@JsonKey(name: 'AuthorId') this.authorId = 0, @JsonKey(name: 'AuthorName') this.authorName = '', @JsonKey(name: 'Avatar') this.avatar = '', @IntFromStringConverter()@JsonKey(name: 'FansNum') this.fansNum = 0, @IntFromStringConverter()@JsonKey(name: 'AudioCount') this.audioCount = 0, @IntFromStringConverter()@JsonKey(name: 'VideoCount') this.videoCount = 0, @IntFromStringConverter()@JsonKey(name: 'AlbumCount') this.albumCount = 0, @IntFromStringConverter()@JsonKey(name: 'Heat') this.heat = 0, @IntFromStringConverter()@JsonKey(name: 'AuthorStatus') this.authorStatus = 0, @IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor') this.isSettledAuthor = 0, @IntFromStringConverter()@JsonKey(name: 'UserId') this.userId = 0, @JsonKey(name: 'ComplexSongName') this.complexSongName = '', @JsonKey(name: 'AlgPath') this.algPath = '', @JsonKey(name: 'Auxiliary') this.auxiliary = ''});
  factory _SearchAuthorInfo.fromJson(Map<String, dynamic> json) => _$SearchAuthorInfoFromJson(json);

/// 作者ID
@override@IntFromStringConverter()@JsonKey(name: 'AuthorId') final  int authorId;
/// 作者名
@override@JsonKey(name: 'AuthorName') final  String authorName;
/// 作者头像
@override@JsonKey(name: 'Avatar') final  String avatar;
/// 粉丝数量
@override@IntFromStringConverter()@JsonKey(name: 'FansNum') final  int fansNum;
/// 音频数量
@override@IntFromStringConverter()@JsonKey(name: 'AudioCount') final  int audioCount;
/// 视频数量
@override@IntFromStringConverter()@JsonKey(name: 'VideoCount') final  int videoCount;
/// 专辑数量
@override@IntFromStringConverter()@JsonKey(name: 'AlbumCount') final  int albumCount;
/// 热度
@override@IntFromStringConverter()@JsonKey(name: 'Heat') final  int heat;
/// 作者状态
@override@IntFromStringConverter()@JsonKey(name: 'AuthorStatus') final  int authorStatus;
/// 是否入驻作者
@override@IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor') final  int isSettledAuthor;
/// 用户ID
@override@IntFromStringConverter()@JsonKey(name: 'UserId') final  int userId;
/// 复杂歌曲名
@override@JsonKey(name: 'ComplexSongName') final  String complexSongName;
/// 算法路径
@override@JsonKey(name: 'AlgPath') final  String algPath;
/// 辅助信息
@override@JsonKey(name: 'Auxiliary') final  String auxiliary;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAuthorInfo&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.fansNum, fansNum) || other.fansNum == fansNum)&&(identical(other.audioCount, audioCount) || other.audioCount == audioCount)&&(identical(other.videoCount, videoCount) || other.videoCount == videoCount)&&(identical(other.albumCount, albumCount) || other.albumCount == albumCount)&&(identical(other.heat, heat) || other.heat == heat)&&(identical(other.authorStatus, authorStatus) || other.authorStatus == authorStatus)&&(identical(other.isSettledAuthor, isSettledAuthor) || other.isSettledAuthor == isSettledAuthor)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.complexSongName, complexSongName) || other.complexSongName == complexSongName)&&(identical(other.algPath, algPath) || other.algPath == algPath)&&(identical(other.auxiliary, auxiliary) || other.auxiliary == auxiliary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authorId,authorName,avatar,fansNum,audioCount,videoCount,albumCount,heat,authorStatus,isSettledAuthor,userId,complexSongName,algPath,auxiliary);

@override
String toString() {
  return 'SearchAuthorInfo(authorId: $authorId, authorName: $authorName, avatar: $avatar, fansNum: $fansNum, audioCount: $audioCount, videoCount: $videoCount, albumCount: $albumCount, heat: $heat, authorStatus: $authorStatus, isSettledAuthor: $isSettledAuthor, userId: $userId, complexSongName: $complexSongName, algPath: $algPath, auxiliary: $auxiliary)';
}


}

/// @nodoc
abstract mixin class _$SearchAuthorInfoCopyWith<$Res> implements $SearchAuthorInfoCopyWith<$Res> {
  factory _$SearchAuthorInfoCopyWith(_SearchAuthorInfo value, $Res Function(_SearchAuthorInfo) _then) = __$SearchAuthorInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'AuthorId') int authorId,@JsonKey(name: 'AuthorName') String authorName,@JsonKey(name: 'Avatar') String avatar,@IntFromStringConverter()@JsonKey(name: 'FansNum') int fansNum,@IntFromStringConverter()@JsonKey(name: 'AudioCount') int audioCount,@IntFromStringConverter()@JsonKey(name: 'VideoCount') int videoCount,@IntFromStringConverter()@JsonKey(name: 'AlbumCount') int albumCount,@IntFromStringConverter()@JsonKey(name: 'Heat') int heat,@IntFromStringConverter()@JsonKey(name: 'AuthorStatus') int authorStatus,@IntFromStringConverter()@JsonKey(name: 'IsSettledAuthor') int isSettledAuthor,@IntFromStringConverter()@JsonKey(name: 'UserId') int userId,@JsonKey(name: 'ComplexSongName') String complexSongName,@JsonKey(name: 'AlgPath') String algPath,@JsonKey(name: 'Auxiliary') String auxiliary
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
@override @pragma('vm:prefer-inline') $Res call({Object? authorId = null,Object? authorName = null,Object? avatar = null,Object? fansNum = null,Object? audioCount = null,Object? videoCount = null,Object? albumCount = null,Object? heat = null,Object? authorStatus = null,Object? isSettledAuthor = null,Object? userId = null,Object? complexSongName = null,Object? algPath = null,Object? auxiliary = null,}) {
  return _then(_SearchAuthorInfo(
authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as int,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,fansNum: null == fansNum ? _self.fansNum : fansNum // ignore: cast_nullable_to_non_nullable
as int,audioCount: null == audioCount ? _self.audioCount : audioCount // ignore: cast_nullable_to_non_nullable
as int,videoCount: null == videoCount ? _self.videoCount : videoCount // ignore: cast_nullable_to_non_nullable
as int,albumCount: null == albumCount ? _self.albumCount : albumCount // ignore: cast_nullable_to_non_nullable
as int,heat: null == heat ? _self.heat : heat // ignore: cast_nullable_to_non_nullable
as int,authorStatus: null == authorStatus ? _self.authorStatus : authorStatus // ignore: cast_nullable_to_non_nullable
as int,isSettledAuthor: null == isSettledAuthor ? _self.isSettledAuthor : isSettledAuthor // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,complexSongName: null == complexSongName ? _self.complexSongName : complexSongName // ignore: cast_nullable_to_non_nullable
as String,algPath: null == algPath ? _self.algPath : algPath // ignore: cast_nullable_to_non_nullable
as String,auxiliary: null == auxiliary ? _self.auxiliary : auxiliary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

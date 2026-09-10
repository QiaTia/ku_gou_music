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
@IntFromStringConverter()@JsonKey(name: 'MvID') int get mvId;/// MV名称
@JsonKey(name: 'MvName') String get mvName;/// 文件名（如 "<em>周杰伦</em> - 晴天"）
@JsonKey(name: 'FileName') String get fileName;/// 歌手名（可能含 <em> 高亮标记）
@JsonKey(name: 'SingerName') String get singerName;/// MV Hash
@JsonKey(name: 'MvHash') String get mvHash;/// 关联音频ID
@JsonKey(name: 'AudioID') String get audioId;/// 加密MV ID
@JsonKey(name: 'EMvID') String get eMvId;/// 封面图文件名（拼接 mvpic 前缀使用）
@JsonKey(name: 'Pic') String get pic;/// 竖版封面图文件名
@JsonKey(name: 'ErectPic') String get erectPic;/// 动态封面GIF（完整URL）
@JsonKey(name: 'ThumbGif') String get thumbGif;/// 动态封面MP4（完整URL）
@JsonKey(name: 'ThumbMp4') String get thumbMp4;/// MV时长(秒)
@IntFromStringConverter()@JsonKey(name: 'Duration') int get duration;/// 发布日期
@JsonKey(name: 'PublishDate') String get publishDate;/// MV热度
@IntFromStringConverter()@JsonKey(name: 'MvHot') int get mvHot;/// 历史热度
@IntFromStringConverter()@JsonKey(name: 'HistoryHeat') int get historyHeat;/// 是否官方MV
@IntFromStringConverter()@JsonKey(name: 'IsOfficial') int get isOfficial;/// 是否UGC
@IntFromStringConverter()@JsonKey(name: 'IsUgc') int get isUgc;/// 是否短视频
@IntFromStringConverter()@JsonKey(name: 'Isshort') int get isShort;/// 画质标识（如 1080P）
@JsonKey(name: 'MvHashMark') String get mvHashMark;/// 权限
@IntFromStringConverter()@JsonKey(name: 'Privilege') int get privilege;/// 关联歌曲hash
@JsonKey(name: 'FileHash') String get fileHash;/// 关联MixSongID
@JsonKey(name: 'MixSongID') String get mixSongId;/// 关联专辑ID
@JsonKey(name: 'AlbumID') String get albumId;/// 歌手ID列表
@JsonKey(name: 'SingerID') List<int> get singerId;/// 歌手信息列表
@JsonKey(name: 'Singers') List<SearchSinger> get singers;
/// Create a copy of SearchMvInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMvInfoCopyWith<SearchMvInfo> get copyWith => _$SearchMvInfoCopyWithImpl<SearchMvInfo>(this as SearchMvInfo, _$identity);

  /// Serializes this SearchMvInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMvInfo&&(identical(other.mvId, mvId) || other.mvId == mvId)&&(identical(other.mvName, mvName) || other.mvName == mvName)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.mvHash, mvHash) || other.mvHash == mvHash)&&(identical(other.audioId, audioId) || other.audioId == audioId)&&(identical(other.eMvId, eMvId) || other.eMvId == eMvId)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.erectPic, erectPic) || other.erectPic == erectPic)&&(identical(other.thumbGif, thumbGif) || other.thumbGif == thumbGif)&&(identical(other.thumbMp4, thumbMp4) || other.thumbMp4 == thumbMp4)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.mvHot, mvHot) || other.mvHot == mvHot)&&(identical(other.historyHeat, historyHeat) || other.historyHeat == historyHeat)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isUgc, isUgc) || other.isUgc == isUgc)&&(identical(other.isShort, isShort) || other.isShort == isShort)&&(identical(other.mvHashMark, mvHashMark) || other.mvHashMark == mvHashMark)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.mixSongId, mixSongId) || other.mixSongId == mixSongId)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&const DeepCollectionEquality().equals(other.singerId, singerId)&&const DeepCollectionEquality().equals(other.singers, singers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,mvId,mvName,fileName,singerName,mvHash,audioId,eMvId,pic,erectPic,thumbGif,thumbMp4,duration,publishDate,mvHot,historyHeat,isOfficial,isUgc,isShort,mvHashMark,privilege,fileHash,mixSongId,albumId,const DeepCollectionEquality().hash(singerId),const DeepCollectionEquality().hash(singers)]);

@override
String toString() {
  return 'SearchMvInfo(mvId: $mvId, mvName: $mvName, fileName: $fileName, singerName: $singerName, mvHash: $mvHash, audioId: $audioId, eMvId: $eMvId, pic: $pic, erectPic: $erectPic, thumbGif: $thumbGif, thumbMp4: $thumbMp4, duration: $duration, publishDate: $publishDate, mvHot: $mvHot, historyHeat: $historyHeat, isOfficial: $isOfficial, isUgc: $isUgc, isShort: $isShort, mvHashMark: $mvHashMark, privilege: $privilege, fileHash: $fileHash, mixSongId: $mixSongId, albumId: $albumId, singerId: $singerId, singers: $singers)';
}


}

/// @nodoc
abstract mixin class $SearchMvInfoCopyWith<$Res>  {
  factory $SearchMvInfoCopyWith(SearchMvInfo value, $Res Function(SearchMvInfo) _then) = _$SearchMvInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'MvID') int mvId,@JsonKey(name: 'MvName') String mvName,@JsonKey(name: 'FileName') String fileName,@JsonKey(name: 'SingerName') String singerName,@JsonKey(name: 'MvHash') String mvHash,@JsonKey(name: 'AudioID') String audioId,@JsonKey(name: 'EMvID') String eMvId,@JsonKey(name: 'Pic') String pic,@JsonKey(name: 'ErectPic') String erectPic,@JsonKey(name: 'ThumbGif') String thumbGif,@JsonKey(name: 'ThumbMp4') String thumbMp4,@IntFromStringConverter()@JsonKey(name: 'Duration') int duration,@JsonKey(name: 'PublishDate') String publishDate,@IntFromStringConverter()@JsonKey(name: 'MvHot') int mvHot,@IntFromStringConverter()@JsonKey(name: 'HistoryHeat') int historyHeat,@IntFromStringConverter()@JsonKey(name: 'IsOfficial') int isOfficial,@IntFromStringConverter()@JsonKey(name: 'IsUgc') int isUgc,@IntFromStringConverter()@JsonKey(name: 'Isshort') int isShort,@JsonKey(name: 'MvHashMark') String mvHashMark,@IntFromStringConverter()@JsonKey(name: 'Privilege') int privilege,@JsonKey(name: 'FileHash') String fileHash,@JsonKey(name: 'MixSongID') String mixSongId,@JsonKey(name: 'AlbumID') String albumId,@JsonKey(name: 'SingerID') List<int> singerId,@JsonKey(name: 'Singers') List<SearchSinger> singers
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
@pragma('vm:prefer-inline') @override $Res call({Object? mvId = null,Object? mvName = null,Object? fileName = null,Object? singerName = null,Object? mvHash = null,Object? audioId = null,Object? eMvId = null,Object? pic = null,Object? erectPic = null,Object? thumbGif = null,Object? thumbMp4 = null,Object? duration = null,Object? publishDate = null,Object? mvHot = null,Object? historyHeat = null,Object? isOfficial = null,Object? isUgc = null,Object? isShort = null,Object? mvHashMark = null,Object? privilege = null,Object? fileHash = null,Object? mixSongId = null,Object? albumId = null,Object? singerId = null,Object? singers = null,}) {
  return _then(_self.copyWith(
mvId: null == mvId ? _self.mvId : mvId // ignore: cast_nullable_to_non_nullable
as int,mvName: null == mvName ? _self.mvName : mvName // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,mvHash: null == mvHash ? _self.mvHash : mvHash // ignore: cast_nullable_to_non_nullable
as String,audioId: null == audioId ? _self.audioId : audioId // ignore: cast_nullable_to_non_nullable
as String,eMvId: null == eMvId ? _self.eMvId : eMvId // ignore: cast_nullable_to_non_nullable
as String,pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,erectPic: null == erectPic ? _self.erectPic : erectPic // ignore: cast_nullable_to_non_nullable
as String,thumbGif: null == thumbGif ? _self.thumbGif : thumbGif // ignore: cast_nullable_to_non_nullable
as String,thumbMp4: null == thumbMp4 ? _self.thumbMp4 : thumbMp4 // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,mvHot: null == mvHot ? _self.mvHot : mvHot // ignore: cast_nullable_to_non_nullable
as int,historyHeat: null == historyHeat ? _self.historyHeat : historyHeat // ignore: cast_nullable_to_non_nullable
as int,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as int,isUgc: null == isUgc ? _self.isUgc : isUgc // ignore: cast_nullable_to_non_nullable
as int,isShort: null == isShort ? _self.isShort : isShort // ignore: cast_nullable_to_non_nullable
as int,mvHashMark: null == mvHashMark ? _self.mvHashMark : mvHashMark // ignore: cast_nullable_to_non_nullable
as String,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,mixSongId: null == mixSongId ? _self.mixSongId : mixSongId // ignore: cast_nullable_to_non_nullable
as String,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String,singerId: null == singerId ? _self.singerId : singerId // ignore: cast_nullable_to_non_nullable
as List<int>,singers: null == singers ? _self.singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'MvID')  int mvId, @JsonKey(name: 'MvName')  String mvName, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'MvHash')  String mvHash, @JsonKey(name: 'AudioID')  String audioId, @JsonKey(name: 'EMvID')  String eMvId, @JsonKey(name: 'Pic')  String pic, @JsonKey(name: 'ErectPic')  String erectPic, @JsonKey(name: 'ThumbGif')  String thumbGif, @JsonKey(name: 'ThumbMp4')  String thumbMp4, @IntFromStringConverter()@JsonKey(name: 'Duration')  int duration, @JsonKey(name: 'PublishDate')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'MvHot')  int mvHot, @IntFromStringConverter()@JsonKey(name: 'HistoryHeat')  int historyHeat, @IntFromStringConverter()@JsonKey(name: 'IsOfficial')  int isOfficial, @IntFromStringConverter()@JsonKey(name: 'IsUgc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'Isshort')  int isShort, @JsonKey(name: 'MvHashMark')  String mvHashMark, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @JsonKey(name: 'FileHash')  String fileHash, @JsonKey(name: 'MixSongID')  String mixSongId, @JsonKey(name: 'AlbumID')  String albumId, @JsonKey(name: 'SingerID')  List<int> singerId, @JsonKey(name: 'Singers')  List<SearchSinger> singers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchMvInfo() when $default != null:
return $default(_that.mvId,_that.mvName,_that.fileName,_that.singerName,_that.mvHash,_that.audioId,_that.eMvId,_that.pic,_that.erectPic,_that.thumbGif,_that.thumbMp4,_that.duration,_that.publishDate,_that.mvHot,_that.historyHeat,_that.isOfficial,_that.isUgc,_that.isShort,_that.mvHashMark,_that.privilege,_that.fileHash,_that.mixSongId,_that.albumId,_that.singerId,_that.singers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'MvID')  int mvId, @JsonKey(name: 'MvName')  String mvName, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'MvHash')  String mvHash, @JsonKey(name: 'AudioID')  String audioId, @JsonKey(name: 'EMvID')  String eMvId, @JsonKey(name: 'Pic')  String pic, @JsonKey(name: 'ErectPic')  String erectPic, @JsonKey(name: 'ThumbGif')  String thumbGif, @JsonKey(name: 'ThumbMp4')  String thumbMp4, @IntFromStringConverter()@JsonKey(name: 'Duration')  int duration, @JsonKey(name: 'PublishDate')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'MvHot')  int mvHot, @IntFromStringConverter()@JsonKey(name: 'HistoryHeat')  int historyHeat, @IntFromStringConverter()@JsonKey(name: 'IsOfficial')  int isOfficial, @IntFromStringConverter()@JsonKey(name: 'IsUgc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'Isshort')  int isShort, @JsonKey(name: 'MvHashMark')  String mvHashMark, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @JsonKey(name: 'FileHash')  String fileHash, @JsonKey(name: 'MixSongID')  String mixSongId, @JsonKey(name: 'AlbumID')  String albumId, @JsonKey(name: 'SingerID')  List<int> singerId, @JsonKey(name: 'Singers')  List<SearchSinger> singers)  $default,) {final _that = this;
switch (_that) {
case _SearchMvInfo():
return $default(_that.mvId,_that.mvName,_that.fileName,_that.singerName,_that.mvHash,_that.audioId,_that.eMvId,_that.pic,_that.erectPic,_that.thumbGif,_that.thumbMp4,_that.duration,_that.publishDate,_that.mvHot,_that.historyHeat,_that.isOfficial,_that.isUgc,_that.isShort,_that.mvHashMark,_that.privilege,_that.fileHash,_that.mixSongId,_that.albumId,_that.singerId,_that.singers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'MvID')  int mvId, @JsonKey(name: 'MvName')  String mvName, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'MvHash')  String mvHash, @JsonKey(name: 'AudioID')  String audioId, @JsonKey(name: 'EMvID')  String eMvId, @JsonKey(name: 'Pic')  String pic, @JsonKey(name: 'ErectPic')  String erectPic, @JsonKey(name: 'ThumbGif')  String thumbGif, @JsonKey(name: 'ThumbMp4')  String thumbMp4, @IntFromStringConverter()@JsonKey(name: 'Duration')  int duration, @JsonKey(name: 'PublishDate')  String publishDate, @IntFromStringConverter()@JsonKey(name: 'MvHot')  int mvHot, @IntFromStringConverter()@JsonKey(name: 'HistoryHeat')  int historyHeat, @IntFromStringConverter()@JsonKey(name: 'IsOfficial')  int isOfficial, @IntFromStringConverter()@JsonKey(name: 'IsUgc')  int isUgc, @IntFromStringConverter()@JsonKey(name: 'Isshort')  int isShort, @JsonKey(name: 'MvHashMark')  String mvHashMark, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @JsonKey(name: 'FileHash')  String fileHash, @JsonKey(name: 'MixSongID')  String mixSongId, @JsonKey(name: 'AlbumID')  String albumId, @JsonKey(name: 'SingerID')  List<int> singerId, @JsonKey(name: 'Singers')  List<SearchSinger> singers)?  $default,) {final _that = this;
switch (_that) {
case _SearchMvInfo() when $default != null:
return $default(_that.mvId,_that.mvName,_that.fileName,_that.singerName,_that.mvHash,_that.audioId,_that.eMvId,_that.pic,_that.erectPic,_that.thumbGif,_that.thumbMp4,_that.duration,_that.publishDate,_that.mvHot,_that.historyHeat,_that.isOfficial,_that.isUgc,_that.isShort,_that.mvHashMark,_that.privilege,_that.fileHash,_that.mixSongId,_that.albumId,_that.singerId,_that.singers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchMvInfo extends SearchMvInfo {
  const _SearchMvInfo({@IntFromStringConverter()@JsonKey(name: 'MvID') this.mvId = 0, @JsonKey(name: 'MvName') this.mvName = '', @JsonKey(name: 'FileName') this.fileName = '', @JsonKey(name: 'SingerName') this.singerName = '', @JsonKey(name: 'MvHash') this.mvHash = '', @JsonKey(name: 'AudioID') this.audioId = '', @JsonKey(name: 'EMvID') this.eMvId = '', @JsonKey(name: 'Pic') this.pic = '', @JsonKey(name: 'ErectPic') this.erectPic = '', @JsonKey(name: 'ThumbGif') this.thumbGif = '', @JsonKey(name: 'ThumbMp4') this.thumbMp4 = '', @IntFromStringConverter()@JsonKey(name: 'Duration') this.duration = 0, @JsonKey(name: 'PublishDate') this.publishDate = '', @IntFromStringConverter()@JsonKey(name: 'MvHot') this.mvHot = 0, @IntFromStringConverter()@JsonKey(name: 'HistoryHeat') this.historyHeat = 0, @IntFromStringConverter()@JsonKey(name: 'IsOfficial') this.isOfficial = 0, @IntFromStringConverter()@JsonKey(name: 'IsUgc') this.isUgc = 0, @IntFromStringConverter()@JsonKey(name: 'Isshort') this.isShort = 0, @JsonKey(name: 'MvHashMark') this.mvHashMark = '', @IntFromStringConverter()@JsonKey(name: 'Privilege') this.privilege = 0, @JsonKey(name: 'FileHash') this.fileHash = '', @JsonKey(name: 'MixSongID') this.mixSongId = '', @JsonKey(name: 'AlbumID') this.albumId = '', @JsonKey(name: 'SingerID') final  List<int> singerId = const [], @JsonKey(name: 'Singers') final  List<SearchSinger> singers = const []}): _singerId = singerId,_singers = singers,super._();
  factory _SearchMvInfo.fromJson(Map<String, dynamic> json) => _$SearchMvInfoFromJson(json);

/// MV ID
@override@IntFromStringConverter()@JsonKey(name: 'MvID') final  int mvId;
/// MV名称
@override@JsonKey(name: 'MvName') final  String mvName;
/// 文件名（如 "<em>周杰伦</em> - 晴天"）
@override@JsonKey(name: 'FileName') final  String fileName;
/// 歌手名（可能含 <em> 高亮标记）
@override@JsonKey(name: 'SingerName') final  String singerName;
/// MV Hash
@override@JsonKey(name: 'MvHash') final  String mvHash;
/// 关联音频ID
@override@JsonKey(name: 'AudioID') final  String audioId;
/// 加密MV ID
@override@JsonKey(name: 'EMvID') final  String eMvId;
/// 封面图文件名（拼接 mvpic 前缀使用）
@override@JsonKey(name: 'Pic') final  String pic;
/// 竖版封面图文件名
@override@JsonKey(name: 'ErectPic') final  String erectPic;
/// 动态封面GIF（完整URL）
@override@JsonKey(name: 'ThumbGif') final  String thumbGif;
/// 动态封面MP4（完整URL）
@override@JsonKey(name: 'ThumbMp4') final  String thumbMp4;
/// MV时长(秒)
@override@IntFromStringConverter()@JsonKey(name: 'Duration') final  int duration;
/// 发布日期
@override@JsonKey(name: 'PublishDate') final  String publishDate;
/// MV热度
@override@IntFromStringConverter()@JsonKey(name: 'MvHot') final  int mvHot;
/// 历史热度
@override@IntFromStringConverter()@JsonKey(name: 'HistoryHeat') final  int historyHeat;
/// 是否官方MV
@override@IntFromStringConverter()@JsonKey(name: 'IsOfficial') final  int isOfficial;
/// 是否UGC
@override@IntFromStringConverter()@JsonKey(name: 'IsUgc') final  int isUgc;
/// 是否短视频
@override@IntFromStringConverter()@JsonKey(name: 'Isshort') final  int isShort;
/// 画质标识（如 1080P）
@override@JsonKey(name: 'MvHashMark') final  String mvHashMark;
/// 权限
@override@IntFromStringConverter()@JsonKey(name: 'Privilege') final  int privilege;
/// 关联歌曲hash
@override@JsonKey(name: 'FileHash') final  String fileHash;
/// 关联MixSongID
@override@JsonKey(name: 'MixSongID') final  String mixSongId;
/// 关联专辑ID
@override@JsonKey(name: 'AlbumID') final  String albumId;
/// 歌手ID列表
 final  List<int> _singerId;
/// 歌手ID列表
@override@JsonKey(name: 'SingerID') List<int> get singerId {
  if (_singerId is EqualUnmodifiableListView) return _singerId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singerId);
}

/// 歌手信息列表
 final  List<SearchSinger> _singers;
/// 歌手信息列表
@override@JsonKey(name: 'Singers') List<SearchSinger> get singers {
  if (_singers is EqualUnmodifiableListView) return _singers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singers);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchMvInfo&&(identical(other.mvId, mvId) || other.mvId == mvId)&&(identical(other.mvName, mvName) || other.mvName == mvName)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.mvHash, mvHash) || other.mvHash == mvHash)&&(identical(other.audioId, audioId) || other.audioId == audioId)&&(identical(other.eMvId, eMvId) || other.eMvId == eMvId)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.erectPic, erectPic) || other.erectPic == erectPic)&&(identical(other.thumbGif, thumbGif) || other.thumbGif == thumbGif)&&(identical(other.thumbMp4, thumbMp4) || other.thumbMp4 == thumbMp4)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.mvHot, mvHot) || other.mvHot == mvHot)&&(identical(other.historyHeat, historyHeat) || other.historyHeat == historyHeat)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isUgc, isUgc) || other.isUgc == isUgc)&&(identical(other.isShort, isShort) || other.isShort == isShort)&&(identical(other.mvHashMark, mvHashMark) || other.mvHashMark == mvHashMark)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.mixSongId, mixSongId) || other.mixSongId == mixSongId)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&const DeepCollectionEquality().equals(other._singerId, _singerId)&&const DeepCollectionEquality().equals(other._singers, _singers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,mvId,mvName,fileName,singerName,mvHash,audioId,eMvId,pic,erectPic,thumbGif,thumbMp4,duration,publishDate,mvHot,historyHeat,isOfficial,isUgc,isShort,mvHashMark,privilege,fileHash,mixSongId,albumId,const DeepCollectionEquality().hash(_singerId),const DeepCollectionEquality().hash(_singers)]);

@override
String toString() {
  return 'SearchMvInfo(mvId: $mvId, mvName: $mvName, fileName: $fileName, singerName: $singerName, mvHash: $mvHash, audioId: $audioId, eMvId: $eMvId, pic: $pic, erectPic: $erectPic, thumbGif: $thumbGif, thumbMp4: $thumbMp4, duration: $duration, publishDate: $publishDate, mvHot: $mvHot, historyHeat: $historyHeat, isOfficial: $isOfficial, isUgc: $isUgc, isShort: $isShort, mvHashMark: $mvHashMark, privilege: $privilege, fileHash: $fileHash, mixSongId: $mixSongId, albumId: $albumId, singerId: $singerId, singers: $singers)';
}


}

/// @nodoc
abstract mixin class _$SearchMvInfoCopyWith<$Res> implements $SearchMvInfoCopyWith<$Res> {
  factory _$SearchMvInfoCopyWith(_SearchMvInfo value, $Res Function(_SearchMvInfo) _then) = __$SearchMvInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'MvID') int mvId,@JsonKey(name: 'MvName') String mvName,@JsonKey(name: 'FileName') String fileName,@JsonKey(name: 'SingerName') String singerName,@JsonKey(name: 'MvHash') String mvHash,@JsonKey(name: 'AudioID') String audioId,@JsonKey(name: 'EMvID') String eMvId,@JsonKey(name: 'Pic') String pic,@JsonKey(name: 'ErectPic') String erectPic,@JsonKey(name: 'ThumbGif') String thumbGif,@JsonKey(name: 'ThumbMp4') String thumbMp4,@IntFromStringConverter()@JsonKey(name: 'Duration') int duration,@JsonKey(name: 'PublishDate') String publishDate,@IntFromStringConverter()@JsonKey(name: 'MvHot') int mvHot,@IntFromStringConverter()@JsonKey(name: 'HistoryHeat') int historyHeat,@IntFromStringConverter()@JsonKey(name: 'IsOfficial') int isOfficial,@IntFromStringConverter()@JsonKey(name: 'IsUgc') int isUgc,@IntFromStringConverter()@JsonKey(name: 'Isshort') int isShort,@JsonKey(name: 'MvHashMark') String mvHashMark,@IntFromStringConverter()@JsonKey(name: 'Privilege') int privilege,@JsonKey(name: 'FileHash') String fileHash,@JsonKey(name: 'MixSongID') String mixSongId,@JsonKey(name: 'AlbumID') String albumId,@JsonKey(name: 'SingerID') List<int> singerId,@JsonKey(name: 'Singers') List<SearchSinger> singers
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
@override @pragma('vm:prefer-inline') $Res call({Object? mvId = null,Object? mvName = null,Object? fileName = null,Object? singerName = null,Object? mvHash = null,Object? audioId = null,Object? eMvId = null,Object? pic = null,Object? erectPic = null,Object? thumbGif = null,Object? thumbMp4 = null,Object? duration = null,Object? publishDate = null,Object? mvHot = null,Object? historyHeat = null,Object? isOfficial = null,Object? isUgc = null,Object? isShort = null,Object? mvHashMark = null,Object? privilege = null,Object? fileHash = null,Object? mixSongId = null,Object? albumId = null,Object? singerId = null,Object? singers = null,}) {
  return _then(_SearchMvInfo(
mvId: null == mvId ? _self.mvId : mvId // ignore: cast_nullable_to_non_nullable
as int,mvName: null == mvName ? _self.mvName : mvName // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,mvHash: null == mvHash ? _self.mvHash : mvHash // ignore: cast_nullable_to_non_nullable
as String,audioId: null == audioId ? _self.audioId : audioId // ignore: cast_nullable_to_non_nullable
as String,eMvId: null == eMvId ? _self.eMvId : eMvId // ignore: cast_nullable_to_non_nullable
as String,pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,erectPic: null == erectPic ? _self.erectPic : erectPic // ignore: cast_nullable_to_non_nullable
as String,thumbGif: null == thumbGif ? _self.thumbGif : thumbGif // ignore: cast_nullable_to_non_nullable
as String,thumbMp4: null == thumbMp4 ? _self.thumbMp4 : thumbMp4 // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,mvHot: null == mvHot ? _self.mvHot : mvHot // ignore: cast_nullable_to_non_nullable
as int,historyHeat: null == historyHeat ? _self.historyHeat : historyHeat // ignore: cast_nullable_to_non_nullable
as int,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as int,isUgc: null == isUgc ? _self.isUgc : isUgc // ignore: cast_nullable_to_non_nullable
as int,isShort: null == isShort ? _self.isShort : isShort // ignore: cast_nullable_to_non_nullable
as int,mvHashMark: null == mvHashMark ? _self.mvHashMark : mvHashMark // ignore: cast_nullable_to_non_nullable
as String,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,mixSongId: null == mixSongId ? _self.mixSongId : mixSongId // ignore: cast_nullable_to_non_nullable
as String,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String,singerId: null == singerId ? _self._singerId : singerId // ignore: cast_nullable_to_non_nullable
as List<int>,singers: null == singers ? _self._singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_lyric_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchLyricInfo {

/// 歌词ID（与歌曲ID一致）
@IntFromStringConverter()@JsonKey(name: 'LyricID') int get lyricId;/// 歌曲名
@JsonKey(name: 'SongName') String get songName;/// 歌手名
@JsonKey(name: 'SingerName') String get singerName;/// 文件名（如 "周杰伦 - 晴天"）
@JsonKey(name: 'FileName') String get fileName;/// 歌曲hash
@JsonKey(name: 'FileHash') String get fileHash;/// 歌曲时长（秒）
@IntFromStringConverter()@JsonKey(name: 'TimeLength') int get duration;/// 码率
@IntFromStringConverter()@JsonKey(name: 'BitRate') int get bitRate;/// 音质
@IntFromStringConverter()@JsonKey(name: 'Quality') int get quality;/// 文件大小（字节）
@IntFromStringConverter()@JsonKey(name: 'FileSize') int get fileSize;/// 扩展名
@JsonKey(name: 'ExtName') String get extName;/// 专辑ID
@JsonKey(name: 'AlbumID') String get albumId;/// 封面图（含 {size} 占位符）
@JsonKey(name: 'Image') String get image;/// 歌词预览文本
@JsonKey(name: 'Lyric') String get lyric;/// 320k Hash
@JsonKey(name: '320Hash') String get hqHash;/// 无损 Hash
@JsonKey(name: 'SQHash') String get sqHash;/// 无损文件大小
@IntFromStringConverter()@JsonKey(name: 'SQSize') int get sqSize;/// 是否有MV
@JsonKey(name: 'HasMv') bool get hasMv;/// MV Hash
@JsonKey(name: 'MvHash') String get mvHash;/// 权限
@IntFromStringConverter()@JsonKey(name: 'Privilege') int get privilege;/// MixSongID
@IntFromStringConverter()@JsonKey(name: 'MixSongID') int get mixSongId;/// 歌手信息列表
@JsonKey(name: 'Singers') List<SearchSinger> get singers;
/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchLyricInfoCopyWith<SearchLyricInfo> get copyWith => _$SearchLyricInfoCopyWithImpl<SearchLyricInfo>(this as SearchLyricInfo, _$identity);

  /// Serializes this SearchLyricInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLyricInfo&&(identical(other.lyricId, lyricId) || other.lyricId == lyricId)&&(identical(other.songName, songName) || other.songName == songName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.extName, extName) || other.extName == extName)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.image, image) || other.image == image)&&(identical(other.lyric, lyric) || other.lyric == lyric)&&(identical(other.hqHash, hqHash) || other.hqHash == hqHash)&&(identical(other.sqHash, sqHash) || other.sqHash == sqHash)&&(identical(other.sqSize, sqSize) || other.sqSize == sqSize)&&(identical(other.hasMv, hasMv) || other.hasMv == hasMv)&&(identical(other.mvHash, mvHash) || other.mvHash == mvHash)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.mixSongId, mixSongId) || other.mixSongId == mixSongId)&&const DeepCollectionEquality().equals(other.singers, singers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,lyricId,songName,singerName,fileName,fileHash,duration,bitRate,quality,fileSize,extName,albumId,image,lyric,hqHash,sqHash,sqSize,hasMv,mvHash,privilege,mixSongId,const DeepCollectionEquality().hash(singers)]);

@override
String toString() {
  return 'SearchLyricInfo(lyricId: $lyricId, songName: $songName, singerName: $singerName, fileName: $fileName, fileHash: $fileHash, duration: $duration, bitRate: $bitRate, quality: $quality, fileSize: $fileSize, extName: $extName, albumId: $albumId, image: $image, lyric: $lyric, hqHash: $hqHash, sqHash: $sqHash, sqSize: $sqSize, hasMv: $hasMv, mvHash: $mvHash, privilege: $privilege, mixSongId: $mixSongId, singers: $singers)';
}


}

/// @nodoc
abstract mixin class $SearchLyricInfoCopyWith<$Res>  {
  factory $SearchLyricInfoCopyWith(SearchLyricInfo value, $Res Function(SearchLyricInfo) _then) = _$SearchLyricInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'LyricID') int lyricId,@JsonKey(name: 'SongName') String songName,@JsonKey(name: 'SingerName') String singerName,@JsonKey(name: 'FileName') String fileName,@JsonKey(name: 'FileHash') String fileHash,@IntFromStringConverter()@JsonKey(name: 'TimeLength') int duration,@IntFromStringConverter()@JsonKey(name: 'BitRate') int bitRate,@IntFromStringConverter()@JsonKey(name: 'Quality') int quality,@IntFromStringConverter()@JsonKey(name: 'FileSize') int fileSize,@JsonKey(name: 'ExtName') String extName,@JsonKey(name: 'AlbumID') String albumId,@JsonKey(name: 'Image') String image,@JsonKey(name: 'Lyric') String lyric,@JsonKey(name: '320Hash') String hqHash,@JsonKey(name: 'SQHash') String sqHash,@IntFromStringConverter()@JsonKey(name: 'SQSize') int sqSize,@JsonKey(name: 'HasMv') bool hasMv,@JsonKey(name: 'MvHash') String mvHash,@IntFromStringConverter()@JsonKey(name: 'Privilege') int privilege,@IntFromStringConverter()@JsonKey(name: 'MixSongID') int mixSongId,@JsonKey(name: 'Singers') List<SearchSinger> singers
});




}
/// @nodoc
class _$SearchLyricInfoCopyWithImpl<$Res>
    implements $SearchLyricInfoCopyWith<$Res> {
  _$SearchLyricInfoCopyWithImpl(this._self, this._then);

  final SearchLyricInfo _self;
  final $Res Function(SearchLyricInfo) _then;

/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lyricId = null,Object? songName = null,Object? singerName = null,Object? fileName = null,Object? fileHash = null,Object? duration = null,Object? bitRate = null,Object? quality = null,Object? fileSize = null,Object? extName = null,Object? albumId = null,Object? image = null,Object? lyric = null,Object? hqHash = null,Object? sqHash = null,Object? sqSize = null,Object? hasMv = null,Object? mvHash = null,Object? privilege = null,Object? mixSongId = null,Object? singers = null,}) {
  return _then(_self.copyWith(
lyricId: null == lyricId ? _self.lyricId : lyricId // ignore: cast_nullable_to_non_nullable
as int,songName: null == songName ? _self.songName : songName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,bitRate: null == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,extName: null == extName ? _self.extName : extName // ignore: cast_nullable_to_non_nullable
as String,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,lyric: null == lyric ? _self.lyric : lyric // ignore: cast_nullable_to_non_nullable
as String,hqHash: null == hqHash ? _self.hqHash : hqHash // ignore: cast_nullable_to_non_nullable
as String,sqHash: null == sqHash ? _self.sqHash : sqHash // ignore: cast_nullable_to_non_nullable
as String,sqSize: null == sqSize ? _self.sqSize : sqSize // ignore: cast_nullable_to_non_nullable
as int,hasMv: null == hasMv ? _self.hasMv : hasMv // ignore: cast_nullable_to_non_nullable
as bool,mvHash: null == mvHash ? _self.mvHash : mvHash // ignore: cast_nullable_to_non_nullable
as String,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,mixSongId: null == mixSongId ? _self.mixSongId : mixSongId // ignore: cast_nullable_to_non_nullable
as int,singers: null == singers ? _self.singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchLyricInfo].
extension SearchLyricInfoPatterns on SearchLyricInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchLyricInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchLyricInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchLyricInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchLyricInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'LyricID')  int lyricId, @JsonKey(name: 'SongName')  String songName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'FileHash')  String fileHash, @IntFromStringConverter()@JsonKey(name: 'TimeLength')  int duration, @IntFromStringConverter()@JsonKey(name: 'BitRate')  int bitRate, @IntFromStringConverter()@JsonKey(name: 'Quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'FileSize')  int fileSize, @JsonKey(name: 'ExtName')  String extName, @JsonKey(name: 'AlbumID')  String albumId, @JsonKey(name: 'Image')  String image, @JsonKey(name: 'Lyric')  String lyric, @JsonKey(name: '320Hash')  String hqHash, @JsonKey(name: 'SQHash')  String sqHash, @IntFromStringConverter()@JsonKey(name: 'SQSize')  int sqSize, @JsonKey(name: 'HasMv')  bool hasMv, @JsonKey(name: 'MvHash')  String mvHash, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'MixSongID')  int mixSongId, @JsonKey(name: 'Singers')  List<SearchSinger> singers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
return $default(_that.lyricId,_that.songName,_that.singerName,_that.fileName,_that.fileHash,_that.duration,_that.bitRate,_that.quality,_that.fileSize,_that.extName,_that.albumId,_that.image,_that.lyric,_that.hqHash,_that.sqHash,_that.sqSize,_that.hasMv,_that.mvHash,_that.privilege,_that.mixSongId,_that.singers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'LyricID')  int lyricId, @JsonKey(name: 'SongName')  String songName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'FileHash')  String fileHash, @IntFromStringConverter()@JsonKey(name: 'TimeLength')  int duration, @IntFromStringConverter()@JsonKey(name: 'BitRate')  int bitRate, @IntFromStringConverter()@JsonKey(name: 'Quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'FileSize')  int fileSize, @JsonKey(name: 'ExtName')  String extName, @JsonKey(name: 'AlbumID')  String albumId, @JsonKey(name: 'Image')  String image, @JsonKey(name: 'Lyric')  String lyric, @JsonKey(name: '320Hash')  String hqHash, @JsonKey(name: 'SQHash')  String sqHash, @IntFromStringConverter()@JsonKey(name: 'SQSize')  int sqSize, @JsonKey(name: 'HasMv')  bool hasMv, @JsonKey(name: 'MvHash')  String mvHash, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'MixSongID')  int mixSongId, @JsonKey(name: 'Singers')  List<SearchSinger> singers)  $default,) {final _that = this;
switch (_that) {
case _SearchLyricInfo():
return $default(_that.lyricId,_that.songName,_that.singerName,_that.fileName,_that.fileHash,_that.duration,_that.bitRate,_that.quality,_that.fileSize,_that.extName,_that.albumId,_that.image,_that.lyric,_that.hqHash,_that.sqHash,_that.sqSize,_that.hasMv,_that.mvHash,_that.privilege,_that.mixSongId,_that.singers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'LyricID')  int lyricId, @JsonKey(name: 'SongName')  String songName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'FileHash')  String fileHash, @IntFromStringConverter()@JsonKey(name: 'TimeLength')  int duration, @IntFromStringConverter()@JsonKey(name: 'BitRate')  int bitRate, @IntFromStringConverter()@JsonKey(name: 'Quality')  int quality, @IntFromStringConverter()@JsonKey(name: 'FileSize')  int fileSize, @JsonKey(name: 'ExtName')  String extName, @JsonKey(name: 'AlbumID')  String albumId, @JsonKey(name: 'Image')  String image, @JsonKey(name: 'Lyric')  String lyric, @JsonKey(name: '320Hash')  String hqHash, @JsonKey(name: 'SQHash')  String sqHash, @IntFromStringConverter()@JsonKey(name: 'SQSize')  int sqSize, @JsonKey(name: 'HasMv')  bool hasMv, @JsonKey(name: 'MvHash')  String mvHash, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @IntFromStringConverter()@JsonKey(name: 'MixSongID')  int mixSongId, @JsonKey(name: 'Singers')  List<SearchSinger> singers)?  $default,) {final _that = this;
switch (_that) {
case _SearchLyricInfo() when $default != null:
return $default(_that.lyricId,_that.songName,_that.singerName,_that.fileName,_that.fileHash,_that.duration,_that.bitRate,_that.quality,_that.fileSize,_that.extName,_that.albumId,_that.image,_that.lyric,_that.hqHash,_that.sqHash,_that.sqSize,_that.hasMv,_that.mvHash,_that.privilege,_that.mixSongId,_that.singers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchLyricInfo extends SearchLyricInfo {
  const _SearchLyricInfo({@IntFromStringConverter()@JsonKey(name: 'LyricID') this.lyricId = 0, @JsonKey(name: 'SongName') this.songName = '', @JsonKey(name: 'SingerName') this.singerName = '', @JsonKey(name: 'FileName') this.fileName = '', @JsonKey(name: 'FileHash') this.fileHash = '', @IntFromStringConverter()@JsonKey(name: 'TimeLength') this.duration = 0, @IntFromStringConverter()@JsonKey(name: 'BitRate') this.bitRate = 0, @IntFromStringConverter()@JsonKey(name: 'Quality') this.quality = 0, @IntFromStringConverter()@JsonKey(name: 'FileSize') this.fileSize = 0, @JsonKey(name: 'ExtName') this.extName = '', @JsonKey(name: 'AlbumID') this.albumId = '', @JsonKey(name: 'Image') this.image = '', @JsonKey(name: 'Lyric') this.lyric = '', @JsonKey(name: '320Hash') this.hqHash = '', @JsonKey(name: 'SQHash') this.sqHash = '', @IntFromStringConverter()@JsonKey(name: 'SQSize') this.sqSize = 0, @JsonKey(name: 'HasMv') this.hasMv = false, @JsonKey(name: 'MvHash') this.mvHash = '', @IntFromStringConverter()@JsonKey(name: 'Privilege') this.privilege = 0, @IntFromStringConverter()@JsonKey(name: 'MixSongID') this.mixSongId = 0, @JsonKey(name: 'Singers') final  List<SearchSinger> singers = const []}): _singers = singers,super._();
  factory _SearchLyricInfo.fromJson(Map<String, dynamic> json) => _$SearchLyricInfoFromJson(json);

/// 歌词ID（与歌曲ID一致）
@override@IntFromStringConverter()@JsonKey(name: 'LyricID') final  int lyricId;
/// 歌曲名
@override@JsonKey(name: 'SongName') final  String songName;
/// 歌手名
@override@JsonKey(name: 'SingerName') final  String singerName;
/// 文件名（如 "周杰伦 - 晴天"）
@override@JsonKey(name: 'FileName') final  String fileName;
/// 歌曲hash
@override@JsonKey(name: 'FileHash') final  String fileHash;
/// 歌曲时长（秒）
@override@IntFromStringConverter()@JsonKey(name: 'TimeLength') final  int duration;
/// 码率
@override@IntFromStringConverter()@JsonKey(name: 'BitRate') final  int bitRate;
/// 音质
@override@IntFromStringConverter()@JsonKey(name: 'Quality') final  int quality;
/// 文件大小（字节）
@override@IntFromStringConverter()@JsonKey(name: 'FileSize') final  int fileSize;
/// 扩展名
@override@JsonKey(name: 'ExtName') final  String extName;
/// 专辑ID
@override@JsonKey(name: 'AlbumID') final  String albumId;
/// 封面图（含 {size} 占位符）
@override@JsonKey(name: 'Image') final  String image;
/// 歌词预览文本
@override@JsonKey(name: 'Lyric') final  String lyric;
/// 320k Hash
@override@JsonKey(name: '320Hash') final  String hqHash;
/// 无损 Hash
@override@JsonKey(name: 'SQHash') final  String sqHash;
/// 无损文件大小
@override@IntFromStringConverter()@JsonKey(name: 'SQSize') final  int sqSize;
/// 是否有MV
@override@JsonKey(name: 'HasMv') final  bool hasMv;
/// MV Hash
@override@JsonKey(name: 'MvHash') final  String mvHash;
/// 权限
@override@IntFromStringConverter()@JsonKey(name: 'Privilege') final  int privilege;
/// MixSongID
@override@IntFromStringConverter()@JsonKey(name: 'MixSongID') final  int mixSongId;
/// 歌手信息列表
 final  List<SearchSinger> _singers;
/// 歌手信息列表
@override@JsonKey(name: 'Singers') List<SearchSinger> get singers {
  if (_singers is EqualUnmodifiableListView) return _singers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singers);
}


/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchLyricInfoCopyWith<_SearchLyricInfo> get copyWith => __$SearchLyricInfoCopyWithImpl<_SearchLyricInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchLyricInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchLyricInfo&&(identical(other.lyricId, lyricId) || other.lyricId == lyricId)&&(identical(other.songName, songName) || other.songName == songName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.extName, extName) || other.extName == extName)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.image, image) || other.image == image)&&(identical(other.lyric, lyric) || other.lyric == lyric)&&(identical(other.hqHash, hqHash) || other.hqHash == hqHash)&&(identical(other.sqHash, sqHash) || other.sqHash == sqHash)&&(identical(other.sqSize, sqSize) || other.sqSize == sqSize)&&(identical(other.hasMv, hasMv) || other.hasMv == hasMv)&&(identical(other.mvHash, mvHash) || other.mvHash == mvHash)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.mixSongId, mixSongId) || other.mixSongId == mixSongId)&&const DeepCollectionEquality().equals(other._singers, _singers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,lyricId,songName,singerName,fileName,fileHash,duration,bitRate,quality,fileSize,extName,albumId,image,lyric,hqHash,sqHash,sqSize,hasMv,mvHash,privilege,mixSongId,const DeepCollectionEquality().hash(_singers)]);

@override
String toString() {
  return 'SearchLyricInfo(lyricId: $lyricId, songName: $songName, singerName: $singerName, fileName: $fileName, fileHash: $fileHash, duration: $duration, bitRate: $bitRate, quality: $quality, fileSize: $fileSize, extName: $extName, albumId: $albumId, image: $image, lyric: $lyric, hqHash: $hqHash, sqHash: $sqHash, sqSize: $sqSize, hasMv: $hasMv, mvHash: $mvHash, privilege: $privilege, mixSongId: $mixSongId, singers: $singers)';
}


}

/// @nodoc
abstract mixin class _$SearchLyricInfoCopyWith<$Res> implements $SearchLyricInfoCopyWith<$Res> {
  factory _$SearchLyricInfoCopyWith(_SearchLyricInfo value, $Res Function(_SearchLyricInfo) _then) = __$SearchLyricInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'LyricID') int lyricId,@JsonKey(name: 'SongName') String songName,@JsonKey(name: 'SingerName') String singerName,@JsonKey(name: 'FileName') String fileName,@JsonKey(name: 'FileHash') String fileHash,@IntFromStringConverter()@JsonKey(name: 'TimeLength') int duration,@IntFromStringConverter()@JsonKey(name: 'BitRate') int bitRate,@IntFromStringConverter()@JsonKey(name: 'Quality') int quality,@IntFromStringConverter()@JsonKey(name: 'FileSize') int fileSize,@JsonKey(name: 'ExtName') String extName,@JsonKey(name: 'AlbumID') String albumId,@JsonKey(name: 'Image') String image,@JsonKey(name: 'Lyric') String lyric,@JsonKey(name: '320Hash') String hqHash,@JsonKey(name: 'SQHash') String sqHash,@IntFromStringConverter()@JsonKey(name: 'SQSize') int sqSize,@JsonKey(name: 'HasMv') bool hasMv,@JsonKey(name: 'MvHash') String mvHash,@IntFromStringConverter()@JsonKey(name: 'Privilege') int privilege,@IntFromStringConverter()@JsonKey(name: 'MixSongID') int mixSongId,@JsonKey(name: 'Singers') List<SearchSinger> singers
});




}
/// @nodoc
class __$SearchLyricInfoCopyWithImpl<$Res>
    implements _$SearchLyricInfoCopyWith<$Res> {
  __$SearchLyricInfoCopyWithImpl(this._self, this._then);

  final _SearchLyricInfo _self;
  final $Res Function(_SearchLyricInfo) _then;

/// Create a copy of SearchLyricInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lyricId = null,Object? songName = null,Object? singerName = null,Object? fileName = null,Object? fileHash = null,Object? duration = null,Object? bitRate = null,Object? quality = null,Object? fileSize = null,Object? extName = null,Object? albumId = null,Object? image = null,Object? lyric = null,Object? hqHash = null,Object? sqHash = null,Object? sqSize = null,Object? hasMv = null,Object? mvHash = null,Object? privilege = null,Object? mixSongId = null,Object? singers = null,}) {
  return _then(_SearchLyricInfo(
lyricId: null == lyricId ? _self.lyricId : lyricId // ignore: cast_nullable_to_non_nullable
as int,songName: null == songName ? _self.songName : songName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,bitRate: null == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as int,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,extName: null == extName ? _self.extName : extName // ignore: cast_nullable_to_non_nullable
as String,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,lyric: null == lyric ? _self.lyric : lyric // ignore: cast_nullable_to_non_nullable
as String,hqHash: null == hqHash ? _self.hqHash : hqHash // ignore: cast_nullable_to_non_nullable
as String,sqHash: null == sqHash ? _self.sqHash : sqHash // ignore: cast_nullable_to_non_nullable
as String,sqSize: null == sqSize ? _self.sqSize : sqSize // ignore: cast_nullable_to_non_nullable
as int,hasMv: null == hasMv ? _self.hasMv : hasMv // ignore: cast_nullable_to_non_nullable
as bool,mvHash: null == mvHash ? _self.mvHash : mvHash // ignore: cast_nullable_to_non_nullable
as String,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,mixSongId: null == mixSongId ? _self.mixSongId : mixSongId // ignore: cast_nullable_to_non_nullable
as int,singers: null == singers ? _self._singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,
  ));
}


}

// dart format on

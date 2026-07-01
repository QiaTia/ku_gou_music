// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_song_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchSongInfo {

/// 歌曲ID（如：32157565）
@IntFromStringConverter()@JsonKey(name: 'ID') int get id;/// 歌曲名
@JsonKey(name: 'SongName') String get songName;/// 歌手名
@JsonKey(name: 'SingerName') String get singerName;/// 歌曲Hash（用于播放）
@JsonKey(name: 'FileHash') String get fileHash;/// 歌曲时长（秒）
@IntFromStringConverter()@JsonKey(name: 'Duration') int get duration;/// 封面图URL（含 {size} 占位符）
@JsonKey(name: 'Image') String get image;/// 专辑ID
@IntFromStringConverter()@JsonKey(name: 'AlbumID') int get albumId;/// 专辑名
@JsonKey(name: 'AlbumName') String get albumName;/// 音质等级
@IntFromStringConverter()@JsonKey(name: 'QualityLevel') int get qualityLevel;/// 是否原唱
@IntFromStringConverter()@JsonKey(name: 'IsOriginal') int get isOriginal;/// 文件大小（字节）
@IntFromStringConverter()@JsonKey(name: 'FileSize') int get fileSize;/// 无损Hash
@JsonKey(name: 'SQFileHash') String get sqFileHash;/// HQ Hash
@JsonKey(name: 'HQFileHash') String get hqFileHash;/// 是否VIP（Privilege字段）
@IntFromStringConverter()@JsonKey(name: 'Privilege') int get privilege;/// 发布日期
@JsonKey(name: 'PublishDate') String get publishDate;/// 歌曲标签
@JsonKey(name: 'SongLabel') String get songLabel;/// 文件名（完整格式）
@JsonKey(name: 'FileName') String get fileName;/// MV Hash
@JsonKey(name: 'MvHash') String get mvHash;/// 原歌曲名（不带后缀）
@JsonKey(name: 'OriSongName') String get oriSongName;/// 其他名称
@JsonKey(name: 'OtherName') String get otherName;/// 后缀（如 DJ版）
@JsonKey(name: 'Suffix') String get suffix;/// 歌手ID列表
@JsonKey(name: 'SingerId') List<int> get singerId;/// 歌手信息列表
@JsonKey(name: 'Singers') List<SearchSinger> get singers;/// 扩展名（mp3/flac等）
@JsonKey(name: 'ExtName') String get extName;/// 码率
@IntFromStringConverter()@JsonKey(name: 'Bitrate') int get bitrate;/// 付费类型
@IntFromStringConverter()@JsonKey(name: 'PayType') int get payType;/// 价格
@IntFromStringConverter()@JsonKey(name: 'Price') int get price;/// 热度等级
@IntFromStringConverter()@JsonKey(name: 'HeatLevel') int get heatLevel;/// 是否预发布
@IntFromStringConverter()@JsonKey(name: 'isPrepublish') int get isPrepublish;
/// Create a copy of SearchSongInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSongInfoCopyWith<SearchSongInfo> get copyWith => _$SearchSongInfoCopyWithImpl<SearchSongInfo>(this as SearchSongInfo, _$identity);

  /// Serializes this SearchSongInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSongInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.songName, songName) || other.songName == songName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.image, image) || other.image == image)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.qualityLevel, qualityLevel) || other.qualityLevel == qualityLevel)&&(identical(other.isOriginal, isOriginal) || other.isOriginal == isOriginal)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.sqFileHash, sqFileHash) || other.sqFileHash == sqFileHash)&&(identical(other.hqFileHash, hqFileHash) || other.hqFileHash == hqFileHash)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.songLabel, songLabel) || other.songLabel == songLabel)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mvHash, mvHash) || other.mvHash == mvHash)&&(identical(other.oriSongName, oriSongName) || other.oriSongName == oriSongName)&&(identical(other.otherName, otherName) || other.otherName == otherName)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&const DeepCollectionEquality().equals(other.singerId, singerId)&&const DeepCollectionEquality().equals(other.singers, singers)&&(identical(other.extName, extName) || other.extName == extName)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.payType, payType) || other.payType == payType)&&(identical(other.price, price) || other.price == price)&&(identical(other.heatLevel, heatLevel) || other.heatLevel == heatLevel)&&(identical(other.isPrepublish, isPrepublish) || other.isPrepublish == isPrepublish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,songName,singerName,fileHash,duration,image,albumId,albumName,qualityLevel,isOriginal,fileSize,sqFileHash,hqFileHash,privilege,publishDate,songLabel,fileName,mvHash,oriSongName,otherName,suffix,const DeepCollectionEquality().hash(singerId),const DeepCollectionEquality().hash(singers),extName,bitrate,payType,price,heatLevel,isPrepublish]);

@override
String toString() {
  return 'SearchSongInfo(id: $id, songName: $songName, singerName: $singerName, fileHash: $fileHash, duration: $duration, image: $image, albumId: $albumId, albumName: $albumName, qualityLevel: $qualityLevel, isOriginal: $isOriginal, fileSize: $fileSize, sqFileHash: $sqFileHash, hqFileHash: $hqFileHash, privilege: $privilege, publishDate: $publishDate, songLabel: $songLabel, fileName: $fileName, mvHash: $mvHash, oriSongName: $oriSongName, otherName: $otherName, suffix: $suffix, singerId: $singerId, singers: $singers, extName: $extName, bitrate: $bitrate, payType: $payType, price: $price, heatLevel: $heatLevel, isPrepublish: $isPrepublish)';
}


}

/// @nodoc
abstract mixin class $SearchSongInfoCopyWith<$Res>  {
  factory $SearchSongInfoCopyWith(SearchSongInfo value, $Res Function(SearchSongInfo) _then) = _$SearchSongInfoCopyWithImpl;
@useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'ID') int id,@JsonKey(name: 'SongName') String songName,@JsonKey(name: 'SingerName') String singerName,@JsonKey(name: 'FileHash') String fileHash,@IntFromStringConverter()@JsonKey(name: 'Duration') int duration,@JsonKey(name: 'Image') String image,@IntFromStringConverter()@JsonKey(name: 'AlbumID') int albumId,@JsonKey(name: 'AlbumName') String albumName,@IntFromStringConverter()@JsonKey(name: 'QualityLevel') int qualityLevel,@IntFromStringConverter()@JsonKey(name: 'IsOriginal') int isOriginal,@IntFromStringConverter()@JsonKey(name: 'FileSize') int fileSize,@JsonKey(name: 'SQFileHash') String sqFileHash,@JsonKey(name: 'HQFileHash') String hqFileHash,@IntFromStringConverter()@JsonKey(name: 'Privilege') int privilege,@JsonKey(name: 'PublishDate') String publishDate,@JsonKey(name: 'SongLabel') String songLabel,@JsonKey(name: 'FileName') String fileName,@JsonKey(name: 'MvHash') String mvHash,@JsonKey(name: 'OriSongName') String oriSongName,@JsonKey(name: 'OtherName') String otherName,@JsonKey(name: 'Suffix') String suffix,@JsonKey(name: 'SingerId') List<int> singerId,@JsonKey(name: 'Singers') List<SearchSinger> singers,@JsonKey(name: 'ExtName') String extName,@IntFromStringConverter()@JsonKey(name: 'Bitrate') int bitrate,@IntFromStringConverter()@JsonKey(name: 'PayType') int payType,@IntFromStringConverter()@JsonKey(name: 'Price') int price,@IntFromStringConverter()@JsonKey(name: 'HeatLevel') int heatLevel,@IntFromStringConverter()@JsonKey(name: 'isPrepublish') int isPrepublish
});




}
/// @nodoc
class _$SearchSongInfoCopyWithImpl<$Res>
    implements $SearchSongInfoCopyWith<$Res> {
  _$SearchSongInfoCopyWithImpl(this._self, this._then);

  final SearchSongInfo _self;
  final $Res Function(SearchSongInfo) _then;

/// Create a copy of SearchSongInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? songName = null,Object? singerName = null,Object? fileHash = null,Object? duration = null,Object? image = null,Object? albumId = null,Object? albumName = null,Object? qualityLevel = null,Object? isOriginal = null,Object? fileSize = null,Object? sqFileHash = null,Object? hqFileHash = null,Object? privilege = null,Object? publishDate = null,Object? songLabel = null,Object? fileName = null,Object? mvHash = null,Object? oriSongName = null,Object? otherName = null,Object? suffix = null,Object? singerId = null,Object? singers = null,Object? extName = null,Object? bitrate = null,Object? payType = null,Object? price = null,Object? heatLevel = null,Object? isPrepublish = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,songName: null == songName ? _self.songName : songName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,qualityLevel: null == qualityLevel ? _self.qualityLevel : qualityLevel // ignore: cast_nullable_to_non_nullable
as int,isOriginal: null == isOriginal ? _self.isOriginal : isOriginal // ignore: cast_nullable_to_non_nullable
as int,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,sqFileHash: null == sqFileHash ? _self.sqFileHash : sqFileHash // ignore: cast_nullable_to_non_nullable
as String,hqFileHash: null == hqFileHash ? _self.hqFileHash : hqFileHash // ignore: cast_nullable_to_non_nullable
as String,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,songLabel: null == songLabel ? _self.songLabel : songLabel // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mvHash: null == mvHash ? _self.mvHash : mvHash // ignore: cast_nullable_to_non_nullable
as String,oriSongName: null == oriSongName ? _self.oriSongName : oriSongName // ignore: cast_nullable_to_non_nullable
as String,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,suffix: null == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String,singerId: null == singerId ? _self.singerId : singerId // ignore: cast_nullable_to_non_nullable
as List<int>,singers: null == singers ? _self.singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,extName: null == extName ? _self.extName : extName // ignore: cast_nullable_to_non_nullable
as String,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,payType: null == payType ? _self.payType : payType // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,heatLevel: null == heatLevel ? _self.heatLevel : heatLevel // ignore: cast_nullable_to_non_nullable
as int,isPrepublish: null == isPrepublish ? _self.isPrepublish : isPrepublish // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSongInfo].
extension SearchSongInfoPatterns on SearchSongInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSongInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSongInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSongInfo value)  $default,){
final _that = this;
switch (_that) {
case _SearchSongInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSongInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSongInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'ID')  int id, @JsonKey(name: 'SongName')  String songName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'FileHash')  String fileHash, @IntFromStringConverter()@JsonKey(name: 'Duration')  int duration, @JsonKey(name: 'Image')  String image, @IntFromStringConverter()@JsonKey(name: 'AlbumID')  int albumId, @JsonKey(name: 'AlbumName')  String albumName, @IntFromStringConverter()@JsonKey(name: 'QualityLevel')  int qualityLevel, @IntFromStringConverter()@JsonKey(name: 'IsOriginal')  int isOriginal, @IntFromStringConverter()@JsonKey(name: 'FileSize')  int fileSize, @JsonKey(name: 'SQFileHash')  String sqFileHash, @JsonKey(name: 'HQFileHash')  String hqFileHash, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @JsonKey(name: 'PublishDate')  String publishDate, @JsonKey(name: 'SongLabel')  String songLabel, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'MvHash')  String mvHash, @JsonKey(name: 'OriSongName')  String oriSongName, @JsonKey(name: 'OtherName')  String otherName, @JsonKey(name: 'Suffix')  String suffix, @JsonKey(name: 'SingerId')  List<int> singerId, @JsonKey(name: 'Singers')  List<SearchSinger> singers, @JsonKey(name: 'ExtName')  String extName, @IntFromStringConverter()@JsonKey(name: 'Bitrate')  int bitrate, @IntFromStringConverter()@JsonKey(name: 'PayType')  int payType, @IntFromStringConverter()@JsonKey(name: 'Price')  int price, @IntFromStringConverter()@JsonKey(name: 'HeatLevel')  int heatLevel, @IntFromStringConverter()@JsonKey(name: 'isPrepublish')  int isPrepublish)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSongInfo() when $default != null:
return $default(_that.id,_that.songName,_that.singerName,_that.fileHash,_that.duration,_that.image,_that.albumId,_that.albumName,_that.qualityLevel,_that.isOriginal,_that.fileSize,_that.sqFileHash,_that.hqFileHash,_that.privilege,_that.publishDate,_that.songLabel,_that.fileName,_that.mvHash,_that.oriSongName,_that.otherName,_that.suffix,_that.singerId,_that.singers,_that.extName,_that.bitrate,_that.payType,_that.price,_that.heatLevel,_that.isPrepublish);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IntFromStringConverter()@JsonKey(name: 'ID')  int id, @JsonKey(name: 'SongName')  String songName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'FileHash')  String fileHash, @IntFromStringConverter()@JsonKey(name: 'Duration')  int duration, @JsonKey(name: 'Image')  String image, @IntFromStringConverter()@JsonKey(name: 'AlbumID')  int albumId, @JsonKey(name: 'AlbumName')  String albumName, @IntFromStringConverter()@JsonKey(name: 'QualityLevel')  int qualityLevel, @IntFromStringConverter()@JsonKey(name: 'IsOriginal')  int isOriginal, @IntFromStringConverter()@JsonKey(name: 'FileSize')  int fileSize, @JsonKey(name: 'SQFileHash')  String sqFileHash, @JsonKey(name: 'HQFileHash')  String hqFileHash, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @JsonKey(name: 'PublishDate')  String publishDate, @JsonKey(name: 'SongLabel')  String songLabel, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'MvHash')  String mvHash, @JsonKey(name: 'OriSongName')  String oriSongName, @JsonKey(name: 'OtherName')  String otherName, @JsonKey(name: 'Suffix')  String suffix, @JsonKey(name: 'SingerId')  List<int> singerId, @JsonKey(name: 'Singers')  List<SearchSinger> singers, @JsonKey(name: 'ExtName')  String extName, @IntFromStringConverter()@JsonKey(name: 'Bitrate')  int bitrate, @IntFromStringConverter()@JsonKey(name: 'PayType')  int payType, @IntFromStringConverter()@JsonKey(name: 'Price')  int price, @IntFromStringConverter()@JsonKey(name: 'HeatLevel')  int heatLevel, @IntFromStringConverter()@JsonKey(name: 'isPrepublish')  int isPrepublish)  $default,) {final _that = this;
switch (_that) {
case _SearchSongInfo():
return $default(_that.id,_that.songName,_that.singerName,_that.fileHash,_that.duration,_that.image,_that.albumId,_that.albumName,_that.qualityLevel,_that.isOriginal,_that.fileSize,_that.sqFileHash,_that.hqFileHash,_that.privilege,_that.publishDate,_that.songLabel,_that.fileName,_that.mvHash,_that.oriSongName,_that.otherName,_that.suffix,_that.singerId,_that.singers,_that.extName,_that.bitrate,_that.payType,_that.price,_that.heatLevel,_that.isPrepublish);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IntFromStringConverter()@JsonKey(name: 'ID')  int id, @JsonKey(name: 'SongName')  String songName, @JsonKey(name: 'SingerName')  String singerName, @JsonKey(name: 'FileHash')  String fileHash, @IntFromStringConverter()@JsonKey(name: 'Duration')  int duration, @JsonKey(name: 'Image')  String image, @IntFromStringConverter()@JsonKey(name: 'AlbumID')  int albumId, @JsonKey(name: 'AlbumName')  String albumName, @IntFromStringConverter()@JsonKey(name: 'QualityLevel')  int qualityLevel, @IntFromStringConverter()@JsonKey(name: 'IsOriginal')  int isOriginal, @IntFromStringConverter()@JsonKey(name: 'FileSize')  int fileSize, @JsonKey(name: 'SQFileHash')  String sqFileHash, @JsonKey(name: 'HQFileHash')  String hqFileHash, @IntFromStringConverter()@JsonKey(name: 'Privilege')  int privilege, @JsonKey(name: 'PublishDate')  String publishDate, @JsonKey(name: 'SongLabel')  String songLabel, @JsonKey(name: 'FileName')  String fileName, @JsonKey(name: 'MvHash')  String mvHash, @JsonKey(name: 'OriSongName')  String oriSongName, @JsonKey(name: 'OtherName')  String otherName, @JsonKey(name: 'Suffix')  String suffix, @JsonKey(name: 'SingerId')  List<int> singerId, @JsonKey(name: 'Singers')  List<SearchSinger> singers, @JsonKey(name: 'ExtName')  String extName, @IntFromStringConverter()@JsonKey(name: 'Bitrate')  int bitrate, @IntFromStringConverter()@JsonKey(name: 'PayType')  int payType, @IntFromStringConverter()@JsonKey(name: 'Price')  int price, @IntFromStringConverter()@JsonKey(name: 'HeatLevel')  int heatLevel, @IntFromStringConverter()@JsonKey(name: 'isPrepublish')  int isPrepublish)?  $default,) {final _that = this;
switch (_that) {
case _SearchSongInfo() when $default != null:
return $default(_that.id,_that.songName,_that.singerName,_that.fileHash,_that.duration,_that.image,_that.albumId,_that.albumName,_that.qualityLevel,_that.isOriginal,_that.fileSize,_that.sqFileHash,_that.hqFileHash,_that.privilege,_that.publishDate,_that.songLabel,_that.fileName,_that.mvHash,_that.oriSongName,_that.otherName,_that.suffix,_that.singerId,_that.singers,_that.extName,_that.bitrate,_that.payType,_that.price,_that.heatLevel,_that.isPrepublish);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSongInfo extends SearchSongInfo {
  const _SearchSongInfo({@IntFromStringConverter()@JsonKey(name: 'ID') this.id = 0, @JsonKey(name: 'SongName') this.songName = '', @JsonKey(name: 'SingerName') this.singerName = '', @JsonKey(name: 'FileHash') this.fileHash = '', @IntFromStringConverter()@JsonKey(name: 'Duration') this.duration = 0, @JsonKey(name: 'Image') this.image = '', @IntFromStringConverter()@JsonKey(name: 'AlbumID') this.albumId = 0, @JsonKey(name: 'AlbumName') this.albumName = '', @IntFromStringConverter()@JsonKey(name: 'QualityLevel') this.qualityLevel = 0, @IntFromStringConverter()@JsonKey(name: 'IsOriginal') this.isOriginal = 0, @IntFromStringConverter()@JsonKey(name: 'FileSize') this.fileSize = 0, @JsonKey(name: 'SQFileHash') this.sqFileHash = '', @JsonKey(name: 'HQFileHash') this.hqFileHash = '', @IntFromStringConverter()@JsonKey(name: 'Privilege') this.privilege = 0, @JsonKey(name: 'PublishDate') this.publishDate = '', @JsonKey(name: 'SongLabel') this.songLabel = '', @JsonKey(name: 'FileName') this.fileName = '', @JsonKey(name: 'MvHash') this.mvHash = '', @JsonKey(name: 'OriSongName') this.oriSongName = '', @JsonKey(name: 'OtherName') this.otherName = '', @JsonKey(name: 'Suffix') this.suffix = '', @JsonKey(name: 'SingerId') final  List<int> singerId = const [], @JsonKey(name: 'Singers') final  List<SearchSinger> singers = const [], @JsonKey(name: 'ExtName') this.extName = '', @IntFromStringConverter()@JsonKey(name: 'Bitrate') this.bitrate = 0, @IntFromStringConverter()@JsonKey(name: 'PayType') this.payType = 0, @IntFromStringConverter()@JsonKey(name: 'Price') this.price = 0, @IntFromStringConverter()@JsonKey(name: 'HeatLevel') this.heatLevel = 0, @IntFromStringConverter()@JsonKey(name: 'isPrepublish') this.isPrepublish = 0}): _singerId = singerId,_singers = singers,super._();
  factory _SearchSongInfo.fromJson(Map<String, dynamic> json) => _$SearchSongInfoFromJson(json);

/// 歌曲ID（如：32157565）
@override@IntFromStringConverter()@JsonKey(name: 'ID') final  int id;
/// 歌曲名
@override@JsonKey(name: 'SongName') final  String songName;
/// 歌手名
@override@JsonKey(name: 'SingerName') final  String singerName;
/// 歌曲Hash（用于播放）
@override@JsonKey(name: 'FileHash') final  String fileHash;
/// 歌曲时长（秒）
@override@IntFromStringConverter()@JsonKey(name: 'Duration') final  int duration;
/// 封面图URL（含 {size} 占位符）
@override@JsonKey(name: 'Image') final  String image;
/// 专辑ID
@override@IntFromStringConverter()@JsonKey(name: 'AlbumID') final  int albumId;
/// 专辑名
@override@JsonKey(name: 'AlbumName') final  String albumName;
/// 音质等级
@override@IntFromStringConverter()@JsonKey(name: 'QualityLevel') final  int qualityLevel;
/// 是否原唱
@override@IntFromStringConverter()@JsonKey(name: 'IsOriginal') final  int isOriginal;
/// 文件大小（字节）
@override@IntFromStringConverter()@JsonKey(name: 'FileSize') final  int fileSize;
/// 无损Hash
@override@JsonKey(name: 'SQFileHash') final  String sqFileHash;
/// HQ Hash
@override@JsonKey(name: 'HQFileHash') final  String hqFileHash;
/// 是否VIP（Privilege字段）
@override@IntFromStringConverter()@JsonKey(name: 'Privilege') final  int privilege;
/// 发布日期
@override@JsonKey(name: 'PublishDate') final  String publishDate;
/// 歌曲标签
@override@JsonKey(name: 'SongLabel') final  String songLabel;
/// 文件名（完整格式）
@override@JsonKey(name: 'FileName') final  String fileName;
/// MV Hash
@override@JsonKey(name: 'MvHash') final  String mvHash;
/// 原歌曲名（不带后缀）
@override@JsonKey(name: 'OriSongName') final  String oriSongName;
/// 其他名称
@override@JsonKey(name: 'OtherName') final  String otherName;
/// 后缀（如 DJ版）
@override@JsonKey(name: 'Suffix') final  String suffix;
/// 歌手ID列表
 final  List<int> _singerId;
/// 歌手ID列表
@override@JsonKey(name: 'SingerId') List<int> get singerId {
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

/// 扩展名（mp3/flac等）
@override@JsonKey(name: 'ExtName') final  String extName;
/// 码率
@override@IntFromStringConverter()@JsonKey(name: 'Bitrate') final  int bitrate;
/// 付费类型
@override@IntFromStringConverter()@JsonKey(name: 'PayType') final  int payType;
/// 价格
@override@IntFromStringConverter()@JsonKey(name: 'Price') final  int price;
/// 热度等级
@override@IntFromStringConverter()@JsonKey(name: 'HeatLevel') final  int heatLevel;
/// 是否预发布
@override@IntFromStringConverter()@JsonKey(name: 'isPrepublish') final  int isPrepublish;

/// Create a copy of SearchSongInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSongInfoCopyWith<_SearchSongInfo> get copyWith => __$SearchSongInfoCopyWithImpl<_SearchSongInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSongInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSongInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.songName, songName) || other.songName == songName)&&(identical(other.singerName, singerName) || other.singerName == singerName)&&(identical(other.fileHash, fileHash) || other.fileHash == fileHash)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.image, image) || other.image == image)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.qualityLevel, qualityLevel) || other.qualityLevel == qualityLevel)&&(identical(other.isOriginal, isOriginal) || other.isOriginal == isOriginal)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.sqFileHash, sqFileHash) || other.sqFileHash == sqFileHash)&&(identical(other.hqFileHash, hqFileHash) || other.hqFileHash == hqFileHash)&&(identical(other.privilege, privilege) || other.privilege == privilege)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&(identical(other.songLabel, songLabel) || other.songLabel == songLabel)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mvHash, mvHash) || other.mvHash == mvHash)&&(identical(other.oriSongName, oriSongName) || other.oriSongName == oriSongName)&&(identical(other.otherName, otherName) || other.otherName == otherName)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&const DeepCollectionEquality().equals(other._singerId, _singerId)&&const DeepCollectionEquality().equals(other._singers, _singers)&&(identical(other.extName, extName) || other.extName == extName)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.payType, payType) || other.payType == payType)&&(identical(other.price, price) || other.price == price)&&(identical(other.heatLevel, heatLevel) || other.heatLevel == heatLevel)&&(identical(other.isPrepublish, isPrepublish) || other.isPrepublish == isPrepublish));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,songName,singerName,fileHash,duration,image,albumId,albumName,qualityLevel,isOriginal,fileSize,sqFileHash,hqFileHash,privilege,publishDate,songLabel,fileName,mvHash,oriSongName,otherName,suffix,const DeepCollectionEquality().hash(_singerId),const DeepCollectionEquality().hash(_singers),extName,bitrate,payType,price,heatLevel,isPrepublish]);

@override
String toString() {
  return 'SearchSongInfo(id: $id, songName: $songName, singerName: $singerName, fileHash: $fileHash, duration: $duration, image: $image, albumId: $albumId, albumName: $albumName, qualityLevel: $qualityLevel, isOriginal: $isOriginal, fileSize: $fileSize, sqFileHash: $sqFileHash, hqFileHash: $hqFileHash, privilege: $privilege, publishDate: $publishDate, songLabel: $songLabel, fileName: $fileName, mvHash: $mvHash, oriSongName: $oriSongName, otherName: $otherName, suffix: $suffix, singerId: $singerId, singers: $singers, extName: $extName, bitrate: $bitrate, payType: $payType, price: $price, heatLevel: $heatLevel, isPrepublish: $isPrepublish)';
}


}

/// @nodoc
abstract mixin class _$SearchSongInfoCopyWith<$Res> implements $SearchSongInfoCopyWith<$Res> {
  factory _$SearchSongInfoCopyWith(_SearchSongInfo value, $Res Function(_SearchSongInfo) _then) = __$SearchSongInfoCopyWithImpl;
@override @useResult
$Res call({
@IntFromStringConverter()@JsonKey(name: 'ID') int id,@JsonKey(name: 'SongName') String songName,@JsonKey(name: 'SingerName') String singerName,@JsonKey(name: 'FileHash') String fileHash,@IntFromStringConverter()@JsonKey(name: 'Duration') int duration,@JsonKey(name: 'Image') String image,@IntFromStringConverter()@JsonKey(name: 'AlbumID') int albumId,@JsonKey(name: 'AlbumName') String albumName,@IntFromStringConverter()@JsonKey(name: 'QualityLevel') int qualityLevel,@IntFromStringConverter()@JsonKey(name: 'IsOriginal') int isOriginal,@IntFromStringConverter()@JsonKey(name: 'FileSize') int fileSize,@JsonKey(name: 'SQFileHash') String sqFileHash,@JsonKey(name: 'HQFileHash') String hqFileHash,@IntFromStringConverter()@JsonKey(name: 'Privilege') int privilege,@JsonKey(name: 'PublishDate') String publishDate,@JsonKey(name: 'SongLabel') String songLabel,@JsonKey(name: 'FileName') String fileName,@JsonKey(name: 'MvHash') String mvHash,@JsonKey(name: 'OriSongName') String oriSongName,@JsonKey(name: 'OtherName') String otherName,@JsonKey(name: 'Suffix') String suffix,@JsonKey(name: 'SingerId') List<int> singerId,@JsonKey(name: 'Singers') List<SearchSinger> singers,@JsonKey(name: 'ExtName') String extName,@IntFromStringConverter()@JsonKey(name: 'Bitrate') int bitrate,@IntFromStringConverter()@JsonKey(name: 'PayType') int payType,@IntFromStringConverter()@JsonKey(name: 'Price') int price,@IntFromStringConverter()@JsonKey(name: 'HeatLevel') int heatLevel,@IntFromStringConverter()@JsonKey(name: 'isPrepublish') int isPrepublish
});




}
/// @nodoc
class __$SearchSongInfoCopyWithImpl<$Res>
    implements _$SearchSongInfoCopyWith<$Res> {
  __$SearchSongInfoCopyWithImpl(this._self, this._then);

  final _SearchSongInfo _self;
  final $Res Function(_SearchSongInfo) _then;

/// Create a copy of SearchSongInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? songName = null,Object? singerName = null,Object? fileHash = null,Object? duration = null,Object? image = null,Object? albumId = null,Object? albumName = null,Object? qualityLevel = null,Object? isOriginal = null,Object? fileSize = null,Object? sqFileHash = null,Object? hqFileHash = null,Object? privilege = null,Object? publishDate = null,Object? songLabel = null,Object? fileName = null,Object? mvHash = null,Object? oriSongName = null,Object? otherName = null,Object? suffix = null,Object? singerId = null,Object? singers = null,Object? extName = null,Object? bitrate = null,Object? payType = null,Object? price = null,Object? heatLevel = null,Object? isPrepublish = null,}) {
  return _then(_SearchSongInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,songName: null == songName ? _self.songName : songName // ignore: cast_nullable_to_non_nullable
as String,singerName: null == singerName ? _self.singerName : singerName // ignore: cast_nullable_to_non_nullable
as String,fileHash: null == fileHash ? _self.fileHash : fileHash // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,albumId: null == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int,albumName: null == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String,qualityLevel: null == qualityLevel ? _self.qualityLevel : qualityLevel // ignore: cast_nullable_to_non_nullable
as int,isOriginal: null == isOriginal ? _self.isOriginal : isOriginal // ignore: cast_nullable_to_non_nullable
as int,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,sqFileHash: null == sqFileHash ? _self.sqFileHash : sqFileHash // ignore: cast_nullable_to_non_nullable
as String,hqFileHash: null == hqFileHash ? _self.hqFileHash : hqFileHash // ignore: cast_nullable_to_non_nullable
as String,privilege: null == privilege ? _self.privilege : privilege // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,songLabel: null == songLabel ? _self.songLabel : songLabel // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mvHash: null == mvHash ? _self.mvHash : mvHash // ignore: cast_nullable_to_non_nullable
as String,oriSongName: null == oriSongName ? _self.oriSongName : oriSongName // ignore: cast_nullable_to_non_nullable
as String,otherName: null == otherName ? _self.otherName : otherName // ignore: cast_nullable_to_non_nullable
as String,suffix: null == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String,singerId: null == singerId ? _self._singerId : singerId // ignore: cast_nullable_to_non_nullable
as List<int>,singers: null == singers ? _self._singers : singers // ignore: cast_nullable_to_non_nullable
as List<SearchSinger>,extName: null == extName ? _self.extName : extName // ignore: cast_nullable_to_non_nullable
as String,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,payType: null == payType ? _self.payType : payType // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,heatLevel: null == heatLevel ? _self.heatLevel : heatLevel // ignore: cast_nullable_to_non_nullable
as int,isPrepublish: null == isPrepublish ? _self.isPrepublish : isPrepublish // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SearchSinger {

@JsonKey(name: 'name') String get name;@IntFromStringConverter()@JsonKey(name: 'id') int get id;@IntFromStringConverter()@JsonKey(name: 'ip_id') int get ipId;
/// Create a copy of SearchSinger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSingerCopyWith<SearchSinger> get copyWith => _$SearchSingerCopyWithImpl<SearchSinger>(this as SearchSinger, _$identity);

  /// Serializes this SearchSinger to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSinger&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.ipId, ipId) || other.ipId == ipId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id,ipId);

@override
String toString() {
  return 'SearchSinger(name: $name, id: $id, ipId: $ipId)';
}


}

/// @nodoc
abstract mixin class $SearchSingerCopyWith<$Res>  {
  factory $SearchSingerCopyWith(SearchSinger value, $Res Function(SearchSinger) _then) = _$SearchSingerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name,@IntFromStringConverter()@JsonKey(name: 'id') int id,@IntFromStringConverter()@JsonKey(name: 'ip_id') int ipId
});




}
/// @nodoc
class _$SearchSingerCopyWithImpl<$Res>
    implements $SearchSingerCopyWith<$Res> {
  _$SearchSingerCopyWithImpl(this._self, this._then);

  final SearchSinger _self;
  final $Res Function(SearchSinger) _then;

/// Create a copy of SearchSinger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? id = null,Object? ipId = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ipId: null == ipId ? _self.ipId : ipId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSinger].
extension SearchSingerPatterns on SearchSinger {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSinger value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSinger() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSinger value)  $default,){
final _that = this;
switch (_that) {
case _SearchSinger():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSinger value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSinger() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @IntFromStringConverter()@JsonKey(name: 'id')  int id, @IntFromStringConverter()@JsonKey(name: 'ip_id')  int ipId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSinger() when $default != null:
return $default(_that.name,_that.id,_that.ipId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @IntFromStringConverter()@JsonKey(name: 'id')  int id, @IntFromStringConverter()@JsonKey(name: 'ip_id')  int ipId)  $default,) {final _that = this;
switch (_that) {
case _SearchSinger():
return $default(_that.name,_that.id,_that.ipId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String name, @IntFromStringConverter()@JsonKey(name: 'id')  int id, @IntFromStringConverter()@JsonKey(name: 'ip_id')  int ipId)?  $default,) {final _that = this;
switch (_that) {
case _SearchSinger() when $default != null:
return $default(_that.name,_that.id,_that.ipId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSinger implements SearchSinger {
  const _SearchSinger({@JsonKey(name: 'name') this.name = '', @IntFromStringConverter()@JsonKey(name: 'id') this.id = 0, @IntFromStringConverter()@JsonKey(name: 'ip_id') this.ipId = 0});
  factory _SearchSinger.fromJson(Map<String, dynamic> json) => _$SearchSingerFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@IntFromStringConverter()@JsonKey(name: 'id') final  int id;
@override@IntFromStringConverter()@JsonKey(name: 'ip_id') final  int ipId;

/// Create a copy of SearchSinger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSingerCopyWith<_SearchSinger> get copyWith => __$SearchSingerCopyWithImpl<_SearchSinger>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSingerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSinger&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.ipId, ipId) || other.ipId == ipId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,id,ipId);

@override
String toString() {
  return 'SearchSinger(name: $name, id: $id, ipId: $ipId)';
}


}

/// @nodoc
abstract mixin class _$SearchSingerCopyWith<$Res> implements $SearchSingerCopyWith<$Res> {
  factory _$SearchSingerCopyWith(_SearchSinger value, $Res Function(_SearchSinger) _then) = __$SearchSingerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name,@IntFromStringConverter()@JsonKey(name: 'id') int id,@IntFromStringConverter()@JsonKey(name: 'ip_id') int ipId
});




}
/// @nodoc
class __$SearchSingerCopyWithImpl<$Res>
    implements _$SearchSingerCopyWith<$Res> {
  __$SearchSingerCopyWithImpl(this._self, this._then);

  final _SearchSinger _self;
  final $Res Function(_SearchSinger) _then;

/// Create a copy of SearchSinger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? id = null,Object? ipId = null,}) {
  return _then(_SearchSinger(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ipId: null == ipId ? _self.ipId : ipId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

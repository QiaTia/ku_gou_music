// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Song {

 int get songid; String get songname; String get hash;@JsonKey(name: 'author_name') String get authorName;@JsonKey(name: 'album_id') String? get albumId;@JsonKey(name: 'album_name') String? get albumName;@JsonKey(name: 'time_length') int get timeLength;@JsonKey(name: 'publish_date') String get publishDate; List<SingerInfo> get singerinfo; List<Tag> get tags;@JsonKey(name: 'sizable_cover') String get coverUrl;@JsonKey(name: 'file_size') int get fileSize;
/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongCopyWith<Song> get copyWith => _$SongCopyWithImpl<Song>(this as Song, _$identity);

  /// Serializes this Song to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Song&&(identical(other.songid, songid) || other.songid == songid)&&(identical(other.songname, songname) || other.songname == songname)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.timeLength, timeLength) || other.timeLength == timeLength)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&const DeepCollectionEquality().equals(other.singerinfo, singerinfo)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,songid,songname,hash,authorName,albumId,albumName,timeLength,publishDate,const DeepCollectionEquality().hash(singerinfo),const DeepCollectionEquality().hash(tags),coverUrl,fileSize);

@override
String toString() {
  return 'Song(songid: $songid, songname: $songname, hash: $hash, authorName: $authorName, albumId: $albumId, albumName: $albumName, timeLength: $timeLength, publishDate: $publishDate, singerinfo: $singerinfo, tags: $tags, coverUrl: $coverUrl, fileSize: $fileSize)';
}


}

/// @nodoc
abstract mixin class $SongCopyWith<$Res>  {
  factory $SongCopyWith(Song value, $Res Function(Song) _then) = _$SongCopyWithImpl;
@useResult
$Res call({
 int songid, String songname, String hash,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'album_id') String? albumId,@JsonKey(name: 'album_name') String? albumName,@JsonKey(name: 'time_length') int timeLength,@JsonKey(name: 'publish_date') String publishDate, List<SingerInfo> singerinfo, List<Tag> tags,@JsonKey(name: 'sizable_cover') String coverUrl,@JsonKey(name: 'file_size') int fileSize
});




}
/// @nodoc
class _$SongCopyWithImpl<$Res>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._self, this._then);

  final Song _self;
  final $Res Function(Song) _then;

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? songid = null,Object? songname = null,Object? hash = null,Object? authorName = null,Object? albumId = freezed,Object? albumName = freezed,Object? timeLength = null,Object? publishDate = null,Object? singerinfo = null,Object? tags = null,Object? coverUrl = null,Object? fileSize = null,}) {
  return _then(_self.copyWith(
songid: null == songid ? _self.songid : songid // ignore: cast_nullable_to_non_nullable
as int,songname: null == songname ? _self.songname : songname // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,albumId: freezed == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String?,albumName: freezed == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String?,timeLength: null == timeLength ? _self.timeLength : timeLength // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,singerinfo: null == singerinfo ? _self.singerinfo : singerinfo // ignore: cast_nullable_to_non_nullable
as List<SingerInfo>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Song].
extension SongPatterns on Song {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Song value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Song() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Song value)  $default,){
final _that = this;
switch (_that) {
case _Song():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Song value)?  $default,){
final _that = this;
switch (_that) {
case _Song() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int songid,  String songname,  String hash, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'album_id')  String? albumId, @JsonKey(name: 'album_name')  String? albumName, @JsonKey(name: 'time_length')  int timeLength, @JsonKey(name: 'publish_date')  String publishDate,  List<SingerInfo> singerinfo,  List<Tag> tags, @JsonKey(name: 'sizable_cover')  String coverUrl, @JsonKey(name: 'file_size')  int fileSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Song() when $default != null:
return $default(_that.songid,_that.songname,_that.hash,_that.authorName,_that.albumId,_that.albumName,_that.timeLength,_that.publishDate,_that.singerinfo,_that.tags,_that.coverUrl,_that.fileSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int songid,  String songname,  String hash, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'album_id')  String? albumId, @JsonKey(name: 'album_name')  String? albumName, @JsonKey(name: 'time_length')  int timeLength, @JsonKey(name: 'publish_date')  String publishDate,  List<SingerInfo> singerinfo,  List<Tag> tags, @JsonKey(name: 'sizable_cover')  String coverUrl, @JsonKey(name: 'file_size')  int fileSize)  $default,) {final _that = this;
switch (_that) {
case _Song():
return $default(_that.songid,_that.songname,_that.hash,_that.authorName,_that.albumId,_that.albumName,_that.timeLength,_that.publishDate,_that.singerinfo,_that.tags,_that.coverUrl,_that.fileSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int songid,  String songname,  String hash, @JsonKey(name: 'author_name')  String authorName, @JsonKey(name: 'album_id')  String? albumId, @JsonKey(name: 'album_name')  String? albumName, @JsonKey(name: 'time_length')  int timeLength, @JsonKey(name: 'publish_date')  String publishDate,  List<SingerInfo> singerinfo,  List<Tag> tags, @JsonKey(name: 'sizable_cover')  String coverUrl, @JsonKey(name: 'file_size')  int fileSize)?  $default,) {final _that = this;
switch (_that) {
case _Song() when $default != null:
return $default(_that.songid,_that.songname,_that.hash,_that.authorName,_that.albumId,_that.albumName,_that.timeLength,_that.publishDate,_that.singerinfo,_that.tags,_that.coverUrl,_that.fileSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Song implements Song {
  const _Song({required this.songid, required this.songname, required this.hash, @JsonKey(name: 'author_name') required this.authorName, @JsonKey(name: 'album_id') this.albumId, @JsonKey(name: 'album_name') this.albumName, @JsonKey(name: 'time_length') required this.timeLength, @JsonKey(name: 'publish_date') required this.publishDate, final  List<SingerInfo> singerinfo = const [], final  List<Tag> tags = const [], @JsonKey(name: 'sizable_cover') required this.coverUrl, @JsonKey(name: 'file_size') required this.fileSize}): _singerinfo = singerinfo,_tags = tags;
  factory _Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

@override final  int songid;
@override final  String songname;
@override final  String hash;
@override@JsonKey(name: 'author_name') final  String authorName;
@override@JsonKey(name: 'album_id') final  String? albumId;
@override@JsonKey(name: 'album_name') final  String? albumName;
@override@JsonKey(name: 'time_length') final  int timeLength;
@override@JsonKey(name: 'publish_date') final  String publishDate;
 final  List<SingerInfo> _singerinfo;
@override@JsonKey() List<SingerInfo> get singerinfo {
  if (_singerinfo is EqualUnmodifiableListView) return _singerinfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_singerinfo);
}

 final  List<Tag> _tags;
@override@JsonKey() List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'sizable_cover') final  String coverUrl;
@override@JsonKey(name: 'file_size') final  int fileSize;

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SongCopyWith<_Song> get copyWith => __$SongCopyWithImpl<_Song>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SongToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Song&&(identical(other.songid, songid) || other.songid == songid)&&(identical(other.songname, songname) || other.songname == songname)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.albumName, albumName) || other.albumName == albumName)&&(identical(other.timeLength, timeLength) || other.timeLength == timeLength)&&(identical(other.publishDate, publishDate) || other.publishDate == publishDate)&&const DeepCollectionEquality().equals(other._singerinfo, _singerinfo)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,songid,songname,hash,authorName,albumId,albumName,timeLength,publishDate,const DeepCollectionEquality().hash(_singerinfo),const DeepCollectionEquality().hash(_tags),coverUrl,fileSize);

@override
String toString() {
  return 'Song(songid: $songid, songname: $songname, hash: $hash, authorName: $authorName, albumId: $albumId, albumName: $albumName, timeLength: $timeLength, publishDate: $publishDate, singerinfo: $singerinfo, tags: $tags, coverUrl: $coverUrl, fileSize: $fileSize)';
}


}

/// @nodoc
abstract mixin class _$SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$SongCopyWith(_Song value, $Res Function(_Song) _then) = __$SongCopyWithImpl;
@override @useResult
$Res call({
 int songid, String songname, String hash,@JsonKey(name: 'author_name') String authorName,@JsonKey(name: 'album_id') String? albumId,@JsonKey(name: 'album_name') String? albumName,@JsonKey(name: 'time_length') int timeLength,@JsonKey(name: 'publish_date') String publishDate, List<SingerInfo> singerinfo, List<Tag> tags,@JsonKey(name: 'sizable_cover') String coverUrl,@JsonKey(name: 'file_size') int fileSize
});




}
/// @nodoc
class __$SongCopyWithImpl<$Res>
    implements _$SongCopyWith<$Res> {
  __$SongCopyWithImpl(this._self, this._then);

  final _Song _self;
  final $Res Function(_Song) _then;

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? songid = null,Object? songname = null,Object? hash = null,Object? authorName = null,Object? albumId = freezed,Object? albumName = freezed,Object? timeLength = null,Object? publishDate = null,Object? singerinfo = null,Object? tags = null,Object? coverUrl = null,Object? fileSize = null,}) {
  return _then(_Song(
songid: null == songid ? _self.songid : songid // ignore: cast_nullable_to_non_nullable
as int,songname: null == songname ? _self.songname : songname // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,albumId: freezed == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String?,albumName: freezed == albumName ? _self.albumName : albumName // ignore: cast_nullable_to_non_nullable
as String?,timeLength: null == timeLength ? _self.timeLength : timeLength // ignore: cast_nullable_to_non_nullable
as int,publishDate: null == publishDate ? _self.publishDate : publishDate // ignore: cast_nullable_to_non_nullable
as String,singerinfo: null == singerinfo ? _self._singerinfo : singerinfo // ignore: cast_nullable_to_non_nullable
as List<SingerInfo>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

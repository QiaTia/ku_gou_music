// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_album_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchAlbumResponse {

/// 搜索结果列表
@JsonKey(name: 'lists') List<SearchAlbumInfo> get lists;/// 总数量
@IntFromStringConverter()@JsonKey(name: 'total') int get total;/// 当前页码
@IntFromStringConverter()@JsonKey(name: 'page') int get page;/// 每页数量
@IntFromStringConverter()@JsonKey(name: 'pagesize') int get pagesize;
/// Create a copy of SearchAlbumResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchAlbumResponseCopyWith<SearchAlbumResponse> get copyWith => _$SearchAlbumResponseCopyWithImpl<SearchAlbumResponse>(this as SearchAlbumResponse, _$identity);

  /// Serializes this SearchAlbumResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchAlbumResponse&&const DeepCollectionEquality().equals(other.lists, lists)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagesize, pagesize) || other.pagesize == pagesize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lists),total,page,pagesize);

@override
String toString() {
  return 'SearchAlbumResponse(lists: $lists, total: $total, page: $page, pagesize: $pagesize)';
}


}

/// @nodoc
abstract mixin class $SearchAlbumResponseCopyWith<$Res>  {
  factory $SearchAlbumResponseCopyWith(SearchAlbumResponse value, $Res Function(SearchAlbumResponse) _then) = _$SearchAlbumResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lists') List<SearchAlbumInfo> lists,@IntFromStringConverter()@JsonKey(name: 'total') int total,@IntFromStringConverter()@JsonKey(name: 'page') int page,@IntFromStringConverter()@JsonKey(name: 'pagesize') int pagesize
});




}
/// @nodoc
class _$SearchAlbumResponseCopyWithImpl<$Res>
    implements $SearchAlbumResponseCopyWith<$Res> {
  _$SearchAlbumResponseCopyWithImpl(this._self, this._then);

  final SearchAlbumResponse _self;
  final $Res Function(SearchAlbumResponse) _then;

/// Create a copy of SearchAlbumResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lists = null,Object? total = null,Object? page = null,Object? pagesize = null,}) {
  return _then(_self.copyWith(
lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as List<SearchAlbumInfo>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pagesize: null == pagesize ? _self.pagesize : pagesize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchAlbumResponse].
extension SearchAlbumResponsePatterns on SearchAlbumResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchAlbumResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchAlbumResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchAlbumResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchAlbumResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchAlbumResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchAlbumResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lists')  List<SearchAlbumInfo> lists, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @IntFromStringConverter()@JsonKey(name: 'page')  int page, @IntFromStringConverter()@JsonKey(name: 'pagesize')  int pagesize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchAlbumResponse() when $default != null:
return $default(_that.lists,_that.total,_that.page,_that.pagesize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lists')  List<SearchAlbumInfo> lists, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @IntFromStringConverter()@JsonKey(name: 'page')  int page, @IntFromStringConverter()@JsonKey(name: 'pagesize')  int pagesize)  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumResponse():
return $default(_that.lists,_that.total,_that.page,_that.pagesize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lists')  List<SearchAlbumInfo> lists, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @IntFromStringConverter()@JsonKey(name: 'page')  int page, @IntFromStringConverter()@JsonKey(name: 'pagesize')  int pagesize)?  $default,) {final _that = this;
switch (_that) {
case _SearchAlbumResponse() when $default != null:
return $default(_that.lists,_that.total,_that.page,_that.pagesize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchAlbumResponse implements SearchAlbumResponse {
  const _SearchAlbumResponse({@JsonKey(name: 'lists') final  List<SearchAlbumInfo> lists = const [], @IntFromStringConverter()@JsonKey(name: 'total') this.total = 0, @IntFromStringConverter()@JsonKey(name: 'page') this.page = 1, @IntFromStringConverter()@JsonKey(name: 'pagesize') this.pagesize = 30}): _lists = lists;
  factory _SearchAlbumResponse.fromJson(Map<String, dynamic> json) => _$SearchAlbumResponseFromJson(json);

/// 搜索结果列表
 final  List<SearchAlbumInfo> _lists;
/// 搜索结果列表
@override@JsonKey(name: 'lists') List<SearchAlbumInfo> get lists {
  if (_lists is EqualUnmodifiableListView) return _lists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lists);
}

/// 总数量
@override@IntFromStringConverter()@JsonKey(name: 'total') final  int total;
/// 当前页码
@override@IntFromStringConverter()@JsonKey(name: 'page') final  int page;
/// 每页数量
@override@IntFromStringConverter()@JsonKey(name: 'pagesize') final  int pagesize;

/// Create a copy of SearchAlbumResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchAlbumResponseCopyWith<_SearchAlbumResponse> get copyWith => __$SearchAlbumResponseCopyWithImpl<_SearchAlbumResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchAlbumResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchAlbumResponse&&const DeepCollectionEquality().equals(other._lists, _lists)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagesize, pagesize) || other.pagesize == pagesize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lists),total,page,pagesize);

@override
String toString() {
  return 'SearchAlbumResponse(lists: $lists, total: $total, page: $page, pagesize: $pagesize)';
}


}

/// @nodoc
abstract mixin class _$SearchAlbumResponseCopyWith<$Res> implements $SearchAlbumResponseCopyWith<$Res> {
  factory _$SearchAlbumResponseCopyWith(_SearchAlbumResponse value, $Res Function(_SearchAlbumResponse) _then) = __$SearchAlbumResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lists') List<SearchAlbumInfo> lists,@IntFromStringConverter()@JsonKey(name: 'total') int total,@IntFromStringConverter()@JsonKey(name: 'page') int page,@IntFromStringConverter()@JsonKey(name: 'pagesize') int pagesize
});




}
/// @nodoc
class __$SearchAlbumResponseCopyWithImpl<$Res>
    implements _$SearchAlbumResponseCopyWith<$Res> {
  __$SearchAlbumResponseCopyWithImpl(this._self, this._then);

  final _SearchAlbumResponse _self;
  final $Res Function(_SearchAlbumResponse) _then;

/// Create a copy of SearchAlbumResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lists = null,Object? total = null,Object? page = null,Object? pagesize = null,}) {
  return _then(_SearchAlbumResponse(
lists: null == lists ? _self._lists : lists // ignore: cast_nullable_to_non_nullable
as List<SearchAlbumInfo>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pagesize: null == pagesize ? _self.pagesize : pagesize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

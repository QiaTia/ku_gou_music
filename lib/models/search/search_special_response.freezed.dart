// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_special_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchSpecialResponse {

/// 搜索结果列表
@JsonKey(name: 'lists') List<SearchSpecialInfo> get lists;/// 总数量
@IntFromStringConverter()@JsonKey(name: 'total') int get total;/// 当前页码
@IntFromStringConverter()@JsonKey(name: 'page') int get page;/// 每页数量
@IntFromStringConverter()@JsonKey(name: 'pagesize') int get pagesize;
/// Create a copy of SearchSpecialResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSpecialResponseCopyWith<SearchSpecialResponse> get copyWith => _$SearchSpecialResponseCopyWithImpl<SearchSpecialResponse>(this as SearchSpecialResponse, _$identity);

  /// Serializes this SearchSpecialResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSpecialResponse&&const DeepCollectionEquality().equals(other.lists, lists)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagesize, pagesize) || other.pagesize == pagesize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lists),total,page,pagesize);

@override
String toString() {
  return 'SearchSpecialResponse(lists: $lists, total: $total, page: $page, pagesize: $pagesize)';
}


}

/// @nodoc
abstract mixin class $SearchSpecialResponseCopyWith<$Res>  {
  factory $SearchSpecialResponseCopyWith(SearchSpecialResponse value, $Res Function(SearchSpecialResponse) _then) = _$SearchSpecialResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lists') List<SearchSpecialInfo> lists,@IntFromStringConverter()@JsonKey(name: 'total') int total,@IntFromStringConverter()@JsonKey(name: 'page') int page,@IntFromStringConverter()@JsonKey(name: 'pagesize') int pagesize
});




}
/// @nodoc
class _$SearchSpecialResponseCopyWithImpl<$Res>
    implements $SearchSpecialResponseCopyWith<$Res> {
  _$SearchSpecialResponseCopyWithImpl(this._self, this._then);

  final SearchSpecialResponse _self;
  final $Res Function(SearchSpecialResponse) _then;

/// Create a copy of SearchSpecialResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lists = null,Object? total = null,Object? page = null,Object? pagesize = null,}) {
  return _then(_self.copyWith(
lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as List<SearchSpecialInfo>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pagesize: null == pagesize ? _self.pagesize : pagesize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSpecialResponse].
extension SearchSpecialResponsePatterns on SearchSpecialResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSpecialResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSpecialResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSpecialResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchSpecialResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSpecialResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSpecialResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lists')  List<SearchSpecialInfo> lists, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @IntFromStringConverter()@JsonKey(name: 'page')  int page, @IntFromStringConverter()@JsonKey(name: 'pagesize')  int pagesize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSpecialResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lists')  List<SearchSpecialInfo> lists, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @IntFromStringConverter()@JsonKey(name: 'page')  int page, @IntFromStringConverter()@JsonKey(name: 'pagesize')  int pagesize)  $default,) {final _that = this;
switch (_that) {
case _SearchSpecialResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lists')  List<SearchSpecialInfo> lists, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @IntFromStringConverter()@JsonKey(name: 'page')  int page, @IntFromStringConverter()@JsonKey(name: 'pagesize')  int pagesize)?  $default,) {final _that = this;
switch (_that) {
case _SearchSpecialResponse() when $default != null:
return $default(_that.lists,_that.total,_that.page,_that.pagesize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSpecialResponse implements SearchSpecialResponse {
  const _SearchSpecialResponse({@JsonKey(name: 'lists') final  List<SearchSpecialInfo> lists = const [], @IntFromStringConverter()@JsonKey(name: 'total') this.total = 0, @IntFromStringConverter()@JsonKey(name: 'page') this.page = 1, @IntFromStringConverter()@JsonKey(name: 'pagesize') this.pagesize = 30}): _lists = lists;
  factory _SearchSpecialResponse.fromJson(Map<String, dynamic> json) => _$SearchSpecialResponseFromJson(json);

/// 搜索结果列表
 final  List<SearchSpecialInfo> _lists;
/// 搜索结果列表
@override@JsonKey(name: 'lists') List<SearchSpecialInfo> get lists {
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

/// Create a copy of SearchSpecialResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSpecialResponseCopyWith<_SearchSpecialResponse> get copyWith => __$SearchSpecialResponseCopyWithImpl<_SearchSpecialResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSpecialResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSpecialResponse&&const DeepCollectionEquality().equals(other._lists, _lists)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagesize, pagesize) || other.pagesize == pagesize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lists),total,page,pagesize);

@override
String toString() {
  return 'SearchSpecialResponse(lists: $lists, total: $total, page: $page, pagesize: $pagesize)';
}


}

/// @nodoc
abstract mixin class _$SearchSpecialResponseCopyWith<$Res> implements $SearchSpecialResponseCopyWith<$Res> {
  factory _$SearchSpecialResponseCopyWith(_SearchSpecialResponse value, $Res Function(_SearchSpecialResponse) _then) = __$SearchSpecialResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lists') List<SearchSpecialInfo> lists,@IntFromStringConverter()@JsonKey(name: 'total') int total,@IntFromStringConverter()@JsonKey(name: 'page') int page,@IntFromStringConverter()@JsonKey(name: 'pagesize') int pagesize
});




}
/// @nodoc
class __$SearchSpecialResponseCopyWithImpl<$Res>
    implements _$SearchSpecialResponseCopyWith<$Res> {
  __$SearchSpecialResponseCopyWithImpl(this._self, this._then);

  final _SearchSpecialResponse _self;
  final $Res Function(_SearchSpecialResponse) _then;

/// Create a copy of SearchSpecialResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lists = null,Object? total = null,Object? page = null,Object? pagesize = null,}) {
  return _then(_SearchSpecialResponse(
lists: null == lists ? _self._lists : lists // ignore: cast_nullable_to_non_nullable
as List<SearchSpecialInfo>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pagesize: null == pagesize ? _self.pagesize : pagesize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

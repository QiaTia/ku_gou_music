// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_complex_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchComplexResponse {

/// 所有搜索结果分组
@JsonKey(name: 'lists') List<SearchComplexGroup> get lists;/// 搜索提示
@JsonKey(name: 'correctiontip') String get correctionTip;
/// Create a copy of SearchComplexResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchComplexResponseCopyWith<SearchComplexResponse> get copyWith => _$SearchComplexResponseCopyWithImpl<SearchComplexResponse>(this as SearchComplexResponse, _$identity);

  /// Serializes this SearchComplexResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchComplexResponse&&const DeepCollectionEquality().equals(other.lists, lists)&&(identical(other.correctionTip, correctionTip) || other.correctionTip == correctionTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lists),correctionTip);

@override
String toString() {
  return 'SearchComplexResponse(lists: $lists, correctionTip: $correctionTip)';
}


}

/// @nodoc
abstract mixin class $SearchComplexResponseCopyWith<$Res>  {
  factory $SearchComplexResponseCopyWith(SearchComplexResponse value, $Res Function(SearchComplexResponse) _then) = _$SearchComplexResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'lists') List<SearchComplexGroup> lists,@JsonKey(name: 'correctiontip') String correctionTip
});




}
/// @nodoc
class _$SearchComplexResponseCopyWithImpl<$Res>
    implements $SearchComplexResponseCopyWith<$Res> {
  _$SearchComplexResponseCopyWithImpl(this._self, this._then);

  final SearchComplexResponse _self;
  final $Res Function(SearchComplexResponse) _then;

/// Create a copy of SearchComplexResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lists = null,Object? correctionTip = null,}) {
  return _then(_self.copyWith(
lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as List<SearchComplexGroup>,correctionTip: null == correctionTip ? _self.correctionTip : correctionTip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchComplexResponse].
extension SearchComplexResponsePatterns on SearchComplexResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchComplexResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchComplexResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchComplexResponse value)  $default,){
final _that = this;
switch (_that) {
case _SearchComplexResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchComplexResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SearchComplexResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'lists')  List<SearchComplexGroup> lists, @JsonKey(name: 'correctiontip')  String correctionTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchComplexResponse() when $default != null:
return $default(_that.lists,_that.correctionTip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'lists')  List<SearchComplexGroup> lists, @JsonKey(name: 'correctiontip')  String correctionTip)  $default,) {final _that = this;
switch (_that) {
case _SearchComplexResponse():
return $default(_that.lists,_that.correctionTip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'lists')  List<SearchComplexGroup> lists, @JsonKey(name: 'correctiontip')  String correctionTip)?  $default,) {final _that = this;
switch (_that) {
case _SearchComplexResponse() when $default != null:
return $default(_that.lists,_that.correctionTip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchComplexResponse implements SearchComplexResponse {
  const _SearchComplexResponse({@JsonKey(name: 'lists') final  List<SearchComplexGroup> lists = const [], @JsonKey(name: 'correctiontip') this.correctionTip = ''}): _lists = lists;
  factory _SearchComplexResponse.fromJson(Map<String, dynamic> json) => _$SearchComplexResponseFromJson(json);

/// 所有搜索结果分组
 final  List<SearchComplexGroup> _lists;
/// 所有搜索结果分组
@override@JsonKey(name: 'lists') List<SearchComplexGroup> get lists {
  if (_lists is EqualUnmodifiableListView) return _lists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lists);
}

/// 搜索提示
@override@JsonKey(name: 'correctiontip') final  String correctionTip;

/// Create a copy of SearchComplexResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchComplexResponseCopyWith<_SearchComplexResponse> get copyWith => __$SearchComplexResponseCopyWithImpl<_SearchComplexResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchComplexResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchComplexResponse&&const DeepCollectionEquality().equals(other._lists, _lists)&&(identical(other.correctionTip, correctionTip) || other.correctionTip == correctionTip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lists),correctionTip);

@override
String toString() {
  return 'SearchComplexResponse(lists: $lists, correctionTip: $correctionTip)';
}


}

/// @nodoc
abstract mixin class _$SearchComplexResponseCopyWith<$Res> implements $SearchComplexResponseCopyWith<$Res> {
  factory _$SearchComplexResponseCopyWith(_SearchComplexResponse value, $Res Function(_SearchComplexResponse) _then) = __$SearchComplexResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'lists') List<SearchComplexGroup> lists,@JsonKey(name: 'correctiontip') String correctionTip
});




}
/// @nodoc
class __$SearchComplexResponseCopyWithImpl<$Res>
    implements _$SearchComplexResponseCopyWith<$Res> {
  __$SearchComplexResponseCopyWithImpl(this._self, this._then);

  final _SearchComplexResponse _self;
  final $Res Function(_SearchComplexResponse) _then;

/// Create a copy of SearchComplexResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lists = null,Object? correctionTip = null,}) {
  return _then(_SearchComplexResponse(
lists: null == lists ? _self._lists : lists // ignore: cast_nullable_to_non_nullable
as List<SearchComplexGroup>,correctionTip: null == correctionTip ? _self.correctionTip : correctionTip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SearchComplexGroup {

/// 类型：song/mv/collect/album/author/ksong/program/talent/othersearch/similar/applet/musicphoto
@JsonKey(name: 'type') String get type;/// 该类型总数量
@IntFromStringConverter()@JsonKey(name: 'total') int get total;/// 搜索结果列表（原始数据，根据type解析）
@JsonKey(name: 'lists') List<dynamic> get lists;/// 是否允许错误
@IntFromStringConverter()@JsonKey(name: 'allowerr') int get allowErr;/// 是否共享结果
@IntFromStringConverter()@JsonKey(name: 'isshareresult') int get isShareResult;/// 索引
@IntFromStringConverter()@JsonKey(name: 'index') int get index;/// 标签信息（部分类型有）
@JsonKey(name: 'sectag_info') Map<String, dynamic> get secTagInfo;/// 是否标签结果
@IntFromStringConverter()@JsonKey(name: 'istagresult') int get isTagResult;/// 是否标签
@IntFromStringConverter()@JsonKey(name: 'istag') int get isTag;/// 聚合信息（部分类型有）
@JsonKey(name: 'sec_aggre') List<dynamic> get secAggre;/// 聚合信息v2（部分类型有）
@JsonKey(name: 'sec_aggre_v2') List<dynamic> get secAggreV2;/// 主题信息（collect类型有）
@JsonKey(name: 'theme') Map<String, dynamic> get theme;/// hash（similar类型有）
@JsonKey(name: 'hash') String get hash;/// 标题（musicphoto类型有）
@JsonKey(name: 'title') String get title;
/// Create a copy of SearchComplexGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchComplexGroupCopyWith<SearchComplexGroup> get copyWith => _$SearchComplexGroupCopyWithImpl<SearchComplexGroup>(this as SearchComplexGroup, _$identity);

  /// Serializes this SearchComplexGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchComplexGroup&&(identical(other.type, type) || other.type == type)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.lists, lists)&&(identical(other.allowErr, allowErr) || other.allowErr == allowErr)&&(identical(other.isShareResult, isShareResult) || other.isShareResult == isShareResult)&&(identical(other.index, index) || other.index == index)&&const DeepCollectionEquality().equals(other.secTagInfo, secTagInfo)&&(identical(other.isTagResult, isTagResult) || other.isTagResult == isTagResult)&&(identical(other.isTag, isTag) || other.isTag == isTag)&&const DeepCollectionEquality().equals(other.secAggre, secAggre)&&const DeepCollectionEquality().equals(other.secAggreV2, secAggreV2)&&const DeepCollectionEquality().equals(other.theme, theme)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,total,const DeepCollectionEquality().hash(lists),allowErr,isShareResult,index,const DeepCollectionEquality().hash(secTagInfo),isTagResult,isTag,const DeepCollectionEquality().hash(secAggre),const DeepCollectionEquality().hash(secAggreV2),const DeepCollectionEquality().hash(theme),hash,title);

@override
String toString() {
  return 'SearchComplexGroup(type: $type, total: $total, lists: $lists, allowErr: $allowErr, isShareResult: $isShareResult, index: $index, secTagInfo: $secTagInfo, isTagResult: $isTagResult, isTag: $isTag, secAggre: $secAggre, secAggreV2: $secAggreV2, theme: $theme, hash: $hash, title: $title)';
}


}

/// @nodoc
abstract mixin class $SearchComplexGroupCopyWith<$Res>  {
  factory $SearchComplexGroupCopyWith(SearchComplexGroup value, $Res Function(SearchComplexGroup) _then) = _$SearchComplexGroupCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'type') String type,@IntFromStringConverter()@JsonKey(name: 'total') int total,@JsonKey(name: 'lists') List<dynamic> lists,@IntFromStringConverter()@JsonKey(name: 'allowerr') int allowErr,@IntFromStringConverter()@JsonKey(name: 'isshareresult') int isShareResult,@IntFromStringConverter()@JsonKey(name: 'index') int index,@JsonKey(name: 'sectag_info') Map<String, dynamic> secTagInfo,@IntFromStringConverter()@JsonKey(name: 'istagresult') int isTagResult,@IntFromStringConverter()@JsonKey(name: 'istag') int isTag,@JsonKey(name: 'sec_aggre') List<dynamic> secAggre,@JsonKey(name: 'sec_aggre_v2') List<dynamic> secAggreV2,@JsonKey(name: 'theme') Map<String, dynamic> theme,@JsonKey(name: 'hash') String hash,@JsonKey(name: 'title') String title
});




}
/// @nodoc
class _$SearchComplexGroupCopyWithImpl<$Res>
    implements $SearchComplexGroupCopyWith<$Res> {
  _$SearchComplexGroupCopyWithImpl(this._self, this._then);

  final SearchComplexGroup _self;
  final $Res Function(SearchComplexGroup) _then;

/// Create a copy of SearchComplexGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? total = null,Object? lists = null,Object? allowErr = null,Object? isShareResult = null,Object? index = null,Object? secTagInfo = null,Object? isTagResult = null,Object? isTag = null,Object? secAggre = null,Object? secAggreV2 = null,Object? theme = null,Object? hash = null,Object? title = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lists: null == lists ? _self.lists : lists // ignore: cast_nullable_to_non_nullable
as List<dynamic>,allowErr: null == allowErr ? _self.allowErr : allowErr // ignore: cast_nullable_to_non_nullable
as int,isShareResult: null == isShareResult ? _self.isShareResult : isShareResult // ignore: cast_nullable_to_non_nullable
as int,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,secTagInfo: null == secTagInfo ? _self.secTagInfo : secTagInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isTagResult: null == isTagResult ? _self.isTagResult : isTagResult // ignore: cast_nullable_to_non_nullable
as int,isTag: null == isTag ? _self.isTag : isTag // ignore: cast_nullable_to_non_nullable
as int,secAggre: null == secAggre ? _self.secAggre : secAggre // ignore: cast_nullable_to_non_nullable
as List<dynamic>,secAggreV2: null == secAggreV2 ? _self.secAggreV2 : secAggreV2 // ignore: cast_nullable_to_non_nullable
as List<dynamic>,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchComplexGroup].
extension SearchComplexGroupPatterns on SearchComplexGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchComplexGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchComplexGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchComplexGroup value)  $default,){
final _that = this;
switch (_that) {
case _SearchComplexGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchComplexGroup value)?  $default,){
final _that = this;
switch (_that) {
case _SearchComplexGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String type, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @JsonKey(name: 'lists')  List<dynamic> lists, @IntFromStringConverter()@JsonKey(name: 'allowerr')  int allowErr, @IntFromStringConverter()@JsonKey(name: 'isshareresult')  int isShareResult, @IntFromStringConverter()@JsonKey(name: 'index')  int index, @JsonKey(name: 'sectag_info')  Map<String, dynamic> secTagInfo, @IntFromStringConverter()@JsonKey(name: 'istagresult')  int isTagResult, @IntFromStringConverter()@JsonKey(name: 'istag')  int isTag, @JsonKey(name: 'sec_aggre')  List<dynamic> secAggre, @JsonKey(name: 'sec_aggre_v2')  List<dynamic> secAggreV2, @JsonKey(name: 'theme')  Map<String, dynamic> theme, @JsonKey(name: 'hash')  String hash, @JsonKey(name: 'title')  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchComplexGroup() when $default != null:
return $default(_that.type,_that.total,_that.lists,_that.allowErr,_that.isShareResult,_that.index,_that.secTagInfo,_that.isTagResult,_that.isTag,_that.secAggre,_that.secAggreV2,_that.theme,_that.hash,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'type')  String type, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @JsonKey(name: 'lists')  List<dynamic> lists, @IntFromStringConverter()@JsonKey(name: 'allowerr')  int allowErr, @IntFromStringConverter()@JsonKey(name: 'isshareresult')  int isShareResult, @IntFromStringConverter()@JsonKey(name: 'index')  int index, @JsonKey(name: 'sectag_info')  Map<String, dynamic> secTagInfo, @IntFromStringConverter()@JsonKey(name: 'istagresult')  int isTagResult, @IntFromStringConverter()@JsonKey(name: 'istag')  int isTag, @JsonKey(name: 'sec_aggre')  List<dynamic> secAggre, @JsonKey(name: 'sec_aggre_v2')  List<dynamic> secAggreV2, @JsonKey(name: 'theme')  Map<String, dynamic> theme, @JsonKey(name: 'hash')  String hash, @JsonKey(name: 'title')  String title)  $default,) {final _that = this;
switch (_that) {
case _SearchComplexGroup():
return $default(_that.type,_that.total,_that.lists,_that.allowErr,_that.isShareResult,_that.index,_that.secTagInfo,_that.isTagResult,_that.isTag,_that.secAggre,_that.secAggreV2,_that.theme,_that.hash,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'type')  String type, @IntFromStringConverter()@JsonKey(name: 'total')  int total, @JsonKey(name: 'lists')  List<dynamic> lists, @IntFromStringConverter()@JsonKey(name: 'allowerr')  int allowErr, @IntFromStringConverter()@JsonKey(name: 'isshareresult')  int isShareResult, @IntFromStringConverter()@JsonKey(name: 'index')  int index, @JsonKey(name: 'sectag_info')  Map<String, dynamic> secTagInfo, @IntFromStringConverter()@JsonKey(name: 'istagresult')  int isTagResult, @IntFromStringConverter()@JsonKey(name: 'istag')  int isTag, @JsonKey(name: 'sec_aggre')  List<dynamic> secAggre, @JsonKey(name: 'sec_aggre_v2')  List<dynamic> secAggreV2, @JsonKey(name: 'theme')  Map<String, dynamic> theme, @JsonKey(name: 'hash')  String hash, @JsonKey(name: 'title')  String title)?  $default,) {final _that = this;
switch (_that) {
case _SearchComplexGroup() when $default != null:
return $default(_that.type,_that.total,_that.lists,_that.allowErr,_that.isShareResult,_that.index,_that.secTagInfo,_that.isTagResult,_that.isTag,_that.secAggre,_that.secAggreV2,_that.theme,_that.hash,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchComplexGroup implements SearchComplexGroup {
  const _SearchComplexGroup({@JsonKey(name: 'type') this.type = '', @IntFromStringConverter()@JsonKey(name: 'total') this.total = 0, @JsonKey(name: 'lists') final  List<dynamic> lists = const [], @IntFromStringConverter()@JsonKey(name: 'allowerr') this.allowErr = 0, @IntFromStringConverter()@JsonKey(name: 'isshareresult') this.isShareResult = 0, @IntFromStringConverter()@JsonKey(name: 'index') this.index = 0, @JsonKey(name: 'sectag_info') final  Map<String, dynamic> secTagInfo = const {}, @IntFromStringConverter()@JsonKey(name: 'istagresult') this.isTagResult = 0, @IntFromStringConverter()@JsonKey(name: 'istag') this.isTag = 0, @JsonKey(name: 'sec_aggre') final  List<dynamic> secAggre = const [], @JsonKey(name: 'sec_aggre_v2') final  List<dynamic> secAggreV2 = const [], @JsonKey(name: 'theme') final  Map<String, dynamic> theme = const {}, @JsonKey(name: 'hash') this.hash = '', @JsonKey(name: 'title') this.title = ''}): _lists = lists,_secTagInfo = secTagInfo,_secAggre = secAggre,_secAggreV2 = secAggreV2,_theme = theme;
  factory _SearchComplexGroup.fromJson(Map<String, dynamic> json) => _$SearchComplexGroupFromJson(json);

/// 类型：song/mv/collect/album/author/ksong/program/talent/othersearch/similar/applet/musicphoto
@override@JsonKey(name: 'type') final  String type;
/// 该类型总数量
@override@IntFromStringConverter()@JsonKey(name: 'total') final  int total;
/// 搜索结果列表（原始数据，根据type解析）
 final  List<dynamic> _lists;
/// 搜索结果列表（原始数据，根据type解析）
@override@JsonKey(name: 'lists') List<dynamic> get lists {
  if (_lists is EqualUnmodifiableListView) return _lists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lists);
}

/// 是否允许错误
@override@IntFromStringConverter()@JsonKey(name: 'allowerr') final  int allowErr;
/// 是否共享结果
@override@IntFromStringConverter()@JsonKey(name: 'isshareresult') final  int isShareResult;
/// 索引
@override@IntFromStringConverter()@JsonKey(name: 'index') final  int index;
/// 标签信息（部分类型有）
 final  Map<String, dynamic> _secTagInfo;
/// 标签信息（部分类型有）
@override@JsonKey(name: 'sectag_info') Map<String, dynamic> get secTagInfo {
  if (_secTagInfo is EqualUnmodifiableMapView) return _secTagInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_secTagInfo);
}

/// 是否标签结果
@override@IntFromStringConverter()@JsonKey(name: 'istagresult') final  int isTagResult;
/// 是否标签
@override@IntFromStringConverter()@JsonKey(name: 'istag') final  int isTag;
/// 聚合信息（部分类型有）
 final  List<dynamic> _secAggre;
/// 聚合信息（部分类型有）
@override@JsonKey(name: 'sec_aggre') List<dynamic> get secAggre {
  if (_secAggre is EqualUnmodifiableListView) return _secAggre;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secAggre);
}

/// 聚合信息v2（部分类型有）
 final  List<dynamic> _secAggreV2;
/// 聚合信息v2（部分类型有）
@override@JsonKey(name: 'sec_aggre_v2') List<dynamic> get secAggreV2 {
  if (_secAggreV2 is EqualUnmodifiableListView) return _secAggreV2;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_secAggreV2);
}

/// 主题信息（collect类型有）
 final  Map<String, dynamic> _theme;
/// 主题信息（collect类型有）
@override@JsonKey(name: 'theme') Map<String, dynamic> get theme {
  if (_theme is EqualUnmodifiableMapView) return _theme;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_theme);
}

/// hash（similar类型有）
@override@JsonKey(name: 'hash') final  String hash;
/// 标题（musicphoto类型有）
@override@JsonKey(name: 'title') final  String title;

/// Create a copy of SearchComplexGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchComplexGroupCopyWith<_SearchComplexGroup> get copyWith => __$SearchComplexGroupCopyWithImpl<_SearchComplexGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchComplexGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchComplexGroup&&(identical(other.type, type) || other.type == type)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other._lists, _lists)&&(identical(other.allowErr, allowErr) || other.allowErr == allowErr)&&(identical(other.isShareResult, isShareResult) || other.isShareResult == isShareResult)&&(identical(other.index, index) || other.index == index)&&const DeepCollectionEquality().equals(other._secTagInfo, _secTagInfo)&&(identical(other.isTagResult, isTagResult) || other.isTagResult == isTagResult)&&(identical(other.isTag, isTag) || other.isTag == isTag)&&const DeepCollectionEquality().equals(other._secAggre, _secAggre)&&const DeepCollectionEquality().equals(other._secAggreV2, _secAggreV2)&&const DeepCollectionEquality().equals(other._theme, _theme)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,total,const DeepCollectionEquality().hash(_lists),allowErr,isShareResult,index,const DeepCollectionEquality().hash(_secTagInfo),isTagResult,isTag,const DeepCollectionEquality().hash(_secAggre),const DeepCollectionEquality().hash(_secAggreV2),const DeepCollectionEquality().hash(_theme),hash,title);

@override
String toString() {
  return 'SearchComplexGroup(type: $type, total: $total, lists: $lists, allowErr: $allowErr, isShareResult: $isShareResult, index: $index, secTagInfo: $secTagInfo, isTagResult: $isTagResult, isTag: $isTag, secAggre: $secAggre, secAggreV2: $secAggreV2, theme: $theme, hash: $hash, title: $title)';
}


}

/// @nodoc
abstract mixin class _$SearchComplexGroupCopyWith<$Res> implements $SearchComplexGroupCopyWith<$Res> {
  factory _$SearchComplexGroupCopyWith(_SearchComplexGroup value, $Res Function(_SearchComplexGroup) _then) = __$SearchComplexGroupCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'type') String type,@IntFromStringConverter()@JsonKey(name: 'total') int total,@JsonKey(name: 'lists') List<dynamic> lists,@IntFromStringConverter()@JsonKey(name: 'allowerr') int allowErr,@IntFromStringConverter()@JsonKey(name: 'isshareresult') int isShareResult,@IntFromStringConverter()@JsonKey(name: 'index') int index,@JsonKey(name: 'sectag_info') Map<String, dynamic> secTagInfo,@IntFromStringConverter()@JsonKey(name: 'istagresult') int isTagResult,@IntFromStringConverter()@JsonKey(name: 'istag') int isTag,@JsonKey(name: 'sec_aggre') List<dynamic> secAggre,@JsonKey(name: 'sec_aggre_v2') List<dynamic> secAggreV2,@JsonKey(name: 'theme') Map<String, dynamic> theme,@JsonKey(name: 'hash') String hash,@JsonKey(name: 'title') String title
});




}
/// @nodoc
class __$SearchComplexGroupCopyWithImpl<$Res>
    implements _$SearchComplexGroupCopyWith<$Res> {
  __$SearchComplexGroupCopyWithImpl(this._self, this._then);

  final _SearchComplexGroup _self;
  final $Res Function(_SearchComplexGroup) _then;

/// Create a copy of SearchComplexGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? total = null,Object? lists = null,Object? allowErr = null,Object? isShareResult = null,Object? index = null,Object? secTagInfo = null,Object? isTagResult = null,Object? isTag = null,Object? secAggre = null,Object? secAggreV2 = null,Object? theme = null,Object? hash = null,Object? title = null,}) {
  return _then(_SearchComplexGroup(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lists: null == lists ? _self._lists : lists // ignore: cast_nullable_to_non_nullable
as List<dynamic>,allowErr: null == allowErr ? _self.allowErr : allowErr // ignore: cast_nullable_to_non_nullable
as int,isShareResult: null == isShareResult ? _self.isShareResult : isShareResult // ignore: cast_nullable_to_non_nullable
as int,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,secTagInfo: null == secTagInfo ? _self._secTagInfo : secTagInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isTagResult: null == isTagResult ? _self.isTagResult : isTagResult // ignore: cast_nullable_to_non_nullable
as int,isTag: null == isTag ? _self.isTag : isTag // ignore: cast_nullable_to_non_nullable
as int,secAggre: null == secAggre ? _self._secAggre : secAggre // ignore: cast_nullable_to_non_nullable
as List<dynamic>,secAggreV2: null == secAggreV2 ? _self._secAggreV2 : secAggreV2 // ignore: cast_nullable_to_non_nullable
as List<dynamic>,theme: null == theme ? _self._theme : theme // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

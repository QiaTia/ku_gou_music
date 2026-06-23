// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knock_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KnockInfo _$KnockInfoFromJson(Map<String, dynamic> json) => _KnockInfo(
  userid: json['userid'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['userid']),
  pic: json['pic'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  addtime: json['addtime'] == null
      ? 0
      : const IntFromStringConverter().fromJson(json['addtime']),
);

Map<String, dynamic> _$KnockInfoToJson(_KnockInfo instance) =>
    <String, dynamic>{
      'userid': const IntFromStringConverter().toJson(instance.userid),
      'pic': instance.pic,
      'nickname': instance.nickname,
      'addtime': const IntFromStringConverter().toJson(instance.addtime),
    };

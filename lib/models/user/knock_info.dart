// models/knock_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../converters/int_from_string_converter.dart';
part 'knock_info.freezed.dart';
part 'knock_info.g.dart';

@freezed
abstract class KnockInfo with _$KnockInfo {
  const factory KnockInfo({
    @IntFromStringConverter() @Default(0) int userid,
    @Default('') String pic,
    @Default('') String nickname,
    @IntFromStringConverter() @Default(0) int addtime,
  }) = _KnockInfo;

  factory KnockInfo.fromJson(Map<String, dynamic> json) =>
      _$KnockInfoFromJson(json);
}

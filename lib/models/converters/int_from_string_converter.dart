import 'package:freezed_annotation/freezed_annotation.dart';

/// 兼容后端返回 int / String / double,统一转成 int
class IntFromStringConverter implements JsonConverter<int, dynamic> {
  const IntFromStringConverter();
  @override
  int fromJson(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      return int.tryParse(value) ?? double.tryParse(value)?.toInt() ?? 0;
    }
    return 0;
  }

  @override
  dynamic toJson(int value) => value;
}

int pase2Int(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) {
    return int.tryParse(value) ?? double.tryParse(value)?.toInt() ?? 0;
  }
  return 0;
}

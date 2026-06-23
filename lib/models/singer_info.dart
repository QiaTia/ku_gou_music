// models/singer_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'singer_info.freezed.dart';
part 'singer_info.g.dart';

@freezed
abstract class SingerInfo with _$SingerInfo {
  const factory SingerInfo({
    required String name,
    @JsonKey(name: 'is_publish') required int isPublish,
    required Object id,
  }) = _SingerInfo;

  factory SingerInfo.fromJson(Map<String, dynamic> json) =>
      _$SingerInfoFromJson(json);
}

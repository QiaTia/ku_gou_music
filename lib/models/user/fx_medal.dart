// models/fx_medal.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../converters/int_from_string_converter.dart';
part 'fx_medal.freezed.dart';
part 'fx_medal.g.dart';

@freezed
abstract class FxMedal with _$FxMedal {
  const factory FxMedal({
    @IntFromStringConverter() @Default(0) int vipLevel,
    @IntFromStringConverter() @Default(0) int richLevel,
    @IntFromStringConverter() @Default(0) int starLevel,
  }) = _FxMedal;

  factory FxMedal.fromJson(Map<String, dynamic> json) =>
      _$FxMedalFromJson(json);
}

// models/ktv_medal.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ktv_medal.freezed.dart';
part 'ktv_medal.g.dart';

@freezed
abstract class KtvMedal with _$KtvMedal {
  const factory KtvMedal({
    @Default('') String type3,
    @Default('') String type2,
    @Default('') String type1,
  }) = _KtvMedal;

  factory KtvMedal.fromJson(Map<String, dynamic> json) =>
      _$KtvMedalFromJson(json);
}

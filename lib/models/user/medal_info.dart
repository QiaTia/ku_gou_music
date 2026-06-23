// models/medal_info.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'ktv_medal.dart';
import 'fx_medal.dart';
part 'medal_info.freezed.dart';
part 'medal_info.g.dart';

@freezed
abstract class MedalInfo with _$MedalInfo {
  const factory MedalInfo({
    @Default(KtvMedal()) KtvMedal ktv,
    @Default(FxMedal()) FxMedal fx,
  }) = _MedalInfo;

  factory MedalInfo.fromJson(Map<String, dynamic> json) =>
      _$MedalInfoFromJson(json);
}

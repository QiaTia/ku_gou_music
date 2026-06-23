// models/tag.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ku_gou_music/models/converters/int_from_string_converter.dart';
part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
abstract class Tag with _$Tag {
  const factory Tag({
    @IntFromStringConverter() @JsonKey(name: 'tag_id') required int tagId,
    @IntFromStringConverter() @JsonKey(name: 'parent_id') int? parentId,
    @JsonKey(name: 'tag_name') required String tagName,
    @JsonKey(name: 'son') List<Tag>? son,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

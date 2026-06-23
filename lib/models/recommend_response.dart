// models/recommend_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'song.dart';
part 'recommend_response.freezed.dart';
part 'recommend_response.g.dart';

@freezed
abstract class RecommendResponse with _$RecommendResponse {
  const factory RecommendResponse({
    @JsonKey(name: 'sign') required String sign,
    @JsonKey(name: 'song_list_size') required int songListSize,
    @JsonKey(name: 'song_list')  @Default([]) List<Song> songList,
  }) = _RecommendResponse;

  factory RecommendResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendResponseFromJson(json);
}

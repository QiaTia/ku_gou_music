// models/song.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'singer_info.dart';
import 'tag.dart';
part 'song.freezed.dart';
part 'song.g.dart';

@freezed
abstract class Song with _$Song {
  const factory Song({
    required int songid,
    required String songname,
    required String hash,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'album_id') String? albumId,
    @JsonKey(name: 'album_name') String? albumName,
    @JsonKey(name: 'time_length') required int timeLength,
    @JsonKey(name: 'publish_date') required String publishDate,
    // @Default([]) List<SingerInfo> singerinfo,
    // @Default([]) List<Tag> tags,
    @JsonKey(name: 'sizable_cover') required String coverUrl,
    @JsonKey(name: 'file_size') required int fileSize,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}

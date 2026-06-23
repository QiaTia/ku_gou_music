// models/song.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'singer_info.dart';
import 'tag.dart';
part 'song.freezed.dart';
part 'song.g.dart';

@freezed
abstract class Song with _$Song {
  const Song._(); 
  
  const factory Song({
    required int songid,
    required String songname,
    required String hash,
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'album_id') Object? albumId,
    @JsonKey(name: 'album_name') String? albumName,
    @JsonKey(name: 'time_length') required int timeLength,
    @JsonKey(name: 'publish_date') required String publishDate,
    @Default([]) List<SingerInfo> singerinfo,
    @Default([]) List<Tag> tags,
    @JsonKey(name: 'sizable_cover') required String coverUrl,
    @JsonKey(name: 'file_size') required int fileSize,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  // 业务便捷属性,UI 直接用  
  String get coverUrl150 => coverUrl.replaceAll('{size}', '150');
  String get durationLabel {
    final m = timeLength ~/ 60;
    final s = (timeLength % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  String get singerNames => singerinfo.map((e) => e.name).join('、');
}

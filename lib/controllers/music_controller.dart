import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';
import '../services/audio_service.dart';

class MusicController extends GetxController {
  final audioService = Get.find<AudioService>();
  
  // 获取当前播放状态
  bool get isPlaying => audioService.audioState.value == AudioState.playing;
  bool get isPaused => audioService.audioState.value == AudioState.paused;
  bool get isBuffering => audioService.isBuffering.value;
  
  // 获取当前歌曲信息
  SongItemStruct? get currentSong => audioService.currentSong.value;
  Duration get position => audioService.position.value;
  Duration get duration => audioService.duration.value;
  double get progress => duration.inSeconds > 0 
      ? position.inSeconds / duration.inSeconds 
      : 0.0;
  String get currentTime => _formatDuration(position);
  String get totalTime => _formatDuration(duration);
  int get currentSongIndex => audioService.currentIndex.value;
  List<SongItemStruct> get playlist => audioService.songList;
  double get volume => audioService.volume.value;
  bool get isShuffled => audioService.isShuffled.value;
  LoopMode get loopMode => audioService.loopMode.value;
  
  // 控制方法
  Future<void> togglePlayPause() async {
    if (isPlaying) {
      await audioService.pause();
    } else {
      await audioService.play();
    }
  }
  
  Future<void> seekTo(double value) async {
    if (duration.inSeconds > 0) {
      await audioService.seek(Duration(seconds: (value * duration.inSeconds).toInt()));
    }
  }
  
  Future<void> nextSong() async {
    await audioService.next();
  }
  
  Future<void> previousSong() async {
    await audioService.previous();
  }
  
  Future<void> setVolume(double value) async {
    await audioService.setVolume(value.clamp(0.0, 1.0));
  }
  
  Future<void> toggleShuffle() async {
    await audioService.toggleShuffle();
  }
  
  Future<void> setLoopMode(LoopMode mode) async {
    await audioService.setLoopMode(mode);
  }
  
  /// 播放指定索引的歌曲，返回是否成功加载并播放
  Future<bool> playSong(int index) async {
    if (index >= 0 && index < playlist.length) {
      return await audioService.playSongAtIndex(index);
    }
    return false;
  }
  
  Future<void> addToPlaylist(SongItemStruct song) async {
    await audioService.addToQueue(song);
  }

  /// 插入歌曲到下一首播放
  Future<void> insertNextPlay(SongItemStruct song) async {
    await audioService.insertNext(song);
  }
  
  Future<void> clearPlaylist() async {
    await audioService.clearPlaylist();
  }

  /// 加载歌单歌曲列表
  Future<void> loadPlaylistMusic(List<SongItemStruct> list) {
    return audioService.setPlaylist(list);
  }
  
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else {
      return '${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
  }
}
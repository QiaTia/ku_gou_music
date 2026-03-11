import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class AudioService extends GetxService {
  final player = AudioPlayer();
  final Rx<AudioState> audioState = AudioState.paused.obs;
  final Rx<Duration> position = Duration.zero.obs;
  final Rx<Duration> duration = Duration.zero.obs;
  final RxBool isBuffering = false.obs;
  final RxDouble volume = 0.7.obs;
  final RxBool isShuffled = false.obs;
  final Rx<LoopMode> loopMode = LoopMode.off.obs;
  final RxInt currentIndex = 0.obs;
  final RxList<MusicItem> playlist = <MusicItem>[].obs;
  final Rx<MusicItem?> currentSong = Rx<MusicItem?>(null);
  
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerStateSubscription;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _bufferingSubscription;
  StreamSubscription? _sequenceSubscription;
  StreamSubscription? _currentIndexSubscription;
  
  @override
  void onInit() {
    super.onInit();
    _initPlayerListeners();
  }
  
  void _initPlayerListeners() {
    _positionSubscription = player.positionStream.listen((pos) {
      position.value = pos;
    });
    
    _durationSubscription = player.durationStream.listen((dur) {
      duration.value = dur ?? Duration.zero;
    });
    
    _playerStateSubscription = player.playerStateStream.listen((state) {
      isBuffering.value = state.processingState == ProcessingState.buffering;
      if (state.playing) {
        audioState.value = AudioState.playing;
      } else if (state.processingState == ProcessingState.completed) {
        audioState.value = AudioState.completed;
      } else {
        audioState.value = AudioState.paused;
      }
    });
    
    _bufferingSubscription = player.bufferedPositionStream.listen((_) {});
    
    _sequenceSubscription = player.sequenceStateStream.listen((sequence) {
      if (sequence != null) {
        final index = sequence.currentIndex;
        if (index != null) {
          currentIndex.value = index;
          if (index < playlist.length) {
            currentSong.value = playlist[index];
          }
        }
      }
    });
    
    _currentIndexSubscription = player.currentIndexStream.listen((index) {
      if (index != null) {
        currentIndex.value = index;
      }
    });
  }
  
  Future<void> setPlaylist(List<MusicItem> songs, {int index = 0}) async {
    playlist.assignAll(songs);
    if (songs.isNotEmpty) {
      await player.setAudioSource(
        ConcatenatingAudioSource(
          children: songs.map((song) => AudioSource.uri(Uri.parse(song.url))).toList(),
        ),
        initialIndex: index,
        initialPosition: Duration.zero,
      );
      currentSong.value = songs[index];
    }
  }
  
  Future<void> play() async {
    await player.play();
  }
  
  Future<void> pause() async {
    await player.pause();
  }
  
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }
  
  Future<void> seekToSeconds(double seconds) async {
    await player.seek(Duration(milliseconds: (seconds * 1000).toInt()));
  }
  
  Future<void> next() async {
    await player.seekToNext();
  }
  
  Future<void> previous() async {
    if (position.value.inSeconds > 3) {
      await seek(Duration.zero);
    } else {
      await player.seekToPrevious();
    }
  }
  
  Future<void> setVolume(double value) async {
    await player.setVolume(value);
    volume.value = value;
  }
  
  Future<void> toggleShuffle() async {
    isShuffled.value = !isShuffled.value;
    await player.setShuffleModeEnabled(isShuffled.value);
  }
  
  Future<void> setLoopMode(LoopMode mode) async {
    await player.setLoopMode(mode);
    loopMode.value = mode;
  }
  
  Future<void> addToQueue(MusicItem song) async {
    await player.setUrl(song.url);
    // await player.add(AudioSource.uri(Uri.parse(song.url)));
    playlist.add(song);
  }
  
  Future<void> playSongAtIndex(int index) async {
    if (index >= 0 && index < playlist.length) {
      await player.seek(Duration.zero, index: index);
      currentSong.value = playlist[index];
    }
  }
  
  Future<void> clearPlaylist() async {
    await player.stop();
    playlist.clear();
    currentSong.value = null;
  }
  
  @override
  void onClose() {
    _positionSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _durationSubscription?.cancel();
    _bufferingSubscription?.cancel();
    _sequenceSubscription?.cancel();
    _currentIndexSubscription?.cancel();
    player.dispose();
    super.onClose();
  }
}

enum AudioState {
  playing,
  paused,
  completed,
  error,
  loading
}

class MusicItem {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String coverUrl;
  final String url;
  final Duration duration;
  final String? lyrics;
  final String? genre;
  final int? year;
  
  const MusicItem({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
    required this.url,
    required this.duration,
    this.lyrics,
    this.genre,
    this.year,
  });
}
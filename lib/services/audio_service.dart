import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/song/song.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';

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
  final RxList<SongItemStruct> playlist = <SongItemStruct>[].obs;
  final Rx<SongItemStruct?> currentSong = Rx<SongItemStruct?>(null);
  
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
    /// 播放进度监听
    _positionSubscription = player.positionStream.listen((pos) {
      position.value = pos;
    });
    /// 音频时长监听
    _durationSubscription = player.durationStream.listen((dur) {
      duration.value = dur ?? Duration.zero;
    });
    /// 播放状态监听
    _playerStateSubscription = player.playerStateStream.listen((state) {
      isBuffering.value = state.processingState == ProcessingState.buffering;
      if (state.playing) {
        audioState.value = AudioState.playing;
      } else if (state.processingState == ProcessingState.completed) {
        audioState.value = AudioState.completed;
        print('completed');
        nextLoop();
      } else {
        audioState.value = AudioState.paused;
      }
    });
    /// 缓冲进度监听
    // _bufferingSubscription = player.bufferedPositionStream.listen((sequence) {
    //   print(sequence);
    // });

    /// 当前播放歌曲监听
    _sequenceSubscription = player.sequenceStateStream.listen((sequence) {
      // final index = sequence.currentIndex;
      // if (index != null) {
      //   currentIndex.value = index;
      //   if (index < playlist.length) {
      //     currentSong.value = playlist[index];
      //   }
      // }
    });

    // _currentIndexSubscription = player.currentIndexStream.listen((index) {
    //   if (index != null) {
    //     currentIndex.value = index;
    //   }
    // });
  }
  /// 进入循环下一首
  void nextLoop() {
    if (loopMode.value != LoopMode.one) next();
  }
  
  Future<void> setPlaylist(List<SongItemStruct> songs, {int index = 0}) async {
    playlist.assignAll(songs);
    if (songs.isNotEmpty) {
      // AudioSource(Uri.parse());
      // await player.setAudioSource(
      //   ConcatenatingAudioSource(
      //     children: songs.map((song) => AudioSource.uri(Uri.parse(song.url))).toList(),
      //   ),
      //   initialIndex: index,
      //   initialPosition: Duration.zero,
      // );
      currentSong.value = songs[index];
    }
  }
  
  Future<void> play() async {
    if(currentSong.value != null) {
      var urls = (await getMusicUrls(hash: currentSong.value!.hash)).body?['url'] ?? [];
      await player.setUrl(urls[0]);
    }
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
    final nextIndex = currentIndex.value + 1;
    await playSongAtIndex((nextIndex >= playlist.length -1 ) ? 0 : nextIndex);
    // await player.seekToNext();
  }
  
  Future<void> previous() async {
    if (position.value.inSeconds > 3) {
      await seek(Duration.zero);
    } else {
      final nextIndex = currentIndex.value - 1;
    await playSongAtIndex((nextIndex < 0) ? playlist.length -1 : nextIndex);
      // await player.seekToPrevious();
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
  
  Future<void> addToQueue(SongItemStruct song) async {
    var urls = (await getMusicUrls(hash: currentSong.value!.hash)).body?['url'] ?? [];
    await player.setUrl(urls[0]);
    // await player.add(AudioSource.uri(Uri.parse(song.url)));
    playlist.add(song);
  }
  
  Future<void> playSongAtIndex(int index) async {
    if (index >= 0 && index < playlist.length) {
      currentIndex.value = index;
      currentSong.value = playlist[index];
      var urls = (await getMusicUrls(hash: currentSong.value!.hash)).body?['url'] ?? [];
      await player.setUrl(urls[0]);
      // currentSong.value = playlist[index];
      // await player.seek(Duration.zero, index: index);
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


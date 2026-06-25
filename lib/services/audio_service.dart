import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/song/song.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio_background/just_audio_background.dart';

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
  // 1. 逻辑歌单：只存歌曲的元数据（ID、歌名等），不存 URL
  final RxList<SongItemStruct> songList = <SongItemStruct>[].obs;
  List<AudioSource> playlist = [];
  // 2. 记录已加载的索引
  final Set<int> _loadedIndices = {};
  bool isLoadingIndices = false;

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

  void _initPlayerListeners() async {
    // 2. 配置音频会话 (处理耳机、电话打断)
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    // 监听耳机拔出事件，自动暂停
    session.interruptionEventStream.listen((event) {
      if (event.begin) {
        if (event.type == AudioInterruptionType.pause ||
            event.type == AudioInterruptionType.duck) {
          player.pause();
        }
      } else {
        // 如果是电话打断结束，可以选择恢复播放
        if (event.type == AudioInterruptionType.pause) {
          player.play();
        }
      }
    });

    // 监听耳机拔出 (BecomingNoisy)
    session.becomingNoisyEventStream.listen((_) {
      player.pause();
    });

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
      if (state.processingState == ProcessingState.completed) {
        // print('completed');
        audioState.value = AudioState.completed;
        // nextLoop();
      }
      audioState.value = state.playing ? AudioState.playing : AudioState.paused;
      isBuffering.value = state.processingState == ProcessingState.buffering;
    });

    /// 缓冲进度监听
    // _bufferingSubscription = player.bufferedPositionStream.listen((sequence) {
    //   print(sequence);
    // });

    /// 当前播放歌曲监听
    _sequenceSubscription = player.sequenceStateStream.listen((sequence) {
      final index = sequence.currentIndex;
      if (index != null) {
        currentIndex.value = index;
        if (index < songList.length) {
          currentSong.value = songList[index];
        }
        if (index + 1 < songList.length) {
          _prefetchSong(songList[index + 1], index + 1);
        }
      }
    });

    // _currentIndexSubscription = player.currentIndexStream.listen((index) {
    //   if (index != null) {
    //     currentIndex.value = index;
    //   }
    // });
  }

  /// 播放结束，进入下一首
  void nextLoop() async {
    if (loopMode.value == LoopMode.one) {
      await player.seek(Duration.zero);
      await player.play();
    } else {
      await next();
      await player.play();
    }
  }

  Future<void> setPlaylist(List<SongItemStruct> songs, {int index = 0}) async {
    songList.clear();
    playlist.clear();
    songList.assignAll(songs);
    _loadedIndices.clear();
    playlist = List.generate(songs.length, (i) => _generateSilenceSource(songs[i]));
    // 💡 核心 2：使用新版 API 绑定列表
    if (songs.isNotEmpty) {
      await _prefetchSong(songs[index], index);
      await player.setAudioSources(
        playlist,
        // preload: false,
        initialIndex: index,
        initialPosition: Duration.zero,
        // useLazyPreparation: true,                    // Load each item just in time
        shuffleOrder: DefaultShuffleOrder()
      );
      currentSong.value = songs[index];
      currentIndex.value = index;
      await player.seek(Duration.zero, index: index);
    }
  }

  Future<void> play() async {
    // if (currentSong.value != null) {
    //   if (currentIndex.value != -1) {
    //     await playSongAtIndex(currentIndex.value);
    //   }
    // }
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
    // final nextIndex = currentIndex.value + 1;
    await player.seekToNext();
    // await playSongAtIndex((nextIndex >= playlist.length - 1) ? 0 : nextIndex);
  }

  Future<void> previous() async {
    await player.seekToPrevious();
    // if (position.value.inSeconds > 3) {
    //   await seek(Duration.zero);
    // } else {
    //   final nextIndex = currentIndex.value - 1;
    //   await player.seekToPrevious();
    //   await playSongAtIndex((nextIndex < 0) ? playlist.length - 1 : nextIndex);
    // }
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
    songList.add(song);
    // await player.add(AudioSource.uri(Uri.parse(song.url)));
    playlist.add(_generateSilenceSource(song));
  }

  Future<void> playSongAtIndex(int index) async {
    if (index >= 0 && index < playlist.length) {
      await _prefetchSong(songList[index], index);
      // currentIndex.value = index;
      // currentSong.value = songList[index];
      await player.seek(Duration.zero, index: index);
      await player.play();
    }
  }

  Future<void> clearPlaylist() async {
    await player.stop();
    playlist.clear();
    _loadedIndices.clear();
    currentSong.value = null;
  }

  /// 核心方法：后台静默预加载下一首的 URL
  Future<void> _prefetchSong(SongItemStruct song, int i) async {
    if (_loadedIndices.contains(i) || isLoadingIndices) {
      return;
    }
    try {
      isLoadingIndices = true;
      var urls =
          (await getMusicUrls(
            hash: song.hash,
            freePart: userInstance.token.isEmpty ? 1 : 0,
          )).body?['url'] ??
          [];
      if (urls.isEmpty) {
        throw Exception('No URL found for song: ${song.name}');
      }
      // await player.setUrl(urls[0]);
      playlist[i] = AudioSource.uri(
        Uri.parse(urls[0]),
        tag: MediaItem(
          id: song.hash,
          // album: song,
          title: song.name,
          artist: song.author,
          artUri: Uri.parse(song.cover), // 锁屏封面图
        ),
      );
      _loadedIndices.add(i);
      await player.insertAudioSource(i, playlist[1]);
    } catch (e) {
      print(e);
      print("⚠️ 预加载第 ${song.hash} 首歌失败，等用户真切到那首时再重试");
    }
    isLoadingIndices = false;
  }

  /// 生成一个极短的静音 AudioSource 作为占位符
  /// (使用 Base64 编码的 1秒静音 WAV，避免依赖本地文件)
  AudioSource _generateSilenceSource(SongItemStruct song) {
   // 1秒静音 WAV 的 Base64
    const String silentWavBase64 =
        "UklGRiQAAABXQVZFZm10IBAAAAABAAEARKwAAIhYAQACABAAZGF0YQAAAAA=";

    return AudioSource.uri(
      Uri.parse('data:audio/wav;base64,$silentWavBase64'),
      // 🌟 关键修复：给占位符也打上完整的 MediaItem 标签！
      tag: MediaItem(
        id: song.hash,
        title: song.name,
        artist: song.author,
        artUri: Uri.parse(song.cover),
        // 如果有其他字段如 album, duration 也可以在这里填上
      ),
    );
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

enum AudioState { playing, paused, completed, error, loading }

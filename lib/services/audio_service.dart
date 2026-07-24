import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/api/song/song.dart';
import 'package:ku_gou_music/store/user.dart';
import 'package:ku_gou_music/views/playlist/playlist.controller.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:ku_gou_music/models/audio_quality.dart';
import 'song_cache_service.dart';
import 'play_history_service.dart';

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

  /// 播放列表代数计数器：每次 setPlaylist 自增，
  /// 用于让旧的后台预加载任务自动失效，避免污染新播放列表
  int _playlistGeneration = 0;

  /// 最近一次获取播放URL失败的原因（用于 UI 提示）
  String? lastUrlError;

  final Rx<SongItemStruct?> currentSong = Rx<SongItemStruct?>(null);

  final _historyService = PlayHistoryService();

  // ========== 缓存相关 ==========

  /// 缓存服务
  final _cacheService = Get.find<SongCacheService>();

  /// 当前期望音质（用户可切换，默认标准）
  final Rx<AudioQuality> preferredQuality = AudioQuality.standard.obs;

  /// 后台预缓存进行中标志
  bool _isPrefetchCaching = false;

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
        // 越界保护：播放列表切换瞬间，播放器索引可能超出新歌单范围
        if (index >= 0 && index < songList.length) {
          currentSong.value = songList[index];
          // 自动记录播放历史
          _recordPlayHistory(songList[index]);
        }
        var nextIndex = index + 1;
        if (nextIndex >= 0 && nextIndex < songList.length) {
          _prefetchSong(songList[nextIndex], nextIndex);
        }
        // 后台预缓存接下来的歌曲
        _prefetchCacheForUpcoming();
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
    // 使旧的后台预加载任务失效，避免它们用旧索引污染新播放列表
    _playlistGeneration++;
    // 等待正在进行中的预加载完成（最多等 5 秒），
    // 否则新的 _prefetchSong 会被 isLoadingIndices 拦截，导致歌曲加载不出来
    int waitCount = 0;
    while (isLoadingIndices && waitCount < 100) {
      await Future.delayed(const Duration(milliseconds: 50));
      waitCount++;
    }
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

  /// 插入歌曲到下一首播放（当前播放歌曲之后）
  Future<void> insertNext(SongItemStruct song) async {
    final insertIndex = currentIndex.value + 1;
    songList.insert(insertIndex, song);
    playlist.insert(insertIndex, _generateSilenceSource(song));
    // 偏移插入位置之后的已加载索引
    final shifted = _loadedIndices.where((i) => i >= insertIndex).toList();
    for (final i in shifted) {
      _loadedIndices.remove(i);
      _loadedIndices.add(i + 1);
    }
    // 预加载并插入播放器
    await _prefetchSong(song, insertIndex);
  }

  /// 播放指定索引的歌曲
  /// 返回 true 表示歌曲资源已成功加载并尝试播放；
  /// 返回 false 表示未能获取到歌曲资源（如 VIP 无权限/无版权）或播放出错
  Future<bool> playSongAtIndex(int index) async {
    if (index < 0 || index >= playlist.length) return false;
    await _prefetchSong(songList[index], index);
    // 预加载后仍不在已加载集合中，说明资源获取失败
    if (!_loadedIndices.contains(index)) {
      return false;
    }
    try {
      await player.seek(Duration.zero, index: index);
      await player.play();
      return true;
    } catch (e) {
      print('⚠️ 播放第 $index 首失败: $e');
      return false;
    }
  }

  Future<void> clearPlaylist() async {
    await player.stop();
    playlist.clear();
    _loadedIndices.clear();
    currentSong.value = null;
  }

  /// 获取歌曲播放URL，带试听回退：
  /// 先用当前账号权限请求完整版，若返回空 URL（如 VIP 歌曲无权限），
  /// 自动回退到试听片段（freePart=1）重试。
  Future<List<dynamic>> _fetchPlayUrls(String hash) async {
    lastUrlError = null;
    final quality = preferredQuality.value.apiValue;
    final primaryFreePart = userInstance.token.isEmpty ? 1 : 0;

    var res = await getMusicUrls(
      hash: hash,
      quality: quality,
      freePart: primaryFreePart,
    );
    var urls = res.body?['url'];
    if (urls is List && urls.isNotEmpty) {
      return urls;
    }

    // 未拿到 URL，打印响应便于排查
    final primaryCode = res.body?['error_code'];
    print('⚠️ 获取播放URL为空 (hash=$hash, freePart=$primaryFreePart)，响应: ${res.body}');

    // 回退到试听片段重试
    int? fallbackCode;
    if (primaryFreePart != 1) {
      res = await getMusicUrls(
        hash: hash,
        quality: quality,
        freePart: 1,
      );
      urls = res.body?['url'];
      if (urls is List && urls.isNotEmpty) {
        print('✅ 已回退到试听片段播放');
        return urls;
      }
      fallbackCode = res.body?['error_code'];
      print('⚠️ 试听片段也为空，响应: ${res.body}');
    }

    lastUrlError = _describeUrlError(primaryCode, fallbackCode);
    return [];
  }

  /// 根据酷狗返回的错误码生成可读的失败原因
  String _describeUrlError(int? primaryCode, int? fallbackCode) {
    // 20018：登录态失效/无权限（内置默认 token 已过期）
    if (primaryCode == 20018) {
      return '当前登录状态已失效或无权限，请重新登录后再试';
    }
    // 31863：该歌曲没有试听片段
    if (fallbackCode == 31863 || primaryCode == 31863) {
      return '该歌曲暂无试听资源，可能需要开通 VIP';
    }
    return '无法获取歌曲资源，可能为 VIP 歌曲或暂无版权';
  }

  /// 核心方法：预加载歌曲URL，优先使用缓存
  Future<void> _prefetchSong(SongItemStruct song, int i) async {
    if (_loadedIndices.contains(i) || isLoadingIndices) {
      return;
    }
    // 记录开始时的播放列表代数，用于检测预加载过程中播放列表是否已切换
    final generation = _playlistGeneration;
    try {
      isLoadingIndices = true;

      // ===== 优先检查本地缓存 =====
      Uri? audioUri;
      final localUri = await _cacheService.getLocalFileUri(
        song.hash,
        preferredQuality: preferredQuality.value,
      );
      if (localUri != null) {
        // 缓存命中：直接使用本地文件
        audioUri = localUri;
        print('✅ 缓存命中: ${song.name} (${song.hash})');
      } else {
        // 缓存未命中：走网络URL（带试听回退）
        var urls = await _fetchPlayUrls(song.hash);
        if (urls.isEmpty) {
          throw Exception('No URL found for song: ${song.name}');
        }
        audioUri = Uri.parse(urls[0]);

        // ===== 后台缓存下载（不阻塞播放） =====
        _cacheService.cacheFromUrl(
          hash: song.hash,
          cdnUrl: urls[0],
          quality: preferredQuality.value,
          songName: song.name,
          author: song.author,
        ).then((path) {
          if (path != null) {
            print('💾 后台缓存完成: ${song.name} -> $path');
          }
        }).catchError((e) {
          // 静默处理，不影响播放
          print('⚠️ 后台缓存失败: $e');
        });
      }

      // 关键：网络请求完成后，检查播放列表是否已被切换（代数不匹配）
      // 若已切换，丢弃本次结果，避免用旧索引写入新播放列表
      if (generation != _playlistGeneration) {
        return;
      }
      // 索引越界保护
      if (i < 0 || i >= playlist.length) {
        return;
      }

      playlist[i] = AudioSource.uri(
        audioUri,
        tag: MediaItem(
          id: song.hash,
          // album: song,
          title: song.name,
          artist: song.author,
          artUri: Uri.parse(song.cover), // 锁屏封面图
        ),
      );
      _loadedIndices.add(i);
      await player.insertAudioSource(i, playlist[i]);
    } catch (e) {
      print(e);
      print("⚠️ 预加载第 ${song.hash} 首歌失败，等用户真切到那首时再重试");
    } finally {
      isLoadingIndices = false;
    }
  }

  /// 后台预缓存接下来的N首歌
  /// 在当前歌曲播放后触发，预下载队列中接下来的歌曲
  Future<void> _prefetchCacheForUpcoming() async {
    if (_isPrefetchCaching) return;
    _isPrefetchCaching = true;

    try {
      const int prefetchCount = 3; // 预缓存接下来3首
      final startIndex = currentIndex.value + 1;
      final endIndex = (startIndex + prefetchCount).clamp(0, songList.length);

      for (int i = startIndex; i < endIndex; i++) {
        final song = songList[i];
        // 只缓存尚未有缓存的歌
        if (!await _cacheService.hasCache(song.hash)) {
          try {
            var urls = await _fetchPlayUrls(song.hash);
            if (urls.isNotEmpty) {
              await _cacheService.cacheFromUrl(
                hash: song.hash,
                cdnUrl: urls[0],
                quality: preferredQuality.value,
                songName: song.name,
                author: song.author,
              );
              print('💾 预缓存完成: ${song.name}');
            }
          } catch (e) {
            print('⚠️ 预缓存失败: ${song.name} - $e');
          }
        }
      }
    } finally {
      _isPrefetchCaching = false;
    }
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

  /// 记录播放历史
  void _recordPlayHistory(SongItemStruct song) {
    try {
      final historyItem = SongPlayHistory(
        id: song.audio_id.toString(),
        name: song.name,
        cover: song.cover,
        playTime: DateTime.now().millisecondsSinceEpoch,
        hash: song.hash,
        author: song.author,
        timelen: song.timelen,
        privilege: song.privilege,
        isSq: song.is_sq,
        isHq: song.is_hq,
        mvhash: song.mvhash,
      );
      _historyService.addSong(historyItem);
    } catch (e) {
      // 静默处理，不影响播放
    }
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

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../services/audio_service.dart';

class MusicController extends GetxController {
  final audioService = Get.find<AudioService>();
  
  // 获取当前播放状态
  bool get isPlaying => audioService.audioState.value == AudioState.playing;
  bool get isPaused => audioService.audioState.value == AudioState.paused;
  bool get isBuffering => audioService.isBuffering.value;
  
  // 获取当前歌曲信息
  MusicItem? get currentSong => audioService.currentSong.value;
  Duration get position => audioService.position.value;
  Duration get duration => audioService.duration.value;
  double get progress => duration.inSeconds > 0 
      ? position.inSeconds / duration.inSeconds 
      : 0.0;
  String get currentTime => _formatDuration(position);
  String get totalTime => _formatDuration(duration);
  int get currentSongIndex => audioService.currentIndex.value;
  List<MusicItem> get playlist => audioService.playlist;
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
  
  Future<void> playSong(int index) async {
    if (index >= 0 && index < playlist.length) {
      await audioService.playSongAtIndex(index);
    }
  }
  
  Future<void> addToPlaylist(MusicItem song) async {
    await audioService.addToQueue(song);
  }
  
  Future<void> clearPlaylist() async {
    await audioService.clearPlaylist();
  }
  
  // 加载示例音乐
  void loadSampleMusic() {
    final sampleMusic = [
      MusicItem(
        id: '1',
        title: '和我i我怒不饿',
        artist: 'Dj小言',
        album: '世界',
        coverUrl: 'https://i0.hdslb.com/bfs/archive/24b9bee59d8c5aa55d39ce2c471e5a0d3ad418ec.jpg@336w_190h_1c_!web-video-rcmd-cover.avif',
        url: 'https://cdn.pixabay.com/audio/2026/02/27/audio_0250461c0c.mp3',
        duration: Duration(minutes: 75, seconds: 13),
        genre: '摇滚',
        year: 2011,
      ),
      MusicItem(
        id: '492144016',
        title: '成都',
        artist: '曲肖冰',
        album: '曲肖冰翻唱集',
        coverUrl: 'https://p1.music.126.net/WaaQt6dYDkYizq97_iTH3w==/109951163436657260.jpg?param=130y130',
        url: 'https://music.163.com/song/media/outer/url?id=492144016.mp3',
        duration: Duration(minutes: 4, seconds: 46),
        genre: '民谣',
        lyrics: "[00:00.00] 作词 : 赵雷\n[00:01.00] 作曲 : 赵雷\n[00:05.89]\n[00:19.97]让我掉下眼泪的 不止是昨夜的酒\n[00:27.64]\n[00:28.35]让我依依不舍的 不止你的温柔\n[00:36.09]\n[00:36.55]雨路还要走多久 你攥着我的手\n[00:44.59]\n[00:44.76]让我感到为难的 是挣扎的自由\n[00:52.93]\n[00:55.24]分别总是在九月 回忆是思念的愁\n[01:02.92]\n[01:03.49]深秋嫩绿的垂柳 亲吻着我额头\n[01:11.32]\n[01:11.87]在那座阴雨的小城里 我从未忘记你\n[01:19.25]\n[01:20.09]成都 带不走的 只有你\n[01:26.37]\n[01:28.46]和我在成都的街头走一走 喔哦~\n[01:35.89]\n[01:36.59]直到所有的灯都熄灭了也不停留\n[01:44.52]\n[01:44.77]你会挽着我的衣袖 我会把手揣进裤兜\n[01:52.59]\n[01:53.08]走到玉林路的尽头 坐在小酒馆的门口\n[02:02.11]\n[02:36.76]分别总是在九月 回忆是思念的愁\n[02:44.22]\n[02:45.01]深秋嫩绿的垂柳 亲吻着我额头\n[02:52.78]\n[02:53.20]在那座阴雨的小城里 我从未忘记你\n[03:00.77]\n[03:01.39]成都 带不走的 只有你\n[03:07.43]\n[03:09.81]和我在成都的街头走一走 喔哦~\n[03:17.25]\n[03:18.05]直到所有的灯都熄灭了也不停留\n[03:25.74]\n[03:26.18]你会挽着我的衣袖 我会把手揣进裤兜\n[03:34.03]\n[03:34.50]走到玉林路的尽头 走过小酒馆的门口\n[03:42.88]\n[03:42.95]和我在成都的街头走一走 喔哦~\n[03:50.41]\n[03:51.11]直到所有的灯都熄灭了也不停留\n[03:59.22]\n[03:59.26]你会挽着我的衣袖 我会把手揣进裤兜\n[04:07.11]\n[04:07.72]走到玉林路的尽头 走过小酒馆的门口\n[04:16.91]\n",
        year: 2016,
      ),
      MusicItem(
        id: '3339230677',
        title: '晴天',
        artist: '周杰伦',
        album: '叶惠美',
        coverUrl: 'https://p2.music.126.net/Ip_FxUe0PW5fd9MwN_upaA==/109951172650053703.jpg',
        url: 'https://music.163.com/song/media/outer/url?id=3339230677.mp3',
        duration: Duration(minutes: 3, seconds: 2),
        genre: '流行',
        year: 2003,
      ),
      MusicItem(
        id: '2092595510',
        title: '平凡之路',
        artist: '朴树',
        album: '猎户星座',
        coverUrl: 'https://i0.hdslb.com/bfs/archive/4936d3e0e1324d0a01315ff1a3fde096a3f5524f.jpg@336w_190h_1c_!web-video-rcmd-cover.avif',
        url: 'https://music.163.com/song/media/outer/url?id=2092595510.mp3',
        duration: Duration(minutes: 4, seconds: 59),
        genre: '流行',
        year: 2014,
        lyrics: "[00:11.850]徘徊着的 在路上的\n[00:17.390]你要走吗 via via\n[00:22.580]易碎的 骄傲着\n[00:28.740]那也曾是我的模样\n[00:34.500]沸腾着的 不安着的\n[00:40.140]你要去哪 via via\n[00:45.880]谜一样的 沉默着的\n[00:51.030]故事你真的 在听吗\n[00:55.910]我曾经跨过山和大海 也穿过人山人海\n[01:01.390]我曾经拥有着的一切 转眼都飘散如烟\n[01:07.040]我曾经失落失望 失掉所有方向\n[01:13.250]直到看见平凡 才是唯一的答案\n[01:31.640]当你仍然 还在幻想\n[01:37.120]你的明天 via via\n[01:42.710]她会好吗 还是更烂\n[01:48.540]对我而言 是另一天\n[01:52.780]我曾经毁了我的一切 只想永远地离开\n[01:58.230]我曾经堕入无边黑暗 想挣扎无法自拔\n[02:04.160]我曾经像你像他 像那野草野花\n[02:09.990]绝望着 也渴望着 也哭也笑平凡着\n[03:02.420]向前走 就这么走 就算你被给过什么\n[03:07.810]向前走 就这么走 就算你被夺走什么\n[03:13.550]向前走 就这么走 就算你会错过什么\n[03:19.250]向前走 就这么走 就算你会\n[03:23.890]我曾经跨过山和大海 也穿过人山人海\n[03:29.210]我曾经拥有着的一切 转眼都飘散如烟\n[03:34.940]我曾经失落失望 失掉所有方向\n[03:41.040]直到看见平凡 才是唯一的答案\n[03:46.420]我曾经毁了我的一切 只想永远地离开\n[03:51.970]我曾经堕入无边黑暗 想挣扎无法自拔\n[03:57.850]我曾经像你像他 像那野草野花\n[04:03.400]绝望着 也渴望着 也哭也笑平凡着\n[04:09.120]我曾经跨过山和大海 也穿过人山人海\n[04:14.680]我曾经问遍整个世界 从来没得到答案\n[04:20.410]我不过像你像他 像那野草野花\n[04:26.210]冥冥中 这是我 唯一要走的路啊\n[04:33.540]时间无言 如此这般 明天已在 Hia Hia\n[04:44.730]风吹过的 路依然远 你的故事讲到了哪\n[04:56.550]\n[04:57.550]Arragement : 朴树\n[04:58.550]Bass : 泊宁\n[04:59.040]Programing / Guitars / Keyboards &Sythn : 朴树\n[05:00.040]Hormony : 叶蓓 / 窦颖 / 俞杨洋 / 德恒 / 郎磊 / 泊宁 / 于健 / 周霁 / 宋赫伦 / 符宁,等\n[05:01.040]Recording Engineer : 泊宁\n[05:02.040]Mixing Engineer : 李军\n"
      ),
      MusicItem(
        id: '1929335711',
        title: '光年之外',
        artist: 'G.E.M.邓紫棋',
        album: '另一个童话',
        coverUrl: 'https://i0.hdslb.com/bfs/archive/f1a0b5f0a2957ddf4dbc75a60835da58a329e7b4.jpg@672w_378h_1c_!web-home-common-cover.avif',
        url: 'https://music.163.com/song/media/outer/url?id=1929335711.mp3',
        duration: Duration(minutes: 3, seconds: 55),
        genre: '流行',
        year: 2018,
        lyrics: "[00:00.000] 作词 : 无\n[00:01.000] 作曲 : 无\n[00:02.000] 编曲 : 无\n[00:12.420]感受停在我发端的指尖\n[00:16.560]如何瞬间冻结时间\n[00:23.310]记住望着我坚定的双眼\n[00:27.450]也许已经没有明天\n[00:33.930]面对浩瀚的星海\n[00:36.480]我们微小得像尘埃\n[00:39.060]漂浮在一片无奈\n[00:44.880]缘分让我们相遇乱世以外\n[00:50.370]命运却要我们危难中相爱\n[00:55.740]也许未来遥远在光年之外\n[01:01.230]我愿守候未知里为你等待\n[01:05.250]我没想到为了你我能疯狂到\n[01:10.590]山崩海啸没有你根本不重要\n[01:16.170]我的大脑为了你已经疯狂到\n[01:21.630]脉搏心跳没有你根本不重要\n[01:28.800]一双围在我胸口的臂弯\n[01:32.850]足够抵挡天旋地转\n[01:39.690]一种执迷不放手的倔强\n[01:43.830]足以点燃所有希望\n[01:50.340]宇宙磅礡而冷漠\n[01:52.860]我们的爱微小而闪烁\n[01:55.380]颠簸却如此忘我\n[02:01.230]缘分让我们相遇乱世以外\n[02:06.690]命运却要我们危难中相爱\n[02:12.090]也许未来遥远在光年之外\n[02:17.610]我愿守候未知里为你等待\n[02:21.570]我没想到为了你我能疯狂到\n[02:27.030]山崩海啸没有你根本不想逃\n[02:32.550]我的大脑为了你已经疯狂到\n[02:37.950]脉搏心跳没有你根本不重要\n[02:44.130]也许航道以外是醒不来的梦\n[02:56.460]乱世以外是纯粹的相拥\n[03:05.190]我没想到为了你我能疯狂到\n[03:10.590]山崩海啸没有你根本不想逃\n[03:16.140]我的大脑为了你已经疯狂到\n[03:21.570]脉搏心跳没有你根本不重要\n[03:27.390]相遇乱世以外危难中相爱\n[03:38.310]相遇乱世以外危难中相爱\n[03:48.930]我没想到\n[03:50.520]www. kuwo. cn\n"
      ),
    ];
    
    audioService.setPlaylist(sampleMusic);
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
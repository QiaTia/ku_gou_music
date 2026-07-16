import 'package:get/get.dart';
import '../controllers/music_controller.dart';
import '../services/audio_service.dart';

class MusicBinding extends Bindings {
  @override
  void dependencies() {
    // SongCacheService 已在 main() 中通过 Get.putAsync 初始化
    Get.lazyPut(() => AudioService());
    Get.lazyPut(() => MusicController());
  }
}

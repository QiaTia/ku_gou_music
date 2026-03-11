import 'package:get/get.dart';
import '../controllers/music_controller.dart';
import '../services/audio_service.dart';

class MusicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioService());
    Get.lazyPut(() => MusicController());
  }
}
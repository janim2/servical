import '../controller/videos_screen_controller.dart';
import 'package:get/get.dart';

class VideosScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideosScreenController());
  }
}

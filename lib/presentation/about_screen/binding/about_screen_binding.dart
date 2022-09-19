import '../controller/about_screen_controller.dart';
import 'package:get/get.dart';

class AboutScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutScreenController());
  }
}

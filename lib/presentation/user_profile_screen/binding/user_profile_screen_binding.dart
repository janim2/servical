import '../controller/user_profile_screen_controller.dart';
import 'package:get/get.dart';

class UserProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfileScreenController());
  }
}

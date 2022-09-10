import '../controller/otp_screen_controller.dart';
import 'package:get/get.dart';

class OTPScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OTPScreenController());
  }
}

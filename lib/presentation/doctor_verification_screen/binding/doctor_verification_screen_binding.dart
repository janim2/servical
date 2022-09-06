import '../controller/doctor_verification_screen_controller.dart';
import 'package:get/get.dart';

class DoctorVerificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorVerificationScreenController());
  }
}

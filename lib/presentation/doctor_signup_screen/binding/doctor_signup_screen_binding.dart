import '../controller/doctor_signup_screen_controller.dart';
import 'package:get/get.dart';

class DoctorSignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorSignUpScreenController());
  }
}

import '../controller/doctor_login_screen_controller.dart';
import 'package:get/get.dart';

class DoctorLoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorLoginScreenController());
  }
}

import '../controller/doctor_not_verified_screen_controller.dart';
import 'package:get/get.dart';

class DoctorNotVerifiedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorNotVerifiedScreenController());
  }
}

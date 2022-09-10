import '../controller/doctor_info_screen_controller.dart';
import 'package:get/get.dart';

class DoctorInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorInfoController());
  }
}

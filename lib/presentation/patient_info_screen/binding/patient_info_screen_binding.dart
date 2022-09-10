import '../controller/patient_info_screen_controller.dart';
import 'package:get/get.dart';

class PatientInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientInfoController());
  }
}

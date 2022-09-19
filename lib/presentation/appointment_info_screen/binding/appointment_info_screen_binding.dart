import '../controller/apoointment_info_screen_controller.dart';
import 'package:get/get.dart';

class ApointmentInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentInfoController());
  }
}

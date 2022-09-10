import '../controller/doctor_dashboard_screen_controller.dart';
import 'package:get/get.dart';

class DoctorDashboardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorDashboardScreenController());
  }
}

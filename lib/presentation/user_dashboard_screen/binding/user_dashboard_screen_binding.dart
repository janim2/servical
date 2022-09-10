import '../controller/user_dashboard_screen_controller.dart';
import 'package:get/get.dart';

class UserDashboardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDashboardScreenController());
  }
}

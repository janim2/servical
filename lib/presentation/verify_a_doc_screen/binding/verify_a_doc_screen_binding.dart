import '../controller/verify_a_doc_screen_controller.dart';
import 'package:get/get.dart';

class VerifyADocScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyADocScreenController());
  }
}

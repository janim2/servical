import '../controller/write_patient_notes_screen_controller.dart';
import 'package:get/get.dart';

class WritePatientNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WritePatientNotesController());
  }
}

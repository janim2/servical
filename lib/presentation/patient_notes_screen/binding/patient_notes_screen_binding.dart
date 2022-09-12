import '../controller/patient_notes_screen_controller.dart';
import 'package:get/get.dart';

class PatientNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientNotesController());
  }
}

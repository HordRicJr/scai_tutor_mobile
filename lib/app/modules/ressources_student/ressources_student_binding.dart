import 'package:get/get.dart';

import 'ressources_student_controller.dart';

class RessourcesStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RessourcesStudentController>(
      () => RessourcesStudentController(),
    );
  }
}

import 'package:get/get.dart';

import 'class_student_controller.dart';

class ClassStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassStudentController>(
      () => ClassStudentController(),
    );
  }
}

import 'package:get/get.dart';

import 'class_student_details_controller.dart';

class ClassStudentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassStudentDetailsController>(
      () => ClassStudentDetailsController(),
    );
  }
}

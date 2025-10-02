import 'package:get/get.dart';

class ClassStudentDetailsController extends GetxController {
  //TODO: Implement ClassStudentDetailsController

  final count = 0.obs;

  RxString selectedOption = ''.obs;

  void submitOption() {
    if (selectedOption.value.isNotEmpty) {
      // Logique de soumission ici
      print('Soumis: $selectedOption');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

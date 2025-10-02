import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final count = 0.obs;
  final RxString selectedProfile = ''.obs;
  final RxBool hasStudent = false.obs;
  final RxString selectedTime = ''.obs;

  void selectTime(String value) {
    selectedTime.value = value;
  }

  void selectProfile(String value) {
    selectedProfile.value = value;
  }

  void toggleHasStudent(bool value) {
    hasStudent.value = value;
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

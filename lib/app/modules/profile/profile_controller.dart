import 'package:get/get.dart';
import 'package:scai_tutor_mobile/app/data/models/user.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  var user = User().obs;
  @override
  void onInit() {
    user.value = User(
      id: '1',
      role: 'Apprenant(e)',
      name: 'AFANVI Joséphine',
      email: 'josephine.afanvi@up.ac.za',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN-ni_Yptz96zLaPq1dlsfPyDmQdjwQXKyAg&s',
      password: '',
      token: '',
    );
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

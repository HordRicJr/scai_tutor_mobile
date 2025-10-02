import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scai_tutor_mobile/app/global_widgets/header_logo.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HeaderLogo(), centerTitle: true),
      body: Column(children: [Text("Choisissez un profil pour continuer")]),
    );
  }
}

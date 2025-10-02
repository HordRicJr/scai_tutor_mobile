import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:scai_tutor_mobile/app/data/models/Classe.dart';
import 'package:scai_tutor_mobile/app/data/models/User.dart';

class ClassStudentController extends GetxController {
  //TODO: Implement ClassStudentController

  final classes = [
    {
      'classe': Classe(
        id: "1",
        subject: "Mathematiques",
        level: "4ieme",
        teacher: User(id: '1', name: "M. Kossi"),
      ),
      'color': Colors.blue,
      'icon': FontAwesomeIcons.squareRootVariable,
    },
    {
      'classe': Classe(
        id: "2",
        subject: "Physique",
        level: "4ieme",
        teacher: User(id: '2', name: "Mme. Adjoavi"),
      ),
      'color': Colors.green,
      'icon': FontAwesomeIcons.atom,
    },
    {
      'classe': Classe(
        id: "3",
        subject: "Chimie",
        level: "4ieme",
        teacher: User(id: '3', name: "M. Bernard"),
      ),
      'color': Colors.orange,
      'icon': FontAwesomeIcons.flaskVial,
    },
  ].obs;

  final count = 0.obs;
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

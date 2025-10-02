import 'package:get/get.dart';

class RessourcesStudentController extends GetxController {
  //TODO: Implement RessourcesStudentController

  List<Map<String, dynamic>> documents = [
    {
      'title': 'Cours de Mathématiques - Chapitre 1',
      'date': DateTime(2023, 10, 15),
      'type': 'PDF',
      'size': '2.4 MB',
    },
    {
      'title': 'Exercices de Physique',
      'date': DateTime(2023, 10, 10),
      'type': 'DOCX',
      'size': '1.8 MB',
    },
    {
      'title': 'Formulaire de Chimie',
      'date': DateTime(2023, 10, 5),
      'type': 'PDF',
      'size': '1.2 MB',
    },
  ];

  List<Map<String, dynamic>> videos = [
    {
      'title': 'Introduction aux fonctions',
      'date': DateTime(2023, 10, 12),
      'duration': '15:30',
      'thumbnailUrl':
          'https://media.slidesgo.com/storage/37813213/responsive-images/2-intro-to-piecewise-functions___media_library_original_548_308.jpg',
    },
    {
      'title': 'Les lois de Newton',
      'date': DateTime(2023, 10, 8),
      'duration': '22:15',
      'thumbnailUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuyHSGNIeL1KuRLkJo_AHT-P9KChM1hHVwCg&s',
    },
    {
      'title': 'Réactions chimiques',
      'date': DateTime(2023, 10, 3),
      'duration': '18:45',
      'thumbnailUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyFYZfGSeCoRgdlWgUqVpV0aLwuUOPZdk6zA&s',
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    documents.sort((a, b) => b['date'].compareTo(a['date']));
    videos.sort((a, b) => b['date'].compareTo(a['date']));
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

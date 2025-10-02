import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'class_student_details_controller.dart';
import 'package:scai_tutor_mobile/app/data/models/Classe.dart';

class ClassStudentDetailsView extends GetView<ClassStudentDetailsController> {
  const ClassStudentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final Classe classe = Get.arguments as Classe;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classe de ${classe.subject}', style: TextStyle(fontSize: 20)),
            Text(classe.level, style: TextStyle(fontSize: 12)),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Barre de recherche
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            color: Colors.blue.shade900,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Rechercher un cours',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),

          // Contenu défilable
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom du professeur
                  Text(
                    '${classe.teacher.name}',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Section Nouveau Exercice / Recherche
                  Text(
                    'Nouveau Exercice / Recherche',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Liste des exercices
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: Icon(
                              Icons.article,
                              color: Colors.blue.shade900,
                            ),
                            title: Text('Exercice ${index + 1}'),
                            subtitle: Text(
                              'Description de l\'exercice ${index + 1}',
                            ),
                            trailing: Text("Soumettre"),
                            onTap: () {
                              // Action lors du clic sur l'exercice
                            },
                          ),
                        );
                      },
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Section LuS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lus',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("18 Avril"),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Contenu LuS
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB3E5FC),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Suites numériques en arithmétique',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyFYZfGSeCoRgdlWgUqVpV0aLwuUOPZdk6zA&s',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.image_not_supported,
                                color: Colors.grey[600],
                                size: 40,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '16 Avril',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

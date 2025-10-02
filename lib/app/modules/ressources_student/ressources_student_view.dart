import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'ressources_student_controller.dart';

class RessourcesStudentView extends GetView<RessourcesStudentController> {
  const RessourcesStudentView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RessourcesStudentController(),
      builder: (RessourcesStudentController controller) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  // Header section with fixed height
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ressources",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tab bar (fixed height)
                  Container(
                    color: Colors.white, // Optional background color
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: "Documents"),
                        Tab(text: "Videos"),
                      ],
                    ),
                  ),

                  // Main content area (takes remaining space)
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Documents Tab
                        _buildDocumentsTab(controller),
                        // Videos Tab
                        _buildVideosTab(controller),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDocumentsTab(RessourcesStudentController controller) {
    // Handle null or empty documents list
    if (controller.documents.isEmpty) {
      return const Center(child: Text("Aucun document disponible"));
    }
    // Sort documents by date (newest first)
    controller.documents.sort((a, b) => b['date'].compareTo(a['date']));
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: controller.documents.length,
      itemBuilder: (context, index) {
        final doc = controller.documents[index];
        return _buildDocumentItem(
          title: doc['title'] ?? 'Titre inconnu',
          date: doc['date'] as DateTime? ?? DateTime.now(),
          type: doc['type'] ?? 'Fichier',
          size: doc['size'] ?? 'Taille inconnue',
        );
      },
    );
  }

  Widget _buildDocumentItem({
    required String title,
    required DateTime date,
    required String type,
    required String size,
  }) {
    // Get icon based on document type
    IconData icon;
    switch (type.toLowerCase()) {
      case 'pdf':
        icon = Icons.picture_as_pdf;
        break;
      case 'doc':
      case 'docx':
        icon = Icons.description;
        break;
      case 'xls':
      case 'xlsx':
        icon = Icons.table_chart;
        break;
      case 'ppt':
      case 'pptx':
        icon = Icons.slideshow;
        break;
      default:
        icon = Icons.insert_drive_file;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 36),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Publié le: ${DateFormat('dd MMM yyyy').format(date)}',
              style: const TextStyle(fontSize: 12),
            ),
            Text('Taille: $size', style: const TextStyle(fontSize: 12)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {
            // Handle download
          },
        ),
      ),
    );
  }

  Widget _buildVideosTab(RessourcesStudentController controller) {
    // Handle null or empty videos list
    if (controller.videos.isEmpty) {
      return const Center(child: Text("Aucune vidéo disponible"));
    }

    // Sort videos by date (newest first)
    controller.videos.sort((a, b) => b['date'].compareTo(a['date']));

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: controller.videos.length,
      itemBuilder: (context, index) {
        final video = controller.videos[index];
        return _buildVideoItem(
          title: video['title'] ?? 'Titre inconnu',
          date: video['date'] as DateTime? ?? DateTime.now(),
          duration: video['duration'] ?? 'Durée inconnue',
          thumbnailUrl: video['thumbnailUrl'] ?? '',
        );
      },
    );
  }

  Widget _buildVideoItem({
    required String title,
    required DateTime date,
    required String duration,
    required String thumbnailUrl,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video thumbnail with fallback
          if (thumbnailUrl.isNotEmpty)
            _buildThumbnail(thumbnailUrl, duration)
          else
            Container(
              height: 180,
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.videocam_off, size: 50)),
            ),

          // Video details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Publié le: ${DateFormat('dd MMM yyyy').format(date)}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(String thumbnailUrl, String duration) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            image: DecorationImage(
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              duration,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Icon(
              Icons.play_circle_filled,
              size: 50,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:scai_tutor_mobile/app/data/models/Classe.dart';

class Devoir {
  final String? id;
  final String? titre;
  final String? description;
  final String? dateDebut;
  final String? dateFin;
  final Classe? classe;

  Devoir({
    this.id,
    this.titre,
    this.description,
    this.dateDebut,
    this.dateFin,
    this.classe,
  });

  factory Devoir.fromJson(Map<String, dynamic> json) {
    return Devoir(
      id: json['id'] as String?,
      titre: json['titre'] as String?,
      description: json['description'] as String?,
      dateDebut: json['dateDebut'] as String?,
      dateFin: json['dateFin'] as String?,
      classe: json['classe'] != null ? Classe.fromJson(json['classe']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'classe': classe?.toJson(),
    };
  }
}

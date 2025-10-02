import 'package:scai_tutor_mobile/app/data/models/Devoir.dart';
import 'package:scai_tutor_mobile/app/data/models/User.dart';

class Classe {
  final String id;
  final String subject;
  final String level;
  final User teacher;
  final List<User> students;
  final List<Devoir> assignments;
  Classe({
    required this.id,
    required this.subject,
    required this.level,
    required this.teacher,
    this.students = const [],
    this.assignments = const [],
  });

  factory Classe.fromJson(Map<String, dynamic> json) {
    return Classe(
      id: json['id'] as String,
      subject: json['subject'] as String,
      level: json['level'] as String,
      teacher: User.fromJson(json['teacher']),
      students: (json['students'] as List<dynamic>)
          .map((student) => User.fromJson(student))
          .toList(),
      assignments: json['assignments'] != null
          ? (json['assignments'] as List<dynamic>)
                .map((assignment) => Devoir.fromJson(assignment))
                .toList()
          : [],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject': subject,
      'level': level,
      'teacher': teacher.toJson(),
      'students': students.map((student) => student.toJson()).toList(),
      'assignments': assignments
          .map((assignment) => assignment.toJson())
          .toList(),
    };
  }
}

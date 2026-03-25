import '../../../parent/data/models/child_model.dart';

class TeacherClassModel {
  final String className;
  final String religion;
  final List<ChildModel> students;
  final String ageGroup;

  const TeacherClassModel({
    required this.className,
    required this.religion,
    required this.students,
    required this.ageGroup
  });
}
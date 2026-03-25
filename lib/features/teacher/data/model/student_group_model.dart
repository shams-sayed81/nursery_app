import 'dart:ui';

class StudentGroupModel {
  final String id;
  final String name;
  final String description;
  final Color color;
  final bool visible;
  final List<String> studentIds;

  StudentGroupModel({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.visible,
    required this.studentIds,
  });
}
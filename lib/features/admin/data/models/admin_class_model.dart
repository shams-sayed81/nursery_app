import 'package:equatable/equatable.dart';

class AdminClassModel extends Equatable {
  final String id;
  final String name;
  final String year;
  final int studentsCount;
  final bool isActive;

  const AdminClassModel({
    required this.id,
    required this.name,
    required this.year,
    required this.studentsCount,
    required this.isActive
  });

  AdminClassModel copyWith({
    String? id,
    String? name,
    String? year,
    int? studentsCount,
    bool? isActive
  }) {
    return AdminClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      studentsCount: studentsCount ?? this.studentsCount,
      isActive: isActive?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    year,
    studentsCount,
    isActive
  ];
}
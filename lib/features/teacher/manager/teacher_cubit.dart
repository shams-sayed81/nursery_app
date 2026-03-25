import 'package:flutter_bloc/flutter_bloc.dart';
import '../../parent/data/models/child_model.dart';
import '../../parent/data/models/parent_model.dart';
import '../data/model/teacher_class_model.dart';

part 'teacher_state.dart';

class TeacherStudentsCubit extends Cubit<TeacherStudentsState> {
  TeacherStudentsCubit() : super(TeacherStudentsInitial());

  final List<ChildModel> _allStudents = [];
  final List<ParentModel> _allParents = [];

  String? selectedReligion;
  String? selectedClass;
  String? selectedYear;


  void loadParents() {
    emit(TeacherStudentsLoading());

    _allParents
      ..clear()
      ..addAll([
        ParentModel(
          id: 'p1',
          name: 'Sarah Johnson',
          email: 'sarah@mail.com',
          password: '',
          children: [
            ChildModel(
              id: '1',
              name: 'Emma',
              age: 4,
              className: 'KG1',
              religion: 'Christian',
              year: '2025',
              parentId: 'p1', classId: '',
            ),
            ChildModel(
              id: '2',
              name: 'Oliver',
              age: 5,
              className: 'KG1',
              religion: 'Christian',
              year: '2025',
              parentId: 'p1', classId: '',
            ),
          ],
        ),
      ]);

    emit(TeacherParentsLoaded(List.from(_allParents)));
  }
  void loadStudents() {
    emit(TeacherStudentsLoading());

    _allStudents
      ..clear()
      ..addAll([
        ChildModel(
          id: '0',
          name: 'Laila',
          age: 4,
          classId: 'KG1',
          parentId: 'p1',
          religion: 'Christian',
          className: 'Sunflowers',
          year: '2025',
        ),
        ChildModel(
          id: '1',
          name: 'Shams',
          age: 4,
          classId: 'KG1',
          parentId: 'p1',
          religion: 'Christian',
          className: 'Sunflowers',
          year: '2025',
        ),
        ChildModel(
          id: '2',
          name: 'Ahmed',
          age: 5,
          classId: 'KG2',
          parentId: 'p2',
          religion: 'Muslim',
          className: 'Butterflies',
          year: '2025',
        ),
      ]);

    emit(TeacherStudentsLoaded(List.from(_allStudents)));
    loadAllClasses();

  }

  void resetAllFilters() {
    selectedReligion = null;
    selectedYear = null;
    emit(TeacherStudentsLoaded(_allStudents));
  }
  void filterByReligion(String religion) {
    selectedReligion = religion;
    _applyFilters();
  }

  void filterByClass(String className) {
    selectedClass = className;
    _applyFilters();
  }

  void filterByYear(String year) {
    selectedYear = year;
    _applyFilters();
  }

  void clearFilter() {
    selectedReligion = null;
    selectedClass = null;
    selectedYear = null;
    emit(TeacherStudentsLoaded(List.from(_allStudents)));
  }

  void _applyFilters() {
    final filtered = _allStudents.where((student) {
      final matchReligion = selectedReligion == null || student.religion == selectedReligion;
      final matchClass = selectedClass == null || student.className == selectedClass;
      final matchYear = selectedYear == null || student.year == selectedYear;
      return matchReligion && matchClass && matchYear;
    }).toList();

    emit(TeacherStudentsLoaded(filtered));
  }

  String _detectReligion(List<ChildModel> students) {
    final religions = students.map((e) => e.religion).toSet();

    if (religions.length == 1) {
      return religions.first;
    } else {
      return "Mixed";
    }
  }


  void loadAllClasses() {
    emit(TeacherStudentsLoading());

    final Map<String, List<ChildModel>> grouped = {};

    for (var student in _allStudents) {
      grouped.putIfAbsent(student.className, () => []);
      grouped[student.className]!.add(student);
    }

    final classes = grouped.entries.map((entry) {
      final students = entry.value;

      return TeacherClassModel(
        className: entry.key,
        religion: _detectReligion(students),
        ageGroup: 'Year ${students.first.year}',
        students: students,
      );
    }).toList();

    emit(TeacherClassesLoaded(classes));
  }
}


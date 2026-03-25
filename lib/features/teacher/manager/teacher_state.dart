part of 'teacher_cubit.dart';

sealed class TeacherStudentsState {}

final class TeacherStudentsInitial extends TeacherStudentsState {}

final class TeacherStudentsLoading extends TeacherStudentsState {}

final class TeacherStudentsLoaded extends TeacherStudentsState {
  final List<ChildModel> students;

  TeacherStudentsLoaded(this.students);
}

final class TeacherParentsLoaded extends TeacherStudentsState {
  final List<ParentModel> parents;

  TeacherParentsLoaded( this.parents);
}

final class TeacherStudentsError extends TeacherStudentsState {}

class TeacherClassesLoaded extends TeacherStudentsState {
  final List<TeacherClassModel> classes;

  TeacherClassesLoaded(this.classes);
}
part of 'admin_cubit.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

/// Classes
class AdminClassesLoaded extends AdminState {
  final List<AdminClassModel> classes;

  AdminClassesLoaded(this.classes);
}

/// Users
class AdminUsersLoaded extends AdminState {
  final List<UserModel> users;

  AdminUsersLoaded(this.users);
}

/// Parents
class AdminParentCreated extends AdminState {}
class AdminParentsLoaded extends AdminState {
  final List<ParentModel> parents;

  AdminParentsLoaded(this.parents);
}

class AdminChildrenLoaded extends AdminState {
  final List<ChildModel> children;

  AdminChildrenLoaded(this.children);


}
class AdminTeachersLoaded extends AdminState {
  final List<TeacherModel> teachers;

  AdminTeachersLoaded(this.teachers);



}


class AdminScheduleLoaded extends AdminState {
  final List<ScheduleSlot> slots;

  AdminScheduleLoaded(this.slots);
}

class AdminScheduleError extends AdminState {
  final String message;

  AdminScheduleError(this.message);
}
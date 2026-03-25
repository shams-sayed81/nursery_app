import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/features/parent/data/models/child_model.dart';

import '../../parent/data/models/parent_model.dart';
import '../data/models/admin_class_model.dart';
import '../data/models/schedule_slot_model.dart';
import '../data/models/teacher_model.dart';
import '../data/models/user_model.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  int selectedTab = 0;

  String? selectedStudentId;

  List<String> selectedStudents = [];
  void changeTab(int index) {
    selectedTab = index;

    /// reset selection
    selectedStudentId = null;
    selectedStudents.clear();

    emit(AdminInitial());
  }

  void selectSingleStudent(String id) {
    selectedStudentId = id;
    emit(AdminInitial());
  }

  void toggleStudent(String id) {
    if (selectedStudents.contains(id)) {
      selectedStudents.remove(id);
    } else {
      selectedStudents.add(id);
    }

    emit(AdminInitial());
  }

  void toggleStudents(String id) {
    if (selectedStudents.contains(id)) {
      selectedStudents.remove(id);
    } else {
      selectedStudents.add(id);
    }

    emit(AdminInitial());
  }

  void selectAllStudents() {
    final allIds = parents
        .expand((p) => p.children)
        .map((c) => c.id)
        .toList();

    if (selectedStudents.length == allIds.length) {
      selectedStudents.clear();
    } else {
      selectedStudents = allIds;
    }

    emit(AdminInitial());
  }
  List<AdminClassModel> classes = [];

  void loadClasses() {
    classes = [
      AdminClassModel(
        isActive: false,
        id: "1",
        name: "Sunflowers",
        year: "3 - 4",
        studentsCount: 5,
      ),
      AdminClassModel(
        isActive: true,
        id: "2",
        name: "Butterflies",
        year: "4 - 5",
        studentsCount: 3,
      ),
    ];

    emit(AdminClassesLoaded(List.from(classes)));
  }

  void addClass(AdminClassModel model) {
    classes.add(model);
    emit(AdminClassesLoaded(List.from(classes)));
  }

  void deleteClass(String id) {
    classes.removeWhere((c) => c.id == id);
    emit(AdminClassesLoaded(List.from(classes)));
  }

  void updateClass(AdminClassModel updatedClass) {
    final index = classes.indexWhere((c) => c.id == updatedClass.id);

    if (index != -1) {
      classes[index] = updatedClass;
    }

    emit(AdminClassesLoaded(List.from(classes)));
  }


  int get totalStudents =>
      classes.fold(0, (sum, c) => sum + c.studentsCount);

  int get avgClassSize =>
      classes.isEmpty ? 0 : totalStudents ~/ classes.length;

  int get activeClasses => classes.length;


  final List<ParentModel> parents = [];


  void loadParents() {

    parents.addAll([
      ParentModel(
        id: "P1",
        name: "Ahmed Hassan",
        email: "ahmed.hassan@mail.com",
        password: "123456",
        children: [
          ChildModel(
            id: "C1",
            name: "Zainab Hassan",
            age: 5,
            classId: "1",
            parentId: "P1",
            religion: "Muslim",
            className: "Sunflowers",
            year: "Year 3",
            paid: 50,
            total: 50,
            paymentStatus: PaymentStatus.fullyPaid,
          ),
          ChildModel(
            id: "C2",
            name: "Yusuf Hassan",
            age: 4,
            classId: "1",
            parentId: "P1",
            religion: "Muslim",
            className: "Sunflowers",
            year: "Year 1",
            paid: 30,
            total: 50,
            paymentStatus: PaymentStatus.pending,
          ),
        ],
      ),

      ParentModel(
        id: "P2",
        name: "Sara Ali",
        email: "sara.ali@mail.com",
        password: "123456",
        children: [
          ChildModel(
            id: "C3",
            name: "Omar Ali",
            age: 3,
            classId: "2",
            parentId: "P2",
            religion: "Muslim",
            className: "Butterflies",
            year: "Year 1",
            paid: 10,
            total: 50,
            paymentStatus: PaymentStatus.overdue,
          ),
        ],
      ),

      ParentModel(
        id: "P3",
        name: "John Michael",
        email: "john@mail.com",
        password: "123456",
        children: [
          ChildModel(
            id: "C4",
            name: "Emma Michael",
            age: 4,
            classId: "2",
            parentId: "P3",
            religion: "Christian",
            className: "Butterflies",
            year: "Year 2",
            paid: 50,
            total: 50,
            paymentStatus: PaymentStatus.fullyPaid,
          ),
          ChildModel(
            id: "C5",
            name: "Noah Michael",
            age: 5,
            classId: "1",
            parentId: "P3",
            religion: "Christian",
            className: "Sunflowers",
            year: "Year 3",
            paid: 25,
            total: 50,
            paymentStatus: PaymentStatus.pending,
          ),
        ],
      ),
    ]);

    emit(AdminParentsLoaded(List.from(parents)));
  }



  void createParent(ParentModel parent) {
    parents.add(parent);
    emit(AdminParentCreated());
  }



  final List<UserModel> users = [];

  void loadUsers() {
    emit(AdminUsersLoaded(List.from(users)));
  }

  void addUser(UserModel user) {
    users.add(user);
    emit(AdminUsersLoaded(List.from(users)));
  }

  void deleteUser(String id) {
    users.removeWhere((u) => u.id == id);
    emit(AdminUsersLoaded(List.from(users)));
  }

  void updateUser(UserModel user) {
    final index = users.indexWhere((u) => u.id == user.id);

    if (index != -1) {
      users[index] = user;
    }

    emit(AdminUsersLoaded(List.from(users)));
  }



  final List<ChildModel> children = [];

  void loadChildren() {
    children.clear();

    children.addAll([
      ChildModel(
        id: "1",
        name: "Noah Brown",
        age: 4,
        classId: "1",
        parentId: "P1",
        religion: "Muslim",
        className: "Sunflowers",
        year: "3 - 4",
        paid: 50,
        total: 50,
        paymentStatus: PaymentStatus.fullyPaid,
      ),
      ChildModel(
        id: "2",
        name: "Layla Khalil",
        age: 3,
        classId: "1",
        parentId: "P2",
        religion: "Muslim",
        className: "Sunflowers",
        year: "3 - 4",
        paid: 20,
        total: 50,
        paymentStatus: PaymentStatus.pending,
      ),
      ChildModel(
        id: "3",
        name: "Emma Johnson",
        age: 4,
        classId: "2",
        parentId: "P3",
        religion: "Christian",
        className: "Butterflies",
        year: "4 - 5",
        paid: 20,
        total: 50,
        paymentStatus: PaymentStatus.overdue,
      ),
    ]);

    emit(AdminChildrenLoaded(List.from(children)));
  }

  final List<TeacherModel> teachers = [];

  void loadTeachers() {
    teachers.clear();

    teachers.addAll([
      TeacherModel(
        id: "T1",
        name: "Mr. John",
        isActive: true,
        classesCount: 2,
      ),
      TeacherModel(
        id: "T2",
        name: "Ms. Sarah",
        isActive: false,
        classesCount: 1,
      ),
    ]);

    emit(AdminTeachersLoaded(List.from(teachers)));
  }

  void addTeacher(TeacherModel teacher) {
    teachers.add(teacher);
    emit(AdminTeachersLoaded(List.from(teachers)));
  }

  void deleteTeacher(String id) {
    teachers.removeWhere((t) => t.id == id);
    emit(AdminTeachersLoaded(List.from(teachers)));
  }

  void updateTeacher(TeacherModel teacher) {
    final index = teachers.indexWhere((t) => t.id == teacher.id);

    if (index != -1) {
      teachers[index] = teacher;
    }

    emit(AdminTeachersLoaded(List.from(teachers)));
  }
  int get totalTeachers => teachers.length;

  int get activeTeachers =>
      teachers.where((t) => t.isActive).length;

  int get totalClassesForTeachers =>
      teachers.fold(0, (sum, t) => sum + t.classesCount);





  final List<ScheduleSlot> slots = [];

  void loadSchedule() {
    slots.clear();

    slots.addAll([
      ScheduleSlot(
        id: "1",
        day: "Monday",
        startTime: "7:00 AM",
        endTime: "8:00 AM",
        teacherId: "T1",
        classId: "1",
      ),
    ]);

    emit(AdminScheduleLoaded(List.from(slots)));
  }

  bool isConflict({
    required String day,
    required String start,
    required String end,
    String? teacherId,
  }) {
    return slots.any((s) {
      return s.day == day &&
          s.startTime == start &&
          s.endTime == end &&
          (teacherId != null && s.teacherId == teacherId);
    });
  }

  void addSchedule(ScheduleSlot slot) {
    if (isConflict(
      day: slot.day,
      start: slot.startTime,
      end: slot.endTime,
      teacherId: slot.teacherId,
    )) {
      emit(AdminScheduleError("Time slot already booked ❌"));
      return;
    }

    slots.add(slot);
    emit(AdminScheduleLoaded(List.from(slots)));
  }

  List<ScheduleSlot> getTeacherSchedule(String teacherId) {
    return slots.where((s) => s.teacherId == teacherId).toList();
  }

  List<ScheduleSlot> getClassSchedule(String classId) {
    return slots.where((s) => s.classId == classId).toList();
  }

  void deleteSchedule(String id) {
    slots.removeWhere((s) => s.id == id);
    emit(AdminScheduleLoaded(List.from(slots)));
  }
}
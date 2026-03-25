import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/teacher_model.dart';
import '../manager/admin_cubit.dart';
import 'management_view.dart';

class TeacherManagementView extends StatefulWidget {
  const TeacherManagementView({super.key});
static const String routeName='/teacher-management';
  @override
  State<TeacherManagementView> createState() => _TeacherManagementViewState();
}

class _TeacherManagementViewState extends State<TeacherManagementView> {

  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    context.read<AdminCubit>().loadTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        if (state is! AdminTeachersLoaded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final teachers = state.teachers;
        final cubit = context.read<AdminCubit>();

        /// 🔹 SEARCH
        final filteredTeachers = teachers.where((teacher) {
          return teacher.name
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
        }).toList();

        return ManagementView<TeacherModel>(
          title: "Teachers Management",
          items: filteredTeachers,

          /// 🔹 STATS
          stats: [
            StatModel(
              title: "Total Teachers",
              value: teachers.length.toString(),
              icon: Icons.people,
              color: Colors.blue,
            ),
            StatModel(
              title: "Active",
              value: teachers
                  .where((t) => t.isActive)
                  .length
                  .toString(),
              icon: Icons.check_circle,
              color: Colors.green,
            ),
            StatModel(
              title: "Total Classes",
              value: cubit.totalClassesForTeachers.toString(),
              icon: Icons.class_,
              color: Colors.purple,
            ),
            StatModel(
              title: "Total Students",
              value: cubit.totalStudents.toString(),
              icon: Icons.groups,
              color: Colors.orange,
            ),
          ],

          /// 🔹 SEARCH
          showSearch: true,
          onSearch: (value) {
            setState(() => searchQuery = value);
          },

          /// 🔹 CREATE
          onCreatePressed: () {
            // TODO: create teacher dialog
          },

          /// 🔹 ITEM
          itemBuilder: (context, teacher) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const CircleAvatar(child: Icon(Icons.person)),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          teacher.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${teacher.classesCount} classes"),
                      ],
                    ),
                  ),

                  Chip(
                    label: Text(
                      teacher.isActive ? "Active" : "Inactive",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                    teacher.isActive ? Colors.green : Colors.grey,
                  ),

                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),

                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cubit.deleteTeacher(teacher.id);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
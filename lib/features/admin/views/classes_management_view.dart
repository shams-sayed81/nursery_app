import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../data/models/admin_class_model.dart';
import '../manager/admin_cubit.dart';
import '../widgets/create_edit_classes_dialog.dart';
import 'management_view.dart';


class ClassesManagementView extends StatefulWidget {
  const ClassesManagementView({super.key});
  static const String routeName = '/class-management';

  @override
  State<ClassesManagementView> createState() => _ClassesManagementViewState();
}

class _ClassesManagementViewState extends State<ClassesManagementView> {
  @override
  void initState() {
    context.read<AdminCubit>().loadClasses();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        if (state is! AdminClassesLoaded) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final classes = state.classes;
        final cubit = context.read<AdminCubit>();

        return ManagementView<AdminClassModel>(
          title: "Classes Management",
          items: classes,

          stats: [
            StatModel(
              title: "Active Classes",
              value: cubit.activeClasses.toString(),
              icon: Icons.check_circle,
              color: Colors.green,
            ),
            StatModel(
              title: "Total Students",
              value: cubit.totalStudents.toString(),
              icon: Icons.people,
              color: Colors.blue,
            ),
            StatModel(
              title: "Avg Size",
              value: cubit.avgClassSize.toString(),
              icon: Icons.bar_chart,
              color: Colors.purple,
            ),
            StatModel(
              title: "Unassigned",
              value: '5',
              icon: Icons.warning,
              color: Colors.orange,
            ),
          ],

          onCreatePressed: () {
            showDialog(
              context: context,
              builder: (_) => const CreateEditClassDialog(),
            );
          },

          itemBuilder: (context, model) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const CircleAvatar(child: Icon(Icons.home)),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${model.year} • ${model.studentsCount} students"),
                      ],
                    ),
                  ),

                  Chip(
                    label: Text(
                      model.isActive ? "Active" : "Inactive",
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                    model.isActive ? Colors.green : Colors.grey,
                  ),

                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) =>
                            CreateEditClassDialog(classModel: model),
                      );
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cubit.deleteClass(model.id);
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

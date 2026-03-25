import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/core/widgets/custom_tab_bar.dart';

import '../manager/admin_cubit.dart';

class PlanSetupView extends StatelessWidget {
  const PlanSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [

          CustomTabBar(
         indicatorColors: [
           Colors.blueGrey,
           Colors.blueGrey,
           Colors.blueGrey,
         ],
            tabs: const [
              Tab(text: "Single"),
              Tab(text: "Multiple"),
              Tab(text: "All"),
            ],
          ),

          vGap(10),

          Expanded(
            child: TabBarView(
              children: [
                SingleStudentTab(),
                MultipleStudentsTab(),
                AllStudentsTab(),
              ],
            ),
          ),
          vGap(10),
          CustomButton(
            onPressed: () {


            },
            text: 'Save Plan',
          )
        ],
      ),
    );
  }
}


class SingleStudentTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdminCubit>();

    final students = cubit.parents
        .expand((p) => p.children)
        .toList();

    return DropdownButtonFormField<String>(
      initialValue: cubit.selectedStudentId,
      hint: const Text("Select Student"),
      items: students.map((s) {
        return DropdownMenuItem(
          value: s.id,
          child: Text(s.name),
        );
      }).toList(),
      onChanged: (val) {
        cubit.selectSingleStudent(val!);
      },
    );
  }
}

class MultipleStudentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdminCubit>();

    final students = cubit.parents
        .expand((p) => p.children)
        .toList();

    return Column(
      children: [

        /// 🔥 Select All
        Row(
          children: [
            Checkbox(
              value: cubit.selectedStudents.length ==
                  students.length,
              onChanged: (_) {
                cubit.selectAllStudents();
              },
            ),
            const Text("Select All"),
          ],
        ),

        const Divider(),

        /// 🔹 List
        Expanded(
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];

              return CheckboxListTile(
                value: cubit.selectedStudents
                    .contains(student.id),
                title: Text(student.name),
                onChanged: (_) {
                  cubit.toggleStudent(student.id);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class AllStudentsTab extends StatelessWidget {
  const AllStudentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final students = context
        .read<AdminCubit>()
        .parents
        .expand((p) => p.children)
        .toList();

    return Center(
      child: Text("Applies to ${students.length} students"),
    );
  }
}


List<String> getSelectedStudents(AdminCubit cubit) {
  if (cubit.selectedTab == 0) {
    return [cubit.selectedStudentId!];
  } else if (cubit.selectedTab == 1) {
    return cubit.selectedStudents;
  } else {
    return cubit.parents
        .expand((p) => p.children)
        .map((c) => c.id)
        .toList();
  }
}
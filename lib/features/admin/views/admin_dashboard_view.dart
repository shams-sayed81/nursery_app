import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/admin/views/create_parent_account_view.dart';
import 'package:gym_app/features/admin/views/fees_view.dart';
import 'package:gym_app/features/admin/views/parents_view.dart';
import 'package:gym_app/features/admin/views/schedule_management_view.dart';
import 'package:gym_app/features/admin/views/students_list_view.dart';
import 'package:gym_app/features/admin/views/teacher_management_view.dart';
import 'package:gym_app/features/admin/views/user_management_view.dart';
import 'package:gym_app/features/admin/widgets/custom_list_tile.dart';

import '../../../generated/l10n.dart';
import '../../parent/ui/widgets/custom_home_container.dart';
import '../manager/admin_cubit.dart';
import 'classes_management_view.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  static const String routeName = '/admin';

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  @override
  void initState() {
    super.initState();

    final cubit = context.read<AdminCubit>();

    cubit.loadChildren();
    cubit.loadTeachers();
    cubit.loadClasses();
    cubit.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final cubit = context.read<AdminCubit>();

    final list = [
      CustomHomeContainer(
        color: Colors.indigo,
        title: cubit.children.length.toString(),
        subTitle: s.children,
        icon: Icons.school_outlined,
        backgroundColor: Colors.white,
      ),
      CustomHomeContainer(
        color: Colors.deepPurple,
        title: cubit.totalTeachers.toString(),
        subTitle: s.teachers,
        icon: Icons.people_alt_outlined,
        backgroundColor: Colors.white,
      ),
      CustomHomeContainer(
        color: Colors.teal,
        title: cubit.classes.length.toString(),
        subTitle: s.classes,
        icon: Icons.holiday_village_outlined,
        backgroundColor: Colors.white,
      ),
      CustomHomeContainer(
        color: Colors.green,
        title: cubit.parents.length.toString(),
        subTitle: s.parents,
        icon: Icons.people_alt_outlined,
        backgroundColor: Colors.white,
      ),
    ];
    final listTiles = [
      CustomListTile(
        title: s.tuition_fees,
        subtitle: s.payment_plans_installments,
        btnText: s.manage,
        icon: Icons.attach_money_rounded,
        color: Colors.green,
        onPressed: () => context.push(FeesView.routeName),
      ),
      CustomListTile(
        title: s.classes,
        subtitle: s.manage_rooms_students,
        btnText: s.edit,
        icon: Icons.holiday_village_outlined,
        color: Colors.teal,
        onPressed: () => context.push(ClassesManagementView.routeName),
      ),
      CustomListTile(
        title: s.users,
        subtitle: s.approve_parents_teachers,
        btnText: s.edit,
        icon: Icons.people_alt_outlined,
        color: Colors.orange,
        onPressed: () => context.push(UsersManagementView.routeName),
      ),
      CustomListTile(
        title: s.teachers,
        subtitle: s.manage_teacher_profiles,
        btnText: s.edit,
        icon: Icons.people_alt_outlined,
        color: Colors.pink,
        onPressed: () => context.push(TeacherManagementView.routeName),
      ),
      CustomListTile(
        title: s.children,
        subtitle: s.manage_child_profiles,
        btnText: s.edit,
        icon: Icons.school_outlined,
        color: Colors.indigo,
        onPressed: ()  => context.push(StudentsListView.routeName),
      ),
      CustomListTile(
        title: s.create_parent_account,
        subtitle: s.add_new_parent_account,
        btnText: s.create,
        icon: Icons.person_add_alt,
        color: Colors.green,
        onPressed: () => context.push(CreateParentAccountView.routeName),
      ),
      CustomListTile(
        title: s.view_parent_accounts,
        subtitle: s.view_all_parent_accounts,
        btnText: s.view,
        icon: Icons.person_add_alt,
        color: Colors.green,
        onPressed: ()  => context.push(ParentsView.routeName),
      ),
      CustomListTile(
        title: s.manage_schedules,
        subtitle: s.manage_class_schedules,
        btnText: s.manage,
        icon: Icons.school_outlined,
        color: Colors.indigo,
        onPressed: () => context.push(ScheduleManagementView.routeName),
      ),
    ];

    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              s.admin_dashboard,
              style: AppTextStyles.font16BlackBold,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: list,
                ),
                Text(s.management, style: AppTextStyles.font16BlackBold),
                vGap(10),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => listTiles[index],
                    separatorBuilder: (context, index) => vGap(10),
                    itemCount: listTiles.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

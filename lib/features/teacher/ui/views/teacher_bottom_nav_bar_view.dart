import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/theme/app_colors.dart';
import '../../../parent/manager/navigation bar/bottom_nav_bar_cubit.dart';
import '../widgets/chat_tab.dart';
import '../widgets/dashboard_tab.dart';
import '../widgets/teacher_bottom_nav_bar_view_body.dart';
import '../widgets/update_tab.dart';

class TeacherBottomNavBarView extends StatelessWidget {
  const TeacherBottomNavBarView({super.key});
  static const String routeName = '/teacher-home';
  @override
  Widget build(BuildContext context) {
    List<Widget> homeBodies = [
      DashboardTab(),
      UpdateActivityTab(),
      TeacherChatTab(),
    ];

    return BlocProvider(
      create: (_) => BottomNavBarCubit(),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: AppColors.primary,
            extendBody: false,
            body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
              builder: (context, state) {
                final cubit = context.read<BottomNavBarCubit>();
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: homeBodies[cubit.currentIndex],
                );
              },
            ),
            bottomNavigationBar: TeacherBottomNavBarViewBody(),
          ),
        ),
      ),
    );

  }
}

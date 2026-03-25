import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../parent/manager/navigation bar/bottom_nav_bar_cubit.dart';

class TeacherBottomNavBarViewBody extends StatelessWidget {
  const TeacherBottomNavBarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavBarCubit>();
        final s=S.of(context);

        return BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: 40,
          elevation: 0,
          currentIndex: cubit.currentIndex,
          onTap: cubit.changeIndex,
          backgroundColor: AppColors.primary,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: AppColors.grey,
          items:  [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: s.home),
            BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded), label: s.update),
            BottomNavigationBarItem(icon: Icon(Icons.messenger_outline), label: s.chat),
          ],
        );
      },
    );
  }
}

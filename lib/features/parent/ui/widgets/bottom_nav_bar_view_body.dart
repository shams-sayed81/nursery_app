import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/theme/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/navigation bar/bottom_nav_bar_cubit.dart';

class BottomNavBarViewBody extends StatelessWidget {
  const BottomNavBarViewBody({super.key});

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
            BottomNavigationBarItem(icon: Icon(Icons.photo_camera_back), label: s.gallery),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: s.chat),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label:s.updates),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../teacher/ui/widgets/chat_tab.dart';
import '../../manager/navigation bar/bottom_nav_bar_cubit.dart';
import '../widgets/bottom_nav_bar_view_body.dart';
import '../widgets/chat_tab.dart';
import '../widgets/gallery_tab.dart';
import '../widgets/home_tab.dart';
import '../widgets/updates_tap.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    List<Widget> homeBodies = [
      HomeTab(),
      GalleryTab(),
      ChatTab(title: "Ms. Teacher", subtitle: "Online", avatarLetter: "M"),
      UpdatesTap(isTap: true),
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
            bottomNavigationBar: BottomNavBarViewBody(),
          ),
        ),
      ),
    );
  }
}

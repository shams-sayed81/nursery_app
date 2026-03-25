import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/parent/ui/views/notifications_view.dart';
import 'package:gym_app/features/parent/ui/widgets/analytics_select_child.dart';
import 'package:gym_app/features/parent/ui/widgets/select_child_screen.dart';
import 'package:gym_app/features/parent/ui/widgets/tuition_screen.dart';
import 'package:gym_app/features/parent/ui/widgets/updates_tap.dart';

import '../../../../generated/l10n.dart';
import '../../manager/navigation bar/bottom_nav_bar_cubit.dart';
import 'custom_home_container.dart';
import 'mood_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final list = [
      InkWell(
        onTap: () {},
        child: CustomHomeContainer(
          color: Colors.deepOrange,
          title: s.meals,
          subTitle: 'subTitle',
          icon: Icons.restaurant,
          backgroundColor: Color(0xFFFAE8E1),
        ),
      ),
      InkWell(
        onTap: () {},
        child: CustomHomeContainer(
          color: Colors.blue,
          title: s.nap,
          subTitle: 'subTitle',
          icon: Icons.nightlight_outlined,
          backgroundColor: Color(0xFFDAE7F6),
        ),
      ),
      InkWell(
        onTap: () => context.push(UpdatesTap.routeName),
        child: CustomHomeContainer(
          color: Colors.purple,
          title: s.activity,
          subTitle: 'subTitle',
          icon: Icons.star_outline,
          backgroundColor: Color(0xFFF1E3FA),
        ),
      ),
      InkWell(
        onTap: () => context.push(MoodScreen.routeName),
        child: CustomHomeContainer(
          color: Colors.green,
          title: s.mood,
          subTitle: 'subTitle',
          icon: Icons.face,
          backgroundColor: Color(0xFFE8FAE4),
        ),
      ),
    ];
    final actions = [
      buildCard(
        icon: Icons.calendar_month,
        title: s.calendar,
        color: AppColors.emerald,
        onTap: () {},
      ),
      buildCard(
        icon: Icons.photo,
        title: s.photos,
        color: Colors.red,
        onTap: () => context.read<BottomNavBarCubit>().changeIndex(1),
      ),
      buildCard(
        icon: Icons.chat_bubble_outline,
        title: s.chat,
        color: AppColors.babyBlue,
        onTap: () => context.read<BottomNavBarCubit>().changeIndex(2),
      ),
      buildCard(
        icon: Icons.attach_money_outlined,
        title: s.tuition,
        color: Colors.green,
        onTap: () => context.push(TuitionScreen.routeName),
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(s.welcome, style: AppTextStyles.font16BlackBold),
                IconButton(
                  onPressed: () => context.push(NotificationsView.routeName),
                  icon: Icon(Icons.notifications_none, color: AppColors.grey),
                ),
              ],
            ),
          ),
          vGap(10),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: list,
          ),
          vGap(10),
          Text(s.quick_actions, style: AppTextStyles.font16BlackBold),
          vGap(10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: actions
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(width: 120.w, child: e),
                    ),
                  )
                  .toList(),
            ),
          ),
          vGap(10),
          InkWell(
         onTap:() => context.push(AnalyticsSelectChildScreen.routeName),
            child: Container(
              decoration: AppDecorations.containerDecoration,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.analytics_outlined,
                    color: Colors.indigo,
                    size: 35.sp,
                  ),
                  hGap(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.view_analytics,
                        style: AppTextStyles.font16BlackBold,
                      ),
                      Text(
                        s.detailed_insights_progress,
                        style: AppTextStyles.font14GreyRegular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          vGap(10),
          InkWell(
            onTap: () => context.push(SelectChildScreen.routeName),
            child: Container(
              decoration: AppDecorations.containerDecoration,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_month, color: Colors.purple, size: 35.sp),
                  hGap(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.class_schedule,
                        style: AppTextStyles.font16BlackBold,
                      ),
                      Text(
                        s.view_weekly_timetable,
                        style: AppTextStyles.font14GreyRegular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: AppDecorations.containerDecoration,
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Icon(icon, color: color, size: 30.sp),
          subtitle: Center(
            child: Text(title, style: AppTextStyles.font14BlackRegular),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/features/parent/ui/widgets/past_activities_listview.dart';
import 'package:gym_app/features/parent/ui/widgets/today_view.dart';
import 'package:gym_app/features/parent/ui/widgets/weekly_plan_listview.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_tab_bar.dart';
import '../../../../generated/l10n.dart';

class UpdatesTap extends StatelessWidget {
  final bool isTap;
  const UpdatesTap({super.key, this.isTap = false});

  static const String routeName = '/update-tap';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: isTap? null : IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_outlined)),
        backgroundColor: Colors.transparent,
        title: Text(s.daily_updates, style: AppTextStyles.font16BlackBold),
        actions: [   IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none, color: AppColors.grey),
        ),],
      ),
      backgroundColor: AppColors.primary,
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: isTap? const EdgeInsets.all(0) : const EdgeInsets.all(16) ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(s.activities, style: AppTextStyles.font024BlackBold),
              vGap(10),
              CustomTabBar(
                tabs: [
                  Tab(text: s.today),
                  Tab(text: s.schedule),
                  Tab(text: s.history),
                ],
                indicatorColors: const [
                  Colors.purple,
                  Colors.pink,
                  Colors.indigo,
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TodayView(),
                    WeeklyPlanListview(),
                    PastActivitiesListview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

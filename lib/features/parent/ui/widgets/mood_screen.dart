import 'package:flutter/material.dart';
import 'package:gym_app/features/parent/ui/widgets/past_activities_listview.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_tab_bar.dart';
import '../../../../generated/l10n.dart';
import 'current_mood_tabbar_view.dart';
import 'mood_chart_screen.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  static const String routeName='/mood-screen';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body:  DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.daily_updates, style: AppTextStyles.font16BlackBold),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none, color: AppColors.grey),
                  ),
                ],
              ),
            ),
            vGap(10),
            Text(s.activities, style: AppTextStyles.font024BlackBold),
            vGap(10),
            CustomTabBar(
              tabs: [
                Tab(text: s.today),
                Tab(text: s.trends),
                Tab(text: s.history),
              ],
              indicatorColors: const [Colors.purple, Colors.pink, Colors.indigo],
            ),
            Expanded(child:
            TabBarView(children: [
              CurrentMoodView(mood: Mood.crying,),
              MoodChartCard(),
              PastActivitiesListview(),

            ],
            )),
          ],
        ),
      ),
    );
  }
}

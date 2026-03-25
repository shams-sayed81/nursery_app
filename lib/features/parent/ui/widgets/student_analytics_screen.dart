import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_tab_bar.dart';

import '../../../../generated/l10n.dart';
import '../../data/models/child_model.dart';
import 'bar_chart.dart';

class StudentAnalyticsScreen extends StatelessWidget {
  final ChildModel child;

  const StudentAnalyticsScreen({super.key, required this.child});

  static const String routeName = '/analytics';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: Colors.transparent,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(s.student_analytics, style: AppTextStyles.font16BlackBold),
              vGap(5),
              Text(child.name, style: AppTextStyles.font14GreyRegular),
            ],
          ),
        ),
        body: DefaultTabController(
          length: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTabBar(

                  tabs: [
                    Tab(text: s.overview),
                    Tab(text: s.attendance),
                    Tab(text: s.meals),
                    Tab(text: s.mood),
                    Tab(text: s.activities),
                    Tab(text: s.nap_time),
                  ],
                  indicatorColors: [
                    Colors.purple,
                    Colors.purpleAccent,
                    Colors.blue,
                    Colors.indigo,
                    Colors.lightGreen,
                    Colors.brown,
                  ],
                ),
                vGap(10),
                Expanded(
                  child: TabBarView(
                    children: [
                      OverviewTab(),
                      AttendanceTab(),
                      MealsTab(),
                      MoodTab(),
                      ActivitiesTab(),
                      NapTimeTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final list = [
      buildCard(
        title: s.attendance_rate,
        percent: 0,
        subtitle: s.last_30_days,
        color: Colors.green,
      ),
      buildCard(
        title: s.activity_logs,
        percent: 0,
        subtitle: s.total_records,
        color: Colors.indigo,
      ),
      buildCard(
        title: s.eating_average,
        percent: 0,
        subtitle: s.of_meals,
        color: Colors.yellow,
      ),
      buildCard(
        title: s.happy_rate,
        percent: 0,
        subtitle: s.positive_mood,
        color: Colors.pink,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.bar_chart, color: Colors.black),
            hGap(5),
            Text(s.overview_summary, style: AppTextStyles.font16BlackBold),
          ],
        ),
        vGap(10),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          children: list,
        ),
        vGap(10),
        Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.quick_stats, style: AppTextStyles.font16BlackBold),
                vGap(5),
                CustomListTile(
                  title: s.total_attendance_records,
                  number: 2,
                  color: Colors.green,
                ),
                CustomListTile(
                  title: s.total_meals_tracked,
                  number: 2,
                  color: Colors.orangeAccent,
                ),
                CustomListTile(
                  title: s.mood_records,
                  number: 2,
                  color: Colors.pink,
                ),
                CustomListTile(
                  title: s.activities_participated,
                  number: 2,
                  color: Colors.indigo,
                ),
                CustomListTile(
                  title: s.total_nap_times,
                  number: 2,
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard({
    required String title,
    required double percent,
    required String subtitle,
    required Color color,
  }) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.font16BlackRegular.copyWith(color: color),
            ),
            vGap(5),
            Text('$percent %', style: AppTextStyles.font16BlackBold),
            vGap(5),
            Text(subtitle, style: AppTextStyles.font12GreyRegular),
          ],
        ),
      ),
    );
  }
}

class AttendanceTab extends StatelessWidget {
  const AttendanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.calendar_month, color: Colors.black),
            hGap(5),
            Text(s.attendance_analysis, style: AppTextStyles.font16BlackBold),
          ],
        ),
        vGap(10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 2.5,
          children: [
            CustomCard(title: s.present, number: 1, color: Colors.green),
            CustomCard(title: s.absent, number: 1, color: Colors.red),
            CustomCard(title: s.late, number: 1, color: Colors.orange),
            CustomCard(title: s.attendance_rate, number: 1, color: Colors.teal),
          ],
        ),
        vGap(10),
        Card(
          color: Colors.white,
          elevation: 5,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(s.last_14_days, style: AppTextStyles.font16BlackBold,),
                vGap(10),
                AnalyticsBarChart(
                  values: [1, 1, 0, 1, 1, 1, 0],
                  labels: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                  color: Colors.green,
                  maxY: 1,
                ),
              ],
            ),
          ) ,

        )
      ],
    );
  }
}

class MealsTab extends StatelessWidget {
  const MealsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s= S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.restaurant_menu, color: Colors.black),
            hGap(5),
            Text(s.eating_habits, style: AppTextStyles.font16BlackBold),
          ],
        ),
        vGap(10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 2.5,
          children: [
            CustomCard(title: s.total_meals, number: 1, color: Colors.black),
            CustomCard(title: s.eating_average, number: 1, color: Colors.teal),
          ],
        ),
        vGap(10),
        Card(
          color: Colors.white,
          elevation: 5,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(s.last_14_days, style: AppTextStyles.font16BlackBold,),
                vGap(10),
                AnalyticsBarChart(
                  values: [1, 1, 0, 1, 1, 1, 0],
                  labels: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                  color: Colors.teal,
                  maxY: 1,
                ),


              ],
            ),
          ) ,

        ),
        vGap(10),
        Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.by_meal_type, style: AppTextStyles.font16BlackBold),
                vGap(5),

                CustomListTile(
                  icon: '🍳',
                  title: s.breakfast,
                  number: 2,
                  color: Colors.orangeAccent,
                ),

                CustomListTile(
                  icon: '🍽️',
                  title: s.lunch,
                  number: 2,
                  color: Colors.indigo,
                ),
                CustomListTile(
                  icon: '🍪',
                  title: s.snack,
                  number: 2,
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MoodTab extends StatelessWidget {
  const MoodTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.emoji_emotions_outlined, color: Colors.black),
            hGap(5),
            Text(s.mood_tracking, style: AppTextStyles.font16BlackBold),
          ],
        ),
        vGap(10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 2.5,
          children: [
            CustomCard(title: s.total_records, number: 1, color: Colors.black),
            CustomCard(title: s.positive_rate, number: 1, color: Colors.green),
          ],
        ),
        vGap(10),
        Card(
          color: Colors.white,
          elevation: 5,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(s.mood_distribution, style: AppTextStyles.font16BlackBold,),
                vGap(10),
                AnalyticsBarChart(
                  values: [1, 1, 0, 1, 1, 1, 0],
                  labels: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
                  color: Colors.blueAccent,
                  maxY: 1,
                ),


              ],
            ),
          ) ,

        ),
        vGap(10),
        Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(s.by_meal_type, style: AppTextStyles.font16BlackBold),
                vGap(5),

                CustomListTile(
                  icon: '😊',
                  title: s.happy,
                  number: 2,
                  color: Colors.indigoAccent,
                ),

                CustomListTile(
                  icon: '😐',
                  title: s.neutral,
                  number: 2,
                  color: Colors.deepPurple,
                ),
                CustomListTile(
                  icon: '😥',
                  title: s.sad,
                  number: 2,
                  color: Colors.orange,
                ),
                CustomListTile(
                  icon: '😭',
                  title: s.crying,
                  number: 2,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActivitiesTab extends StatelessWidget {
  const ActivitiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s= S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.emoji_emotions_outlined, color: Colors.black),
            hGap(5),
            Text(s.mood_tracking, style: AppTextStyles.font16BlackBold),
          ],
        ),
        vGap(10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 2.5,
          children: [
            CustomCard(title: s.total_records, number: 1, color: Colors.black),
            CustomCard(title: s.positive_rate, number: 1, color: Colors.green),
          ],
        ),
        vGap(10),
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.top_5_activities, style: AppTextStyles.font16BlackBold,),
                  vGap(15),
                  Text(s.no_activities_recorded, style: AppTextStyles.font14GreyRegular,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class NapTimeTab extends StatelessWidget {
  const NapTimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s= S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.nightlight_outlined, color: Colors.black),
            hGap(5),
            Text(s.nap_time_analysis, style: AppTextStyles.font16BlackBold),
          ],
        ),
        vGap(10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 2.5,
          children: [
            CustomCard(title: s.total_naps, number: 1, color: Colors.black),
            CustomCard(title: s.average_duration, number: 1, color: Colors.purple),
          ],
        ),
        vGap(10),
        SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.recent_nap_times, style: AppTextStyles.font16BlackBold,),
                  vGap(15),
                  Text(s.no_nap_records, style: AppTextStyles.font14GreyRegular,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String? icon;
  final String title;
  final double number;
  final Color color;
  const CustomListTile({
    super.key,
    this.icon,
    required this.title,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Text(icon!, style: AppTextStyles.font14BlackRegular)
          : null,
      title: Text(title, style: AppTextStyles.font14BlackRegular),
      trailing: Container(
        decoration: AppDecorations.containerDecoration.copyWith(
          color: color.withValues(alpha: 0.2),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          number.toString(),
          style: AppTextStyles.font14GreyRegular.copyWith(color: color),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final double number;
  final Color color;
  const CustomCard({
    super.key,
    required this.title,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.font12GreyRegular),
            vGap(5),
            Text(
              number.toString(),
              style: AppTextStyles.font16BlackBold.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

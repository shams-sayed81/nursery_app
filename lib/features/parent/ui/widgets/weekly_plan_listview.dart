import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/parent/ui/widgets/weekly_plan_card.dart';

import '../../../../generated/l10n.dart';

class WeeklyPlanListview extends StatelessWidget {
  const WeeklyPlanListview({super.key});

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    final List<WeeklyPlanModel> weeklyPlans = [
      WeeklyPlanModel(
        day: "Monday",
        title: "Sensory Play",
        time: "10:00 AM",
        icon: Icons.sentiment_satisfied_alt,
        accentColor: Colors.purple,
      ),
      WeeklyPlanModel(
        day: "Tuesday",
        title: "Finger Painting",
        time: "10:00 AM",
        icon: Icons.palette,
        accentColor: Colors.pink,
      ),
      WeeklyPlanModel(
        day: "Wednesday",
        title: "Music & Movement",
        time: "10:00 AM",
        icon: Icons.music_note,
        accentColor: Colors.purple,
      ),
      WeeklyPlanModel(
        day: "Thursday",
        title: "Story Time",
        time: "10:00 AM",
        icon: Icons.menu_book,
        accentColor: Colors.pink,
      ),
      WeeklyPlanModel(
        day: "Friday",
        title: "Water Play",
        time: "10:00 AM",
        icon: Icons.sentiment_very_satisfied,
        accentColor: Colors.purple,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vGap(10),
        Text(s.weekly_plan, style: AppTextStyles.font16BlackBold,),
        vGap(10),
        Expanded(
          child: ListView.separated(
            itemCount: weeklyPlans.length,
            separatorBuilder: (_, __) => vGap(10),
            itemBuilder: (context, index) {
              return WeeklyPlanCard(
                plan: weeklyPlans[index],
              );
            },
          ),
        )
      ],
    );
  }
}

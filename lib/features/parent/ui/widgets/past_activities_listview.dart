import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../../../generated/l10n.dart';
import 'activity_card.dart';

class PastActivitiesListview extends StatelessWidget {
  const PastActivitiesListview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PastActivityCard> activities = [
      PastActivityCard(
        icon: Icons.emoji_emotions,
        iconColor: Colors.orange,
        title: "Block Building",
        date: "Sat, Feb 21",
        status: "Participated well",
      ),
      PastActivityCard(
        icon: Icons.music_note,
        iconColor: Colors.purple,
        title: "Nursery Rhymes",
        date: "Fri, Feb 20",
        status: "Had so much fun!",
      ),
      PastActivityCard(
        icon: Icons.menu_book,
        iconColor: Colors.blue,
        title: "Color Sorting",
        date: "Thu, Feb 19",
        status: "Very focused",
      ),
      PastActivityCard(
        icon: Icons.palette,
        iconColor: Colors.pink,
        title: "Clay Modeling",
        date: "Wed, Feb 18",
        status: "Showed creativity",
      ),
      PastActivityCard(
        icon: Icons.music_video,
        iconColor: Colors.purple,
        title: "Group Dance",
        date: "Tue, Feb 17",
        status: "Loved the songs",
      ),
    ];
    final s=S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vGap(10),
        Text(s.past_activities, style: AppTextStyles.font16BlackBold,),
        vGap(10),

        Expanded(
          child: ListView.separated(
            itemCount: activities.length,
            separatorBuilder: (_, __) => SizedBox(height: 8.h),
            itemBuilder: (context, index) {
              final activity = activities[index];

              return PastActivityCard(
                icon: activity.icon,
                iconColor: activity.iconColor,
                title: activity.title,
                date: activity.date,
                status: activity.status,
              );
            },
          ),
        ),
      ],
    );
  }
}

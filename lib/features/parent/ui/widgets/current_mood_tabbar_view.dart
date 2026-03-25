import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';

enum Mood { happy, neutral, sad, crying }

Color getMoodColor(Mood mood) {
  switch (mood) {
    case Mood.happy:
      return Colors.green;
    case Mood.neutral:
      return Colors.yellow;
    case Mood.sad:
      return Colors.orange;
    case Mood.crying:
      return Colors.red;
  }
}

IconData getMoodIcon(Mood mood) {
  switch (mood) {
    case Mood.happy:
      return Icons.sentiment_very_satisfied;
    case Mood.neutral:
      return Icons.sentiment_neutral;
    case Mood.sad:
      return Icons.sentiment_dissatisfied;
    case Mood.crying:
      return Icons.sentiment_very_dissatisfied;
  }
}

class CurrentMoodView extends StatelessWidget {
  final Mood mood;

  const CurrentMoodView({
    super.key,
    required this.mood,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s.current_mood, style: AppTextStyles.font16BlackBold),
          vGap(20),

          Container(
            width: double.infinity,
            decoration: AppDecorations.containerDecoration.copyWith(
              color: getMoodColor(mood).withValues(alpha: 0.1),
            ),
            padding: const EdgeInsets.all(12),
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.white,
              child: Icon(
               getMoodIcon(mood),
                color: getMoodColor(mood),
                size: 50.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../generated/l10n.dart';

class NoActivityCard extends StatelessWidget {
  const NoActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          dashPattern: [10, 5],
          strokeWidth: 2,
          radius: const Radius.circular(16),
          color: AppColors.grey,
          padding: const EdgeInsets.all(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.emoji_emotions_outlined,
              color: AppColors.grey,
              size: 50.sp,
            ),
            vGap(10),
            Text(
              s.no_activity_recorded_today,
              style: AppTextStyles.font16GreyRegular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
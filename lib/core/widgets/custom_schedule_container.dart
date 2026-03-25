import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';

import '../helpers/localization.dart';


class CustomScheduleContainer extends StatelessWidget {
  final Color color;
  final IconData icon;
  const CustomScheduleContainer({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(18),
        border:isArabicLocale(context) ?
        Border(
          right: BorderSide(
            color: color,
            width: 8,
          )):

        Border(
        left: BorderSide(
        color: color,
        width: 8,
      )
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightGrey,
            radius: 35.r,
            child: Icon(icon , size: 30.sp,color: AppColors.grey,),

          ),
          hGap(5),

          Column(
            children: [

            ],
          )
          
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeeklyPlanModel {
  final String day;
  final String title;
  final String time;
  final IconData icon;
  final Color accentColor;

  WeeklyPlanModel({
    required this.day,
    required this.title,
    required this.time,
    required this.icon,
    required this.accentColor,
  });
}



class WeeklyPlanCard extends StatelessWidget {
  final WeeklyPlanModel plan;

  const WeeklyPlanCard({
    super.key,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [

          /// Left Accent Line
          Container(
            width: 6.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: plan.accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                bottomLeft: Radius.circular(18.r),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          /// Icon
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              plan.icon,
              color: Colors.grey.shade400 ,
              size: 22.sp,
            ),
          ),

          SizedBox(width: 12.w),

          /// Texts
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.day.toUpperCase(),
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    plan.title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    plan.time,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

class CustomHomeContainer extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final String title;
  final String subTitle;
  final IconData icon;
  const CustomHomeContainer({
    super.key,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: backgroundColor,
      elevation: 3,
      color: backgroundColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color:Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.1),
              radius: 30.r,
              child: Icon(icon, color: color, size: 35.sp,),
            ),
            vGap(10),
            Text(title, style : AppTextStyles.font16BlackBold),
            vGap(5),
            Text(subTitle, style: AppTextStyles.font14BlackRegular,)


          ],
        ),
      ),
    );
  }
}

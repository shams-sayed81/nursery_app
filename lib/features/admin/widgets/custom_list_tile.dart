import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String btnText;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.btnText,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: ListTile(
        title: Text(title, style: AppTextStyles.font16BlackRegular),
        subtitle: Text(subtitle, style: AppTextStyles.font14GreyRegular),
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: AppDecorations.containerDecoration.copyWith(
            color: color.withValues(alpha: 0.2),
          ),
          child: Icon(icon, color: color, size: 25.sp),
        ),
        trailing: TextButton(
          onPressed: onPressed,
          child: Text(btnText, style: AppTextStyles.font16BlackRegular),
        ),
      ),
    );
  }
}

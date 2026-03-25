import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.secondary,
    this.width = double.infinity,
    this.textStyle,
    this.height = 60,
    this.radius = 10,
  });

  final String text;
  final double width;
  final double radius;
  final double? height;
  final void Function()? onPressed;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: color?.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: textStyle ?? AppTextStyles.font16WhiteBold,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

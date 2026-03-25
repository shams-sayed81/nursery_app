
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/core/widgets/custom_outlined_button.dart';

import '../../../../generated/l10n.dart';
import '../views/sign_up_view.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.babyBlue,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFA8D5C8).withValues(alpha: 0.6),
                blurRadius: 50,
                spreadRadius: 10,
                offset: Offset(0, 20),
              ),
            ],
          ),
          child: Icon(Icons.star, color: Colors.yellow, size: 50.sp),
        ),
        vGap(20),
        Center(
          child: Text(
            s.welcome_to_little_stars,
            style: AppTextStyles.font024BlackBold,
          ),
        ),
        vGap(10),
        Center(
          child: Text(
            s.nursery_app_description,
            style: AppTextStyles.font16GreyRegular,
            textAlign: TextAlign.center,
          ),
        ),
        vGap(30),
        CustomButton(text: s.login, onPressed: () {}),
        vGap(10),
        CustomOutlinedButton(text: s.create_new_account, onPressed: ()=> context.push(SignUpView.routeName)),
        vGap(20),
        Center(child: Text(s.app_version_secure, style: AppTextStyles.font14GreyRegular,))

      ],
    );
  }
}

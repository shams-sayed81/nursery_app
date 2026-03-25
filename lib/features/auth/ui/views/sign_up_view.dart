import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../../../generated/l10n.dart';
import '../widgets/sign_up_view_body.dart';


class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName= '/sign-up';

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.grey),
        backgroundColor: AppColors.primary,
        title:Text(s.back , style: AppTextStyles.font14GreyRegular,) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SignUpViewBody(),
      ),
    );
  }
}

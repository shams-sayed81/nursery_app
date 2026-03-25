import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../../../core/cubit/language/language_cubit.dart';
import '../../../../core/helpers/localization.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () =>    context.read<LanguageCubit>().toggleLanguage(),


            child: Container(
              decoration: AppDecorations.containerDecoration,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.language, color: AppColors.grey,),
                  hGap(5),
                  Text(isArabicLocale(context)?  'English' : 'العربية', style: AppTextStyles.font16GreyRegular,),
                ],
              ),
            ),
          ),

        ],
      ),
      body: Padding(padding: const EdgeInsets.all(15), child: LoginViewBody()),
    );
  }
}

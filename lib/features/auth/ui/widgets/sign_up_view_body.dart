import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/core/widgets/custom_text_feild.dart';

import '../../../../generated/l10n.dart';



class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.create_account, style: AppTextStyles.font024BlackBold),
        vGap(10),
        Text(s.full_name, style: AppTextStyles.font16BlackBold),
        vGap(5),
        CustomTextFormField(textInputType: TextInputType.text, hintText: 'Shamosa ',),
        vGap(10),

        Text(s.email_address, style: AppTextStyles.font16BlackBold),
        vGap(5),
        CustomTextFormField(textInputType: TextInputType.emailAddress, hintText: 'example.email.com',),
        vGap(10),

        Text(s.password, style: AppTextStyles.font16BlackBold),
        vGap(5),
        CustomTextFormField(textInputType: TextInputType.visiblePassword,hintText: '.........',),
        vGap(10),

        Text(s.account_type, style: AppTextStyles.font16BlackBold),
        vGap(10),
       Row(
         mainAxisSize: MainAxisSize.max,
         children: [
           Expanded(
             child: GestureDetector(
               onTap: () {
                 setState(() {
                   selectedIndex = 0;
                 });
               },
               child: Container(

                 padding: EdgeInsets.all(10),

                 height: 60,
                 decoration: AppDecorations.containerDecoration.copyWith(
                   border: Border.all(
                     color:  selectedIndex == 0? AppColors.secondary : AppColors.grey
                   ),
                 ),
                 child: Center(
                   child: Text(
                     s.parent,
                     style: AppTextStyles.font16BlackBold.copyWith(
                         color: selectedIndex == 0? AppColors.secondary : AppColors.grey
                     )
                   ),
                 ),
               ),
             ),
           ),

           hGap(15),


           Expanded(
             child: GestureDetector(
               onTap: () {
                 setState(() {
                   selectedIndex = 1;
                 });
               },
               child: Container(
                 padding: EdgeInsets.all(10),
                 height: 60,
                 decoration: AppDecorations.containerDecoration.copyWith(
                   border: Border.all(
                       color:    selectedIndex == 1? AppColors.secondary : AppColors.grey

                   )
                 ),
                 child: Center(
                   child: Text(
                     s.teacher,
                     style: AppTextStyles.font16BlackBold.copyWith(
                       color: selectedIndex == 1? AppColors.secondary : AppColors.grey
                     )
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),
        vGap(20),
        CustomButton(text: s.create_account, onPressed: () {}),
        vGap(20),
        Center(child: Text(s.app_version_secure, style: AppTextStyles.font14GreyRegular,))
      ],
    );
  }

  Widget buildContainer(){
    return Container();
  }
}

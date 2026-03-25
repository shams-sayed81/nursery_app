import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/features/parent/ui/widgets/select_child_card.dart';
import 'package:gym_app/features/parent/ui/widgets/student_analytics_screen.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../manager/child_cubit.dart';

class AnalyticsSelectChildScreen extends StatelessWidget {
  const AnalyticsSelectChildScreen({super.key});
  static const String routeName='/analytics-select-child';

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Scaffold(
      backgroundColor:AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title:  Text(
          s.select_child,
          style: AppTextStyles.font16BlackRegular,
        ),
        centerTitle: false,
      ),

      body: BlocBuilder<ChildCubit, int>(
        builder: (context, selectedIndex) {
          final cubit = context.read<ChildCubit>();
          final children = cubit.parent.children;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  s.choose_child_schedule,
                  style: AppTextStyles.font14GreyRegular,
                ),
              ),



              const SizedBox(height: 16),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: children.length,
                  itemBuilder: (context, index) {
                    final child = children[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: SelectChildCard(
                        child: child,
                        onTap: () {
                          context.read<ChildCubit>().selectChild(index);
                          context.push(
                            StudentAnalyticsScreen.routeName,
                            extra: cubit.currentChild


                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
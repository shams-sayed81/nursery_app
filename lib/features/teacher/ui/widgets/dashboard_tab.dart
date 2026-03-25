import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/teacher/ui/widgets/parent_accounts_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/parent_notifications_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/student_filter_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../parent/ui/widgets/custom_home_container.dart';
import 'all_classes_screen.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final s= S.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            s.dashboard,
            style: AppTextStyles.font16BlackBold
          ),

         vGap(20),

          Text(
            s.welcome_teacher,
            style: AppTextStyles.font024BlackBold
          ),

          vGap(5),

           Text(
            "18 Students • 5 Classes • 11 Parents",
            style: AppTextStyles.font16GreyRegular,
          ),

          vGap(30),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.9,
            children:  [

              InkWell(
                onTap: () => context.push(
                  StudentsFilterScreen.routeName,
                  extra: FilterType.year,),
                child: CustomHomeContainer(
                  title: s.by_year,
                  subTitle:s.filter_by_year_group,
                  icon: Icons.school_outlined,
                  color: Color(0xff7C3AED),
                  backgroundColor: Color(0xffF3E8FF),
                ),
              ),


              InkWell(
                  onTap: () => context.push(
                    StudentsFilterScreen.routeName,
                    extra: FilterType.religion,
                  ),
                  child: CustomHomeContainer(
                    title: s.by_religion,
                    subTitle: s.filter_by_religion,
                    icon: Icons.church_outlined,
                    color: Color(0xffEC4899),
                    backgroundColor: Color(0xffFCE7F3),
                  ),
                ),

              InkWell(
                onTap:() =>  context.push(AllClassesScreen.routeName),
                child: CustomHomeContainer(
                  title: s.all_classes,
                  subTitle: s.classes,
                  icon: Icons.groups_outlined,
                  color: Color(0xff3B82F6),
                  backgroundColor: Color(0xffDBEAFE),
                ),
              ),

              InkWell(
                onTap: () => context.push(
                  StudentsFilterScreen.routeName,
                  extra: FilterType.all,
                ),
                child: CustomHomeContainer(
                  title:s.all_students,
                  subTitle: s.students,
                  icon: Icons.people_outline,
                  color: Color(0xff10B981),
                  backgroundColor: Color(0xffD1FAE5),
                ),
              ),
            ],
          ),

         vGap(20),


          InkWell(
            onTap: () => context.push(ParentNotificationsScreen.routeName),
            child: SizedBox(
              width: double.infinity,
              child:  CustomHomeContainer(
                title:s.notify_parents,
                subTitle: s.send_messages_to_parents,
                icon: Icons.notifications_none,
                color: Colors.orange,
                backgroundColor: Color(0xffFFF7ED),
              ),
            ),
          ),

         vGap(10),

           SizedBox(
             width: double.infinity,
             child: CustomHomeContainer(
              title: s.teacher_groups,
              subTitle: s.manage_teacher_groups,
              icon: Icons.group_work_outlined,
              color: Colors.grey,
              backgroundColor: Color(0xffF3F4F6),
                       ),
           ),
          vGap(10),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () => context.push(ParentAccountsScreen.routeName),
              child:  CustomHomeContainer(
                title:s.parent_accounts,
                subTitle: s.manage_parent_accounts,
                icon: Icons.person,
                color: Colors.grey,
                backgroundColor: Color(0xffF3F4F6),
              ),
            ),
          ),
          vGap(10),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () => context.push(ParentAccountsScreen.routeName),
              child:  CustomHomeContainer(
                title:s.my_schedule,
                subTitle: s.view_weekly_timetable,
                icon: Icons.calendar_month,
                color: Colors.purple,
                backgroundColor: Color(0xffF3F4F6),
              ),
            ),
          ),

        ],
      ),
    );
  }
}





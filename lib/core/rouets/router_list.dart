import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/features/admin/views/admin_dashboard_view.dart';
import 'package:gym_app/features/admin/views/fees_view.dart';
import 'package:gym_app/features/admin/views/parents_view.dart';
import 'package:gym_app/features/admin/views/schedule_management_view.dart';
import 'package:gym_app/features/admin/views/student_profile_view.dart';
import 'package:gym_app/features/admin/views/teacher_management_view.dart';
import 'package:gym_app/features/admin/views/user_management_view.dart';
import 'package:gym_app/features/parent/data/models/child_model.dart';
import 'package:gym_app/features/parent/ui/views/notifications_details_view.dart';
import 'package:gym_app/features/parent/ui/views/notifications_view.dart';
import 'package:gym_app/features/parent/ui/widgets/analytics_select_child.dart';
import 'package:gym_app/features/parent/ui/widgets/mood_screen.dart';
import 'package:gym_app/features/parent/ui/widgets/notification_card.dart';
import 'package:gym_app/features/parent/ui/widgets/parent_scheudle_screen.dart';
import 'package:gym_app/features/parent/ui/widgets/select_child_screen.dart';
import 'package:gym_app/features/parent/ui/widgets/student_analytics_screen.dart';
import 'package:gym_app/features/parent/ui/widgets/updates_tap.dart';
import 'package:gym_app/features/teacher/manager/teacher_cubit.dart';
import 'package:gym_app/features/teacher/ui/views/teacher_bottom_nav_bar_view.dart';
import 'package:gym_app/features/teacher/ui/widgets/create_group_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/mark_attendance_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/notify_parent_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/parent_accounts_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/parent_notifications_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/student_filter_screen.dart';
import 'package:gym_app/features/teacher/ui/widgets/teacher_schedule_screen.dart';

import '../../features/admin/views/classes_management_view.dart';
import '../../features/admin/views/create_parent_account_view.dart';
import '../../features/admin/views/students_list_view.dart';
import '../../features/auth/ui/views/login_view.dart';
import '../../features/auth/ui/views/sign_up_view.dart';
import '../../features/parent/data/models/parent_model.dart';
import '../../features/parent/manager/child_cubit.dart';
import '../../features/parent/ui/views/bottom_nav_bar_view.dart';
import '../../features/parent/ui/widgets/class_schedule_screen.dart';
import '../../features/parent/ui/widgets/tuition_screen.dart';
import '../../features/teacher/data/model/teacher_class_model.dart';
import '../../features/teacher/ui/widgets/all_classes_screen.dart';
import '../../features/teacher/ui/widgets/student_group_screen.dart';

class RoutesList {
  static final List<RouteBase> all = [
    //todo auth -------------------------------------------------------------
    GoRoute(
      path: SignUpView.routeName,
      builder: (context, state) => const SignUpView(),
    ),

    GoRoute(
      path: LoginView.routeName,
      builder: (context, state) => const LoginView(),
    ),

    //todo home --------------------------------------------------------------
    GoRoute(
      path: BottomNavBarView.routeName,
      builder: (context, state) => BlocProvider(
        create: (_) => ChildCubit(),
        child: const BottomNavBarView(),
      ),
    ),

    GoRoute(
      path: StudentAnalyticsScreen.routeName,
      builder: (context, state) {
        final child = state.extra as ChildModel;
        return StudentAnalyticsScreen(child: child);
      },
    ),

    GoRoute(
      path: TuitionScreen.routeName,
      builder: (context, state) => const TuitionScreen(),
    ),
    GoRoute(
      path: SelectChildScreen.routeName,
      builder: (context, state) => const SelectChildScreen(),
    ),

    GoRoute(
      path: AnalyticsSelectChildScreen.routeName,
      builder: (context, state) => const AnalyticsSelectChildScreen(),
    ),

    GoRoute(
      path: ScheduleView.routeName,
      builder: (context, state) {
        final child = state.extra as ChildModel;
        return ScheduleView(child: child);
      },
    ),

    GoRoute(
      path: NotificationsView.routeName,
      builder: (context, state) => const NotificationsView(),
    ),
    GoRoute(
      path: NotificationsDetailsView.routeName,
      builder: (context, state) {
        final model = state.extra as NotificationModel;
        return NotificationsDetailsView(model: model);
      },
    ),


    //todo teacher ------------------------
    GoRoute(
      path: TeacherBottomNavBarView.routeName,
      builder: (context, state) => const TeacherBottomNavBarView(),
    ),

    GoRoute(
      path: StudentsFilterScreen.routeName,
      builder: (context, state) {
        final filter = state.extra as FilterType? ?? FilterType.religion;
        return StudentsFilterScreen(filterType: filter);
      },
    ),

    GoRoute(
      path: AllClassesScreen.routeName,
      builder: (context, state) => const AllClassesScreen(),
    ),

    GoRoute(
      path: MarkAttendanceScreen.routeName,
      builder: (context, state) {
        final model = state.extra as TeacherClassModel;
        return MarkAttendanceScreen(model: model);
      },
    ),

    GoRoute(
      path: TeacherScheduleScreen.routeName,
      builder: (context, state) => const TeacherScheduleScreen(),
    ),

    GoRoute(
      path: ParentAccountsScreen.routeName,
      builder: (context, state) => const ParentAccountsScreen(),
    ),

    GoRoute(
      path: ParentNotificationsScreen.routeName,
      builder: (context, state) => const ParentNotificationsScreen(),
    ),

    GoRoute(
      path: NotifyParentScreen.routeName,
      builder: (context, state) {
        final parent = state.extra as ParentModel;
        return NotifyParentScreen(parent: parent);
      },
    ),

    GoRoute(
      path: StudentGroupsScreen.routeName,
      builder: (context, state) => const StudentGroupsScreen(),
    ),

    GoRoute(
      path: CreateGroupScreen.routeName,
      builder: (context, state) => const CreateGroupScreen(),
    ),
    GoRoute(
      path: AdminDashboardView.routeName,
      builder: (context, state) => const AdminDashboardView(),
    ),
    GoRoute(
      path: UpdatesTap.routeName,
      builder: (context, state) => const UpdatesTap(),
    ),
    GoRoute(
      path: MoodScreen.routeName,
      builder: (context, state) => const MoodScreen(),
    ),

    //todo admin---------------------------------------------
    GoRoute(
      path: CreateParentAccountView.routeName,
      builder: (context, state) => const CreateParentAccountView(),
    ),

    GoRoute(
      path: ClassesManagementView.routeName,
      builder: (context, state) => const ClassesManagementView(),
    ),

    GoRoute(
      path: UsersManagementView.routeName,
      builder: (context, state) => const UsersManagementView(),
    ),

    GoRoute(
      path: TeacherManagementView.routeName,
      builder: (context, state) => const TeacherManagementView(),
    ),

    GoRoute(
      path: StudentsListView.routeName,
      builder: (context, state) => const StudentsListView(),
    ),

    GoRoute(
      path: FeesView.routeName,
      builder: (context, state) => const FeesView(),
    ),

    GoRoute(
      path: ScheduleManagementView.routeName,
      builder: (context, state) => const ScheduleManagementView(),
    ),

    GoRoute(
      path: ParentsView.routeName,
      builder: (context, state) => const ParentsView(),
    ),
    GoRoute(
      path: StudentProfileView.routeName,
      builder: (context, state) {
        final child = state.extra as ChildModel;
        return StudentProfileView(child: child);
      },
    ),
  ];
}

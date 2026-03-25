import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/rouets/router_list.dart';
import 'package:gym_app/features/admin/views/admin_dashboard_view.dart';
import 'package:gym_app/features/parent/ui/views/bottom_nav_bar_view.dart';
import 'package:gym_app/features/teacher/ui/views/teacher_bottom_nav_bar_view.dart';







abstract class AppRouter {
  // Global navigator key for routing (used by TokenInterceptor on logout)
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  // Hold a single GoRouter instance to preserve state across rebuilds/hot reload
  static GoRouter? _router;

  static GoRouter getRouter({
    required bool isNotFirstLogin,
    required String token,
  }) {
    // Return existing instance if already initialized
    if (_router != null) return _router!;

    _router = GoRouter(
      navigatorKey: navigatorKey,

      initialLocation: AdminDashboardView.routeName,
      routes: RoutesList.all,
    );

    return _router!;
  }

/*
  static String getInitialLocation(bool isNotFirstLogin, String token) {
    debugPrint('isNotFirstLogin: $isNotFirstLogin, token: ${token.isNotEmpty}');
    if (!isNotFirstLogin) {
      return OnboardingView.routeName;
        //OnboardingView.routeName;
    } else if (token.isNotEmpty) {
      return '';
        //BottomNavBarView.routeName;
    } else {
      return '';
        //LoginView.routeName;
    }
  }
  */
}

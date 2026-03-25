import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/widgets/custom_tab_bar.dart';
import 'package:gym_app/features/admin/views/plan_setup_view.dart';

import '../widgets/payment_overview_view.dart';

class FeesView extends StatelessWidget {
  const FeesView({super.key});
  static const String routeName = '/fees-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Tuition & Fees'),
      ),
      backgroundColor: AppColors.primary,
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(
              tabs: [
                Tab(text: 'plan '),
                Tab(text: 'payment'),
              ],
              indicatorColors: [Colors.grey, Colors.blueGrey],
            ),
            Expanded(child: TabBarView(children: [
              PlanSetupView(),
              StudentPaymentView(),
            ]))
          ],
        ),
      ),
    );
  }
}

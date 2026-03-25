import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/parent/ui/widgets/notification_card.dart';

import '../../../../generated/l10n.dart';
import 'notifications_details_view.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});
  static const String routeName = '/notifications-view';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final list = [
      NotificationModel(
        title: 'title',
        message: 'message',
        childName: 'childName',
        type: NotificationTypes.general,
        dateTime: DateTime.now(),
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(s.notifications, style: AppTextStyles.font16BlackBold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => NotificationCard(
                  model: list[index],
                  onTap: () => context.push(
                    NotificationsDetailsView.routeName,
                    extra: list[index],
                  ),
                ),
                separatorBuilder: (context, index) => vGap(10),
                itemCount: list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

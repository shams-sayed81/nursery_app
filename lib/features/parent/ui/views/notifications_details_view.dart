import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/parent/ui/widgets/notification_card.dart';

import '../../../../generated/l10n.dart';

class NotificationsDetailsView extends StatelessWidget {
  final NotificationModel model;
  const NotificationsDetailsView({super.key, required this.model});
  static const String routeName = '/notifications-details';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(model.title, style: AppTextStyles.font16BlackBold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: AppDecorations.containerDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.about, style: AppTextStyles.font16BlackBold),
                  vGap(10),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: AppDecorations.containerDecoration.copyWith(
                      color: Colors.lightGreen.shade200,
                    ),
                    child: Text(
                      model.childName,
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            vGap(10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: AppDecorations.containerDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s.message, style: AppTextStyles.font16BlackBold),
                  vGap(5),
                  Text(
                    model.message,
                    style: AppTextStyles.font14BlackRegular.copyWith(
                      color: Colors.lightGreen,
                    ),
                  ),
                ],
              ),
            ),
            vGap(10),
            Container(
              decoration: AppDecorations.containerDecoration,
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  model.type.name,
                  style: AppTextStyles.font14BlackRegular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

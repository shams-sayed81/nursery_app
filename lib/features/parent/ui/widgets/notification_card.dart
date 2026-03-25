import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';


enum NotificationTypes { general, important }

class NotificationModel {
  final String title;
  final String message;
  final String childName;
  final NotificationTypes type;
  final DateTime dateTime;

  NotificationModel({
    required this.title,
    required this.message,
    required this.childName,
    required this.type,
    required this.dateTime,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationModel model;
  final VoidCallback onTap;

  const NotificationCard({super.key, required this.model, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Card(

        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('🔊', style: TextStyle(fontSize: 35.sp)),
              hGap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title, style: AppTextStyles.font16BlackBold),
                  vGap(10),
                  Text(model.message, style: AppTextStyles.font14GreyRegular),
                  vGap(5),
                  Container(
                    decoration: AppDecorations.containerDecoration,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      model.childName,
                      style: AppTextStyles.font14BlackRegular,
                    ),
                  ),
                  vGap(5),
                  Text(
                    '${model.dateTime.day} / ${model.dateTime.month} / ${model.dateTime.year} ',
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  decoration: AppDecorations.containerDecoration,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    model.type.name,
                    style: AppTextStyles.font12GreyRegular,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

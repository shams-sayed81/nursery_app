import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/features/teacher/ui/widgets/mark_attendance_screen.dart';

import '../../../../generated/l10n.dart';
import '../../data/model/teacher_class_model.dart';

class TeacherClassCard extends StatelessWidget {
  final TeacherClassModel model;

  const TeacherClassCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withValues(alpha: .05)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.className, style: AppTextStyles.font16BlackBold),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: color(model.religion).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  translatedReligion(model.religion, context),

                  style: AppTextStyles.font14GreyRegular.copyWith(
                    color: color(model.religion),
                  ),
                ),
              ),
            ],
          ),

          vGap(5),
          Text(model.ageGroup, style: AppTextStyles.font14BlackRegular),

          vGap(15),
          CustomButton(
            text: s.mark_attendance,
            onPressed: ()=> context.push(MarkAttendanceScreen.routeName, extra: model),
            color: Colors.green,
          ),

          vGap(10),

          Text('${model.students.length} ${s.students}'),

          vGap(5),

          Column(
            children: model.students.map((student) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.blue.shade300, radius: 20 , child: Text(student.name.trim()[0].toUpperCase()),),
                    hGap(5),
                    Text(student.name),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String translatedReligion(String religion, BuildContext context) {
    switch (religion) {
      case 'Muslim':
        return S.of(context).muslim;
      case 'Christian':
        return S.of(context).christian;
      case 'Mixed':
        return S.of(context).mixed;
      default:
        return religion;
    }
  }

  Color color(String religion) {
    switch (religion) {
      case 'Muslim':
        return Colors.green;
      case 'Christian':
        return Colors.blue;
      case 'Mixed':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

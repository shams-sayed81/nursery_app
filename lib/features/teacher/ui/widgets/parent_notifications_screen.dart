import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/features/teacher/ui/widgets/parent_notification_card.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../parent/data/models/child_model.dart';
import '../../../parent/data/models/parent_model.dart';
import 'notify_parent_screen.dart';

class ParentNotificationsScreen extends StatelessWidget {
  const ParentNotificationsScreen({super.key});
  static const String routeName='/parent-notification';

  @override
  Widget build(BuildContext context) {
    List<ParentModel> parents = [

      ParentModel(
        id: "p1",
        name: "Omar Khalil",
        email: "omar.khalil@gmail.com",
        password: "password123",
        children: [
          ChildModel(
            id: "c1",
            name: "Layla Khalil",
            age: 5,
            classId: "1",
            parentId: "p1",
            religion: "Muslim",
            className: "Stars",
            year: "3",
          ),
          ChildModel(
            id: "c2",
            name: "Ali Khalil",
            age: 4,
            classId: "2",
            parentId: "p1",
            religion: "Muslim",
            className: "Sunflowers",
            year: "2",
          ),
        ],
      ),

      ParentModel(
        id: "p2",
        name: "Linda Martinez",
        email: "linda.martinez@hotmail.com",
        password: "password123",
        children: [
          ChildModel(
            id: "c3",
            name: "Isabella Martinez",
            age: 6,
            classId: "3",
            parentId: "p2",
            religion: "Christian",
            className: "Rainbows",
            year: "3",
          ),
        ],
      ),

      ParentModel(
        id: "p3",
        name: "Demo Parent",
        email: "parent@test.com",
        password: "password123",
        children: [
          ChildModel(
            id: "c4",
            name: "Demo Child",
            age: 5,
            classId: "1",
            parentId: "p3",
            religion: "Muslim",
            className: "Stars",
            year: "2",
          ),
        ],
      ),

      ParentModel(
        id: "p4",
        name: "Sarah Johnson",
        email: "sarah.johnson@gmail.com",
        password: "password123",
        children: [
          ChildModel(
            id: "c5",
            name: "Emma Johnson",
            age: 5,
            classId: "1",
            parentId: "p4",
            religion: "Christian",
            className: "Stars",
            year: "2",
          ),
          ChildModel(
            id: "c6",
            name: "Oliver Johnson",
            age: 4,
            classId: "2",
            parentId: "p4",
            religion: "Christian",
            className: "Sunflowers",
            year: "1",
          ),
        ],
      ),

      ParentModel(
        id: "p5",
        name: "Ahmed Hassan",
        email: "ahmed.hassan@outlook.com",
        password: "password123",
        children: [
          ChildModel(
            id: "c7",
            name: "Zainab Hassan",
            age: 5,
            classId: "1",
            parentId: "p5",
            religion: "Muslim",
            className: "Stars",
            year: "3",
          ),
          ChildModel(
            id: "c8",
            name: "Yusuf Hassan",
            age: 4,
            classId: "2",
            parentId: "p5",
            religion: "Muslim",
            className: "Sunflowers",
            year: "1",
          ),
          ChildModel(
            id: "c9",
            name: "Amira Hassan",
            age: 3,
            classId: "3",
            parentId: "p5",
            religion: "Muslim",
            className: "Rainbows",
            year: "1",
          ),
        ],
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Back to Dashboard', style: AppTextStyles.font16BlackBold,),

      ),
      body:ListView.builder(
        itemCount: parents.length,
        itemBuilder: (context, index) {
          return ParentNotificationCard(
            onPressed: () => context.push(
              NotifyParentScreen.routeName,
              extra: parents[index],
            ),
            parent: parents[index],
          );
        },
      ),
    );
  }
}

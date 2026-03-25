import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/teacher/ui/widgets/parent_card.dart';

import '../../../parent/data/models/child_model.dart';
import '../../../parent/data/models/parent_model.dart';

class ParentAccountsScreen extends StatelessWidget {
  const ParentAccountsScreen({super.key});
  static const String routeName='/parent-accounts';

  @override
  Widget build(BuildContext context) {
    List<ParentModel> parents = [
      ParentModel(
        name: "Ahmed Hassan",
        email: "ahmed.hassan@outlook.com",
        password: "password123",
        children: [], id: '',
      ),

      ParentModel(
        name: "Ahmed Hassan",
        email: "ahmed.hassan@outlook.com",
        password: "password123",
        children: [
          ChildModel(
            name: "Zainab Hassan",
            age: 5,
            className: "Stars",
            year: 'third',
            religion: "Muslim",
            id: '', classId: '', parentId: '',
          ),
          ChildModel(
            name: "Yusuf Hassan",
            age: 4,
            className: "Sunflowers",
            year: 'first',
            religion: "Muslim", id: '', classId: '', parentId: '',
          ),
          ChildModel(
            name: "Amira Hassan",
            age: 3,
            className: "Rainbows",
            year: 'first',
            religion: "Muslim", id: '', classId: '', parentId: '',
          ),
        ], id: '',
      ),

      ParentModel(
        name: "Aisha Mohammed",
        email: "aisha.mohamed@outlook.com",
        password: "password123",
        children: [], id: '',
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Parent Accounts', style: AppTextStyles.font16BlackBold,),

      ),
      body: ListView.builder(
        itemCount: parents.length,
        itemBuilder: (context, index) {
          return ParentCard(parent: parents[index]);
        },
      ),
    );
  }
}

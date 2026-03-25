import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/spacing.dart';

import '../../parent/data/models/child_model.dart';
import '../widgets/bottom_info_section.dart';
import '../widgets/school_file_card.dart';
import '../widgets/student_header_card.dart';

class StudentProfileView extends StatelessWidget {
  final ChildModel child;

  const StudentProfileView({super.key, required this.child});
  static const String routeName='/student-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Profile")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            StudentHeaderCard(child: child),

            vGap(15),

            const SchoolFileCard(),

            vGap(15),

            const BottomInfoSection(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../parent/ui/widgets/class_schedule_screen.dart';


class TeacherScheduleScreen extends StatelessWidget {
  const TeacherScheduleScreen({super.key});
  static const String routeName = '/teacher-schedule';

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container()
        ),
      ),
    );
  }
}
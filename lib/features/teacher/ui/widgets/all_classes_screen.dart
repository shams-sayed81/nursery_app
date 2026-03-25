import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/features/teacher/ui/widgets/teacher_class_card.dart';

import '../../../../generated/l10n.dart';
import '../../manager/teacher_cubit.dart';

class AllClassesScreen extends StatelessWidget {
  const AllClassesScreen({super.key});

  static const String routeName = '/all-classes';

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          s.back_to_dashboard,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<TeacherStudentsCubit, TeacherStudentsState>(
          builder: (context, state) {

            if (state is TeacherStudentsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is TeacherClassesLoaded) {
              return ListView.builder(
                itemCount: state.classes.length,
                itemBuilder: (context, index) {
                  final classItem = state.classes[index];
                  return TeacherClassCard(model: classItem ,);
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../../../generated/l10n.dart';
import '../../../parent/data/models/parent_model.dart';
import '../../../parent/ui/widgets/chat_tab.dart';
import '../../manager/teacher_cubit.dart';

class TeacherChatTab extends StatefulWidget {
  const TeacherChatTab({super.key});

  @override
  State<TeacherChatTab> createState() => _TeacherChatTabState();
}

class _TeacherChatTabState extends State<TeacherChatTab> {

  @override
  void initState() {
    super.initState();
    context.read<TeacherStudentsCubit>().loadParents();
  }

  @override
  Widget build(BuildContext context) {
    final s =S.of(context);
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
        title:  Text(s.messages, style: AppTextStyles.font16BlackBold,),
        actions: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: AppDecorations.containerDecoration,
            child:  Text(s.groups, style: AppTextStyles.font14BlackRegular,),
          ),
          hGap(5),
          Container(
            padding: EdgeInsets.all(5),
            decoration: AppDecorations.containerDecoration.copyWith(color: AppColors.secondary),
            child:  Text(s.bulk, style: AppTextStyles.font16WhiteBold,),
          ),

        ],
      ),
        BlocBuilder<TeacherStudentsCubit, TeacherStudentsState>(
          builder: (context, state) {

            if (state is TeacherStudentsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is TeacherParentsLoaded) {
              final parents = state.parents;

              return Expanded(
                child: ListView.builder(
                  itemCount: parents.length,
                  itemBuilder: (context, index) {
                    final parent = parents[index];

                    return _ParentCard(parent: parent);
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}


class _ParentCard extends StatelessWidget {
  final ParentModel parent;

  const _ParentCard({required this.parent});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              backgroundColor: AppColors.primary,
              body: ChatTab(
                title: parent.name,
                subtitle: "Online",
                avatarLetter: parent.name[0],
              ),
            ),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration:AppDecorations.containerDecoration,
        child: Row(
          children: [

            CircleAvatar(
              backgroundColor: Colors.teal.withValues(alpha: 0.3),
              child: Text(parent.name[0], style: AppTextStyles.font16BlackRegular,),
            ),

            hGap(10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(parent.name, style: AppTextStyles.font14BlackRegular,),

                  Text(parent.email, style: AppTextStyles.font14BlackRegular,),

                 vGap(5),

                  Wrap(
                    spacing: 6,
                    children: parent.children
                        .map((child) => Chip(
                        backgroundColor: Colors.blueAccent.withValues(alpha: 0.3),
                        label: Text(child.name)))
                        .toList(),
                  ),
                ],
              ),

            ),
            Icon(Icons.send, color: AppColors.secondary,)
          ],
        ),
      ),
    );
  }
}
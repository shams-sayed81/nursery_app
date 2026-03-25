import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/features/admin/views/student_profile_view.dart';

import '../manager/admin_cubit.dart';
import '../widgets/student_card.dart';


class StudentsListView extends StatefulWidget {
  const StudentsListView({super.key});
  static const String routeName='/student-list';

  @override
  State<StudentsListView> createState() =>
      _StudentsListViewState();
}

class _StudentsListViewState extends State<StudentsListView> {

  @override
  void initState() {
    context.read<AdminCubit>().loadChildren();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Students Directory"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// Search
            TextField(
              decoration: InputDecoration(
                hintText: "Search students by name...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<AdminCubit, AdminState>(
                builder: (context, state) {

                  if (state is AdminChildrenLoaded) {

                    final children = state.children;

                    return ListView.separated(
                      itemCount: children.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),

                      itemBuilder: (context, index) {

                        final child = children[index];

                        return InkWell(
                            onTap: () => context.push(StudentProfileView.routeName, extra: child),
                            child: StudentCard(child: child));
                      },
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
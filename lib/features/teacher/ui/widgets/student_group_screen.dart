import 'package:flutter/material.dart';

import '../../data/model/student_group_model.dart';
import 'create_group_screen.dart';

class StudentGroupsScreen extends StatefulWidget {
  const StudentGroupsScreen({super.key});
  static const String routeName='/student-group';

  @override
  State<StudentGroupsScreen> createState() => _StudentGroupsScreenState();
}

class _StudentGroupsScreenState extends State<StudentGroupsScreen> {

  List<StudentGroupModel> groups = [];

  Future<void> openCreateGroup() async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CreateGroupScreen(),
      ),
    );

    if (result != null && result is StudentGroupModel) {
      setState(() {
        groups.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Groups"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openCreateGroup,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: groups.length,
        itemBuilder: (context, index) {

          final group = groups[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    CircleAvatar(
                      radius: 5,
                      backgroundColor: group.color,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      group.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(width: 8),

                    if (group.visible)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Visible",
                          style: TextStyle(fontSize: 11),
                        ),
                      )
                  ],
                ),

                const SizedBox(height: 6),

                Text("${group.studentIds.length} students"),

              ],
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../parent/data/models/child_model.dart';

class StudentHeaderCard extends StatelessWidget {
  final ChildModel child;

  const StudentHeaderCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.blue.shade100,
            child: Text(
              child.name[0],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  child.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Age: ${child.age}  •  ${child.className}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Joined Sept 2025",
                  style: TextStyle(color: Colors.grey.shade600),
                ),

                const SizedBox(height: 4),

                Text(
                  "Parent ID: ${child.parentId}",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
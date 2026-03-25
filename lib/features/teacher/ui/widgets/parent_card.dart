import 'package:flutter/material.dart';

import '../../../parent/data/models/child_model.dart';
import '../../../parent/data/models/parent_model.dart';

class ParentCard extends StatelessWidget {
  final ParentModel parent;

  const ParentCard({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Parent Info
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      parent.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(Icons.email, size: 14),
                        const SizedBox(width: 4),
                        Text(parent.email),
                      ],
                    ),

                    Row(
                      children: [
                        const Icon(Icons.lock, size: 14),
                        const SizedBox(width: 4),
                        Text(parent.password),
                      ],
                    ),
                  ],
                ),
              ),

              const Icon(Icons.copy, size: 18)
            ],
          ),

          const SizedBox(height: 12),

          /// Children
          if (parent.children.isEmpty)
            const Text(
              "No children assigned",
              style: TextStyle(color: Colors.grey),
            )
          else ...[
            Row(
              children: [
                const Icon(Icons.child_care, size: 18),
                const SizedBox(width: 6),
                Text("${parent.children.length} Children"),
              ],
            ),

            const SizedBox(height: 10),

            Column(
              children: parent.children
                  .map((child) => ChildCard(child: child))
                  .toList(),
            )
          ]
        ],
      ),
    );
  }
}




class ChildCard extends StatelessWidget {
  final ChildModel child;

  const ChildCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            child: Icon(Icons.person, size: 16),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  child.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Text("${child.age} yrs"),
                    const SizedBox(width: 8),
                    Text(child.className),
                    const SizedBox(width: 8),
                    Text("${child.year} Year"),
                    const SizedBox(width: 8),
                    Text(child.religion),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
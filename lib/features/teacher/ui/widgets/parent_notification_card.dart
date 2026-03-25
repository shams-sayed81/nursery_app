import 'package:flutter/material.dart';
import 'package:gym_app/core/widgets/custom_button.dart';

import '../../../parent/data/models/parent_model.dart';

class ParentNotificationCard extends StatelessWidget {
  final ParentModel parent;
  final void Function() onPressed;

  const ParentNotificationCard({super.key, required this.parent, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Parent Info
          Row(
            children: [

              /// Avatar
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xffFFF3E6),
                child: Text(
                  parent.name[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              /// Name + Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parent.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    parent.email,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),

          const SizedBox(height: 14),

          /// Children Title
          Text(
            "Children (${parent.children.length})",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 8),

          /// Children Chips
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: parent.children.map((child) {
              return Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF3FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(child.name),
              );
            }).toList(),
          ),

          const SizedBox(height: 14),

          /// Button
         CustomButton(text: 'Send Notification', onPressed: onPressed,)
        ],
      ),
    );
  }
}
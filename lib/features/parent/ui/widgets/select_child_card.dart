import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../data/models/child_model.dart';

class SelectChildCard extends StatelessWidget {
  final ChildModel child;
  final VoidCallback onTap;

  const SelectChildCard({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final letter = child.name.characters.first;

    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              /// Avatar
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.teal.shade200,
                child: Text(
                  letter.toUpperCase(),
                  style: AppTextStyles.font14GreyRegular
                ),
              ),

              const SizedBox(width: 14),

              /// Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "Age ${child.age} • ${child.classId}",
                      style: const TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                         child.religion,
                        style: AppTextStyles.font12GreyRegular.copyWith(color: Colors.blue)
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
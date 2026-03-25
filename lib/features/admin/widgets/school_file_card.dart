import 'package:flutter/material.dart';
import 'package:gym_app/features/admin/widgets/personal_needs_books.dart';

import 'document_status_grid.dart';

class SchoolFileCard extends StatelessWidget {
  const SchoolFileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Column(
        children: [

          /// Header
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: Color(0xff1E293B),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "School File",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Export",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// Required Docs
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Required Documents",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const DocumentStatusGrid(),

          const SizedBox(height: 16),

          const PersonalNeedsBox(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
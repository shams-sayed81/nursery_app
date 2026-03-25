import 'package:flutter/material.dart';

class PersonalNeedsBox extends StatelessWidget {
  const PersonalNeedsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Personal Needs & Supplies",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 6),

          Text("• Spare set of clothes"),
          Text("• Indoor shoes"),
          Text("• Water bottle"),
          Text("• Nap blanket"),
        ],
      ),
    );
  }
}
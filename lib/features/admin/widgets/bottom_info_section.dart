import 'package:flutter/material.dart';

class BottomInfoSection extends StatelessWidget {
  const BottomInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(child: _infoCard("Emergency Contacts")),

        const SizedBox(width: 12),

        Expanded(child: _infoCard("Health Information")),
      ],
    );
  }

  Widget _infoCard(String title) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text("Example data"),
        ],
      ),
    );
  }
}
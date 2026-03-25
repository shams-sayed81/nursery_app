import 'package:flutter/material.dart';

class DocumentStatusGrid extends StatelessWidget {
  const DocumentStatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final docs = [
      {"title": "Birth Certificate", "status": true},
      {"title": "Vaccination Record", "status": true},
      {"title": "Passport Photo", "status": true},
      {"title": "Registration Form", "status": true},
      {"title": "Medical Report", "status": false},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Wrap(
        spacing: 10,
        runSpacing: 10,

        children: docs.map((doc) {

          final submitted = doc["status"] as bool;

          return Container(
            width: 150,
            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: submitted
                  ? Colors.green.shade50
                  : Colors.red.shade50,

              borderRadius: BorderRadius.circular(10),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  doc["title"] as String,
                  style: const TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 4),

                Text(
                  submitted ? "Submitted" : "Missing",
                  style: TextStyle(
                    fontSize: 11,
                    color: submitted ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
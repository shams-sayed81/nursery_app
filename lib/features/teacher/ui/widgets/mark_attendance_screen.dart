import 'package:flutter/material.dart';
import '../../data/model/teacher_class_model.dart';



class MarkAttendanceScreen extends StatefulWidget {
  static const routeName = '/mark-attendance';
  final TeacherClassModel model;

  const MarkAttendanceScreen({super.key, required this.model});

  @override
  State<MarkAttendanceScreen> createState() => _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends State<MarkAttendanceScreen> {
  Map<String, String?> attendance = {};
  Map<String, int> lateMinutes = {};

  @override
  Widget build(BuildContext context) {
    final students = widget.model.students;

    return Scaffold(
      appBar: AppBar(title: Text('Mark Attendance')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          final status = attendance[student.id];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue.shade300,
                      child: Text(student.name[0].toUpperCase()),
                    ),
                    const SizedBox(width: 10),
                    Text(student.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _statusButton(student.id, 'present', 'Present', Colors.green),
                    const SizedBox(width: 10),
                    _statusButton(student.id, 'absent', 'Absent', Colors.red),
                    const SizedBox(width: 10),
                    _statusButton(student.id, 'late', 'Late', Colors.orange),
                  ],
                ),
                if (status == 'late')
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(12, (i) {
                        final minutes = (i + 1) * 5;
                        final isSelected = lateMinutes[student.id] == minutes;
                        return ChoiceChip(
                          label: Text('$minutes min'),
                          selected: isSelected,
                          onSelected: (_) {
                            setState(() {
                              lateMinutes[student.id] = minutes;
                            });
                          },
                        );
                      }),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _statusButton(String studentId, String value, String text, Color color) {
    final isSelected = attendance[studentId] == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            attendance[studentId] = value;
            if (value != 'late') lateMinutes.remove(studentId);
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? color : color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
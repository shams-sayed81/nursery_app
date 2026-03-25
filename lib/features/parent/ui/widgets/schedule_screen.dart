import 'package:flutter/material.dart';

class ScheduleClassModel {
  final String day;
  final String startTime;
  final String endTime;
  final String title;
  final String subject;

  ScheduleClassModel({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.subject,
  });
}

class WeekScheduleDialog extends StatelessWidget {
  const WeekScheduleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

    final times = [
      "07:00","08:00","09:00","10:00",
      "11:00","12:00","13:00","14:00"
    ];

    final classes = [
      ScheduleClassModel(
        day: "Sun",
        startTime: "09:00",
        endTime: "11:00",
        title: "Math Class",
        subject: "Algebra",
      ),
    ];

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          /// HEADER
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [Color(0xffEC4899), Color(0xff7C3AED)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Emma Johnson's Weekly Schedule",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Complete class timetable",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                )
              ],
            ),
          ),

          /// BODY
          Expanded(
            child: Row(
              children: [

                SingleChildScrollView(
                  child: Column(
                    children: [
                      _timeHeaderCell(),
                      ...times.map((time) => _timeCell(time)),
                    ],
                  ),
                ),

                /// 👉 SCHEDULE GRID (Scrollable)
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          /// Days Header
                          Row(
                            children: days
                                .map((d) => _dayHeaderCell(d))
                                .toList(),
                          ),

                          /// Rows
                          ...times.map((time) {
                            return Row(
                              children: days.map((day) {
                                final classItem = classes.firstWhere(
                                      (c) =>
                                  c.day == day &&
                                      c.startTime == time,
                                  orElse: () => ScheduleClassModel(
                                    day: "",
                                    startTime: "",
                                    endTime: "",
                                    title: "",
                                    subject: "",
                                  ),
                                );

                                return _gridCell(classItem);
                              }).toList(),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= CELLS =================

Widget _dayHeaderCell(String day) {
  return Container(
    width: 110,
    height: 50,
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: const LinearGradient(
        colors: [Color(0xffEC4899), Color(0xff7C3AED)],
      ),
    ),
    child: Center(
      child: Text(
        day,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget _timeHeaderCell() {
  return Container(
    width: 80,
    height: 50,
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Center(
      child: Text(
        "Time",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _timeCell(String time) {
  return Container(
    width: 80,
    height: 70,
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        time,
        style: const TextStyle(fontSize: 12),
      ),
    ),
  );
}

Widget _gridCell(ScheduleClassModel classItem) {
  return Container(
    width: 110,
    height: 70,
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: classItem.title.isEmpty
          ? Colors.grey.shade100
          : const Color(0xff3B82F6),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(6),
    child: classItem.title.isEmpty
        ? const SizedBox()
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${classItem.startTime} - ${classItem.endTime}",
          style: const TextStyle(
              color: Colors.white, fontSize: 9),
        ),
        const SizedBox(height: 4),
        Text(
          classItem.title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10),
        ),
        Text(
          classItem.subject,
          style: const TextStyle(
              color: Colors.white70,
              fontSize: 9),
        ),
      ],
    ),
  );
}
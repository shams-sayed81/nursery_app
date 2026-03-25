import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/features/parent/ui/widgets/schedule_screen.dart';
import '../../../../core/enums/daily_status_enum.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/child_model.dart';
import '../../manager/child_cubit.dart';

class ScheduleView extends StatefulWidget {
  final ChildModel child;

  const ScheduleView({super.key, required this.child});
  static const routeName = '/class-schedule-view';

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  String selectedDay = "All";

  final scheduleDays = [
    "All",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ChildCubit>();

    final allActivities = cubit.reports
        .where((r) => r.childId == widget.child.id)
        .expand((r) => r.entries)
        .where((e) => e.type == DailyEntryType.activity)
        .toList();

    final filteredActivities = allActivities.where((entry) {
      if (selectedDay == "All") return true;
      return _getDayFull(entry.date) == selectedDay;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "${widget.child.name}'s Schedule",
          style: AppTextStyles.font16BlackBold,
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 Day Filters
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: scheduleDays.length,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemBuilder: (_, i) {
                final day = scheduleDays[i];
                final isSelected = selectedDay == day;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(day),
                    selected: isSelected,
                    onSelected: (_) => setState(() => selectedDay = day),
                    selectedColor: AppColors.primary,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          /// 🔹 Show Week View Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton.icon(
              onPressed: ()=> showDialog(
                context: context,
                builder: (context) => WeekScheduleDialog() ),
              icon: const Icon(Icons.calendar_view_week),
              label: const Text("Show Week View"),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  "Sunday",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text("Today"),
                )
              ],
            ),
          ),

          const SizedBox(height: 8),

          /// 🔹 Schedule List
          Expanded(
            child: filteredActivities.isEmpty
                ? const Center(child: Text("No classes"))
                : ListView.builder(
              itemCount: filteredActivities.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (_, i) {
                final entry = filteredActivities[i];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      /// Icon Box
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff00B4DB),
                              Color(0xff0083B0)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.access_time,
                            color: Colors.white),
                      ),

                      const SizedBox(width: 12),

                      /// Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.title ?? "Unknown Class",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              entry.caption ?? "09:00 - 11:00",
                              style: const TextStyle(
                                  color: Colors.grey),
                            ),
                            const SizedBox(height: 8),

                            /// Subject Tag
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(entry.title ?? "math"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDayFull(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return "Monday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.friday:
        return "Friday";
      case DateTime.saturday:
        return "Saturday";
      case DateTime.sunday:
        return "Sunday";
      default:
        return "";
    }
  }
}
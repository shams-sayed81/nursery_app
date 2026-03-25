import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_tab_bar.dart';
import '../data/models/admin_class_model.dart';
import '../manager/admin_cubit.dart';
import '../widgets/admin_week_schedule_dialog.dart';

class ScheduleManagementView extends StatefulWidget {
  const ScheduleManagementView({super.key});
  static const String routeName = '/schedule_management';

  @override
  State<ScheduleManagementView> createState() => _ScheduleManagementViewState();
}

class _ScheduleManagementViewState extends State<ScheduleManagementView> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<AdminCubit>();
    cubit.loadSchedule();
    cubit.loadTeachers();
    cubit.loadClasses();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text("Schedule Management")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomTabBar(
                indicatorColors: const [Colors.teal, Colors.blue],
                tabs: const [Tab(text: "Students"), Tab(text: "Teachers")],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const StudentsScheduleView(),
                    const TeachersScheduleView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= TEACHERS =================
class TeachersScheduleView extends StatefulWidget {
  const TeachersScheduleView({super.key});

  @override
  State<TeachersScheduleView> createState() => _TeachersScheduleViewState();
}

class _TeachersScheduleViewState extends State<TeachersScheduleView> {
  String? selectedTeacherId;
  final days = ["Mon", "Tue", "Wed", "Thu", "Fri"];

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdminCubit>();

    if (selectedTeacherId == null && cubit.teachers.isNotEmpty) {
      selectedTeacherId = cubit.teachers.first.id;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            initialValue: selectedTeacherId,
            hint: const Text("Select Teacher"),
            items: cubit.teachers
                .map((t) => DropdownMenuItem(value: t.id, child: Text(t.name)))
                .toList(),
            onChanged: (value) => setState(() => selectedTeacherId = value),
          ),
          const SizedBox(height: 16),
    Row(
      children: [
        
        Expanded(
          child: InkWell(
            onTap: () => showDialog(context: context, builder: (context) =>AdminWeekScheduleDialog() ,),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: AppDecorations.containerDecoration.copyWith(color: Colors.teal),
      child: Center(child: Text('Add new', style: AppTextStyles.font16WhiteBold,)),
            ),
          ),
        ),
        hGap(10),
        Expanded(
          child: InkWell(
            onTap: () => showDialog(context: context, builder: (context) =>AdminWeekScheduleDialog() ,),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: AppDecorations.containerDecoration.copyWith(border: Border.all(color: Colors.red)),
              child: Center(child: Text('Export', style: AppTextStyles.font16WhiteBold.copyWith(color: Colors.red),)),

            ),
          ),
        ),
      ],
    ),
          vGap(10),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: days.map((day) {
                  final daySlots = cubit.slots
                      .where((s) =>
                  s.teacherId == selectedTeacherId && s.day == day)
                      .toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(day, style: AppTextStyles.font16BlackBold),
                      const SizedBox(height: 8),
                      if (daySlots.isEmpty)
                        const Text("No slots", style: TextStyle(color: Colors.grey)),
                      ...daySlots.map((slot) => SlotItem(
                        time: "${slot.startTime} - ${slot.endTime}",
                        isOccupied: slot.isOccupied,
                      )),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= STUDENTS =================
class StudentsScheduleView extends StatefulWidget {
  const StudentsScheduleView({super.key});

  @override
  State<StudentsScheduleView> createState() => _StudentsScheduleViewState();
}

class _StudentsScheduleViewState extends State<StudentsScheduleView> {
  String selectedYear = "All";
  final filters = ["All", "Year 1", "Year 2", "Year 3"];
  final days = ["Mon", "Tue", "Wed", "Thu", "Fri"];

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdminCubit>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔽 Year Filter
          Row(
            children: filters.map((year) {
              final isSelected = selectedYear == year;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedYear = year),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.teal : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        year,
                        style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          vGap(10),
          Row(
            children: [

              Expanded(
                child: InkWell(
                  onTap: () => showDialog(context: context, builder: (context) =>AdminWeekScheduleDialog() ,),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: AppDecorations.containerDecoration.copyWith(color: Colors.teal),
                    child: Center(child: Text('Add new', style: AppTextStyles.font16WhiteBold,)),
                  ),
                ),
              ),
              hGap(10),
              Expanded(
                child: InkWell(
                  onTap: () => showDialog(context: context, builder: (context) =>AdminWeekScheduleDialog() ,),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: AppDecorations.containerDecoration.copyWith(border: Border.all(color: Colors.red)),
                    child: Center(child: Text('Export', style: AppTextStyles.font16WhiteBold.copyWith(color: Colors.red),)),

                  ),
                ),
              ),
            ],
          ),
          vGap(10),
          const SizedBox(height: 16),
          // 📋 Slots per day
          ...days.map((day) {
            final daySlots = cubit.slots.where((slot) {
              if (selectedYear != "All") {
                final classItem = cubit.classes.firstWhere(
                      (c) => c.id == slot.classId,
                  orElse: () => AdminClassModel(id: "", name: "", year: "", studentsCount: 5, isActive: true),
                );
                if (classItem.id.isEmpty || classItem.year != selectedYear) {
                  return false;
                }
              }
              return slot.day == day;
            }).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day, style: AppTextStyles.font16BlackBold),
                const SizedBox(height: 8),
                if (daySlots.isEmpty)
                  const Text("No slots", style: TextStyle(color: Colors.grey)),
                ...daySlots.map((slot) => SlotItem(
                  time: "${slot.startTime} - ${slot.endTime}",
                  isOccupied: slot.isOccupied,
                )),
                const SizedBox(height: 20),
              ],
            );
          }),
        ],
      ),
    );
  }
}

/// ================= COMMON SLOT ITEM =================
class SlotItem extends StatelessWidget {
  final String time;
  final bool isOccupied;

  const SlotItem({super.key, required this.time, required this.isOccupied});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isOccupied ? Colors.red.shade50 : Colors.green.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time),
              Chip(
                label: Text(isOccupied ? "Occupied" : "Available",
                    style: AppTextStyles.font14BlackRegular),
                backgroundColor: isOccupied ? Colors.red : Colors.green,
              ),
            ],
          ),
        ),
        if (isOccupied)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: AppDecorations.containerDecoration,
            child: Column(
              children: [
                vGap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(time),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline_outlined,
                            color: Colors.red))
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
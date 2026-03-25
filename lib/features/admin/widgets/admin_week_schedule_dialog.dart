import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/admin_class_model.dart';
import '../data/models/schedule_slot_model.dart';
import '../manager/admin_cubit.dart';

class AdminWeekScheduleDialog extends StatefulWidget {
  const AdminWeekScheduleDialog({super.key});

  @override
  State<AdminWeekScheduleDialog> createState() => _AdminWeekScheduleDialogState();
}

class _AdminWeekScheduleDialogState extends State<AdminWeekScheduleDialog> {

  final days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

  final times = [
    "07:00","08:00","09:00","10:00",
    "11:00","12:00","13:00","14:00"
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdminCubit>();
    final slots = cubit.slots;

    return Dialog(
      insetPadding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          /// 🔥 HEADER
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                      "Weekly Schedule View",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Click any slot to add schedule",
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

          /// 🔥 BODY
          Expanded(
            child: Row(
              children: [

                /// ⏰ TIME COLUMN
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _timeHeader(),
                      ...times.map((t) => _timeCell(t)),
                    ],
                  ),
                ),

                /// 📅 GRID
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          /// DAYS HEADER
                          Row(
                            children: days.map((d) => _dayHeader(d)).toList(),
                          ),

                          /// GRID
                          ...times.map((time) {
                            return Row(
                              children: days.map((day) {

                                final slot = slots.firstWhere(
                                      (s) =>
                                  s.day == day &&
                                      s.startTime == time,
                                  orElse: () => ScheduleSlot(
                                    id: "",
                                    day: day,
                                    startTime: time,
                                    endTime: _nextHour(time),
                                  ),
                                );

                                return GestureDetector(
                                  onTap: () {
                                    _openDialog(day, time);
                                  },
                                  child: _cell(slot),
                                );

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

  /// ================= UI =================

  Widget _dayHeader(String day) {
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
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _timeHeader() {
    return Container(
      width: 80,
      height: 50,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Text("Time")),
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
      child: Center(child: Text(time)),
    );
  }

  Widget _cell(ScheduleSlot slot) {
    final cubit = context.read<AdminCubit>();
    final isEmpty = !slot.isOccupied;

    String className = "";

    if (!isEmpty && slot.classId != null) {
      final c = cubit.classes.firstWhere((e) => e.id == slot.classId);
      className = c.name;
    }

    return Container(
      width: 110,
      height: 70,
      margin: const EdgeInsets.all(4),
      child: Stack(
        children: [

          /// 🔵 الخلفية
          Container(
            decoration: BoxDecoration(
              color: isEmpty
                  ? Colors.grey.shade100
                  : const Color(0xff3B82F6),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(6),
            child: isEmpty
                ? const Center(child: Icon(Icons.add))
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${slot.startTime} - ${slot.endTime}",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 9),
                ),
                const SizedBox(height: 4),
                Text(
                  className,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ],
            ),
          ),

          if (!isEmpty)
            Positioned(
              top: 2,
              right: 2,
              child: GestureDetector(
                onTap: () {
                  _confirmDelete(slot);
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );

  }

  /// ================= LOGIC =================

  void _openDialog(String day, String time) {
    showDialog(
      context: context,
      builder: (_) => AddScheduleDialog(
        day: day,
        start: time,
        end: _nextHour(time),
      ),
    );
  }

  String _nextHour(String time) {
    final h = int.parse(time.split(":")[0]);
    return "${(h + 1).toString().padLeft(2, '0')}:00";
  }

  void _confirmDelete(ScheduleSlot slot) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Schedule"),
        content: const Text("Are you sure you want to delete this slot?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AdminCubit>().deleteSchedule(slot.id);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}

class AddScheduleDialog extends StatefulWidget {
  final String day;
  final String start;
  final String end;

  final ScheduleSlot? slot;

  const AddScheduleDialog({
    super.key,
    required this.day,
    required this.start,
    required this.end,
    this.slot,
  });

  @override
  State<AddScheduleDialog> createState() => _AddScheduleDialogState();
}

class _AddScheduleDialogState extends State<AddScheduleDialog> {
  AdminClassModel? selectedClass;

  @override
  void initState() {
    super.initState();
    if (widget.slot != null && widget.slot!.classId != null) {
      final cubit = context.read<AdminCubit>();
      try {
        selectedClass = cubit.classes.firstWhere((c) => c.id == widget.slot!.classId);
      } catch (_) {
        selectedClass = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdminCubit>();
    final classes = cubit.classes;

    final start = widget.slot?.startTime ?? widget.start;
    final end = widget.slot?.endTime ?? widget.end;

    return AlertDialog(
      title: Text("Add Schedule"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text("Day: "),
              Text(widget.day, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Time: "),
              Text("$start - $end", style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButton<AdminClassModel>(
            value: selectedClass,
            hint: const Text("Select Class"),
            isExpanded: true,
            items: classes.map((c) {
              return DropdownMenuItem(
                value: c,
                child: Text(c.name),
              );
            }).toList(),
            onChanged: (val) {
              setState(() {
                selectedClass = val;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: selectedClass == null
              ? null
              : () {
            final slot = ScheduleSlot(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              day: widget.day,
              startTime: start,
              endTime: end,
              classId: selectedClass!.id,
              teacherId: null,
            );

            context.read<AdminCubit>().addSchedule(slot);
            Navigator.pop(context);
          },
          child: const Text("Add"),
        )
      ],
    );
  }
}
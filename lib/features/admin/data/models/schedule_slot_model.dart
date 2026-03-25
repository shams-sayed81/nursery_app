class ScheduleSlot {
  final String id;
  final String day;
  final String startTime;
  final String endTime;

  final String? teacherId;
  final String? classId;

  ScheduleSlot({
    required this.id,
    required this.day,
    required this.startTime,
    required this.endTime,
    this.teacherId,
    this.classId,
  });

  bool get isOccupied => teacherId != null || classId != null;
}
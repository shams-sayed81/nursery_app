import 'package:equatable/equatable.dart';

import '../../../../core/enums/daily_status_enum.dart';

class DailyEntryModel extends Equatable {
  final String id;
  final DailyEntryType type;
  final DateTime date;

  final String? title;
  final String? imageUrl;
  final String? caption;

  final DateTime? startTime;
  final DateTime? endTime;

  final String? moodValue;

  const DailyEntryModel({
    required this.id,
    required this.type,
    required this.date,
    this.title,
    this.imageUrl,
    this.caption,
    this.startTime,
    this.endTime,
    this.moodValue,
  });

  DailyStatus get status {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final entryDate = DateTime(date.year, date.month, date.day);

    if (entryDate.isAtSameMomentAs(today)) return DailyStatus.today;
    if (entryDate.isAfter(today)) return DailyStatus.scheduled;
    return DailyStatus.history;
  }

  Duration? get napDuration {
    if (startTime != null && endTime != null) {
      return endTime!.difference(startTime!);
    }
    return null;
  }

  factory DailyEntryModel.fromJson(Map<String, dynamic> json) {
    return DailyEntryModel(
      id: json['id'],
      type: DailyEntryType.values.firstWhere(
              (e) => e.toString() == 'DailyEntryType.${json['type']}'),
      date: DateTime.parse(json['date']),
      title: json['title'],
      imageUrl: json['imageUrl'],
      caption: json['caption'],
      startTime:
      json['startTime'] != null ? DateTime.parse(json['startTime']) : null,
      endTime:
      json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      moodValue: json['moodValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString().split('.').last,
      'date': date.toIso8601String(),
      'title': title,
      'imageUrl': imageUrl,
      'caption': caption,
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'moodValue': moodValue,
    };
  }

  DailyEntryModel copyWith({
    DailyEntryType? type,
    DateTime? date,
    String? title,
    String? imageUrl,
    String? caption,
    DateTime? startTime,
    DateTime? endTime,
    String? moodValue,
  }) {
    return DailyEntryModel(
      id: id,
      type: type ?? this.type,
      date: date ?? this.date,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      caption: caption ?? this.caption,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      moodValue: moodValue ?? this.moodValue,
    );
  }

  @override
  List<Object?> get props =>
      [id, type, date, title, imageUrl, caption, startTime, endTime, moodValue];
}
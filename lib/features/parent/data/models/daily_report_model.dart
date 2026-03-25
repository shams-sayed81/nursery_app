import 'package:equatable/equatable.dart';
import 'daily_entry_model.dart';

class DailyReportModel extends Equatable {
  final String id;
  final String childId;
  final DateTime date;

  final List<DailyEntryModel> entries;

  const DailyReportModel({
    required this.id,
    required this.childId,
    required this.date,
    required this.entries,
  });

  factory DailyReportModel.fromJson(Map<String, dynamic> json) {
    return DailyReportModel(
      id: json['id'],
      childId: json['childId'],
      date: DateTime.parse(json['date']),
      entries: (json['entries'] as List)
          .map((e) => DailyEntryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'childId': childId,
      'date': date.toIso8601String(),
      'entries': entries.map((e) => e.toJson()).toList(),
    };
  }

  DailyReportModel copyWith({
    String? childId,
    DateTime? date,
    List<DailyEntryModel>? entries,
  }) {
    return DailyReportModel(
      id: id,
      childId: childId ?? this.childId,
      date: date ?? this.date,
      entries: entries ?? this.entries,
    );
  }

  @override
  List<Object?> get props => [id, childId, date, entries];
}
import 'package:equatable/equatable.dart';

class PhotoModel extends Equatable {
  final String id;
  final String childId;
  final DateTime date;
  final String imageUrl;
  final String? caption;

  const PhotoModel({
    required this.id,
    required this.childId,
    required this.date,
    required this.imageUrl,
    this.caption,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      childId: json['childId'],
      date: DateTime.parse(json['date']),
      imageUrl: json['imageUrl'],
      caption: json['caption'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'childId': childId,
      'date': date.toIso8601String(),
      'imageUrl': imageUrl,
      'caption': caption,
    };
  }

  @override
  List<Object?> get props => [id, childId, date, imageUrl, caption];
}
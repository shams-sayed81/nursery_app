import 'package:equatable/equatable.dart';

enum PaymentStatus {
  pending,
  overdue,
  fullyPaid,
  noPlan,
}


class ChildModel extends Equatable {
  final String id;
  final String name;
  final int age;
  final String classId;
  final String parentId;
  final String religion;
  final String className;
  final String year;

  final double? paid;
  final double? total;
  final PaymentStatus? paymentStatus;

  const ChildModel({
    required this.id,
    required this.name,
    required this.age,
    required this.classId,
    required this.parentId,
    required this.religion,
    required this.className,
    required this.year,

    this.paid,
    this.total,
    this.paymentStatus,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      classId: json['classId'],
      parentId: json['parentId'],
      religion: json['religion'],
      className: json['className'],
      year: json['year'],

      /// NEW
      paid: (json['paid'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      paymentStatus: json['paymentStatus'] != null
          ? PaymentStatus.values.firstWhere(
            (e) => e.name == json['paymentStatus'],
      )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'classId': classId,
      'parentId': parentId,
      'religion': religion,
      'className': className,
      'year': year,

      'paid': paid,
      'total': total,
      'paymentStatus': paymentStatus?.name,
    };
  }

  ChildModel copyWith({
    String? name,
    int? age,
    String? classId,
    String? parentId,
    String? religion,
    String? className,
    String? year,

    double? paid,
    double? total,
    PaymentStatus? paymentStatus,
  }) {
    return ChildModel(
      id: id,
      name: name ?? this.name,
      age: age ?? this.age,
      classId: classId ?? this.classId,
      parentId: parentId ?? this.parentId,
      religion: religion ?? this.religion,
      className: className ?? this.className,
      year: year ?? this.year,

      paid: paid ?? this.paid,
      total: total ?? this.total,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    age,
    classId,
    parentId,
    religion,
    className,
    year,
    paid,
    total,
    paymentStatus,
  ];
}
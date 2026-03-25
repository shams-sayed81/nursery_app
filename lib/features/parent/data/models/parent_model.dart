import 'package:equatable/equatable.dart';

import 'child_model.dart';

class ParentModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final List<ChildModel> children;

  const ParentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.children,
    required this.password
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['pass'],
      children: List<ChildModel>.from(json['children'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'children': children,
      'pass': password
    };
  }

  ParentModel copyWith({
    String? name,
    String? email,
    List<ChildModel>? children,
    String? pass
  }) {
    return ParentModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      children: children ?? this.children,
      password: pass?? password
    );
  }

  @override
  List<Object?> get props => [id, name, email, children, password];
}
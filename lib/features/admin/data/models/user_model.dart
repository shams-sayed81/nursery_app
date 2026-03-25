import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String fullName;
  final String role;
  final String password;
  final String? avatarUrl;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.role,
    required this.password,
    this.avatarUrl,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? role,
    String? password,
    String? avatarUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      password: password ?? this.password,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  List<Object?> get props => [
    id,
    fullName,
    role,
    password,
    avatarUrl,
  ];
}
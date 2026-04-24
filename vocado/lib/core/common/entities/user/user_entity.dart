import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String role;
  final String specialty;

  const UserEntity({
    required this.id,
    required this.name,
    required this.role,
    required this.specialty,
  });

  @override
  List<Object?> get props => [specialty, role, name, id];
}

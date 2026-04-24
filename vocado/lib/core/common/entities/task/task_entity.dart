import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  
  final int id;
  final String title;
  final String assignee;
  final String dueDate;
  final String status;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.assignee,
    required this.dueDate,
    required this.status,
  });

  @override
  List<Object?> get props => [status, dueDate, assignee, id];
}

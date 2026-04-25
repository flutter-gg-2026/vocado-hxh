import 'package:equatable/equatable.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';

abstract class TaskViewerState extends Equatable {
  const TaskViewerState();

  @override
  List<Object?> get props => [];
}

class TaskViewerInitialState extends TaskViewerState {}
class TaskViewerLoadingState extends TaskViewerState {}

class TaskViewerSuccessState extends TaskViewerState {
  final List<TaskEntity> allTasks;
  final List<TaskEntity> newTasks;
  final List<TaskEntity> lateTasks;
  final List<TaskEntity> inProgressTasks;
  const TaskViewerSuccessState({
    required this.allTasks,
    required this.newTasks,
    required this.lateTasks,
    required this.inProgressTasks,
  });

}

class TaskViewerErrorState extends TaskViewerState {
  final String message;
  const TaskViewerErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

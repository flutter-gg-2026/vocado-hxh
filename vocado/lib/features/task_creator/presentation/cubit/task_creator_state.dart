import 'package:equatable/equatable.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';

abstract class TaskCreatorState extends Equatable {
  const TaskCreatorState();

  @override
  List<Object?> get props => [];
}

class TaskCreatorInitialState extends TaskCreatorState {}

class TaskCreatorSuccessState extends TaskCreatorState {
  final List<TaskEntity> tasks;

  const TaskCreatorSuccessState(this.tasks);
}

class TaskRecordingLoadingState extends TaskCreatorState {}

class TaskRecordingState extends TaskCreatorState {
  final String? text;
  final bool start;

  const TaskRecordingState({required this.start, this.text});

  @override
  List<Object?> get props => [start, text];
}

class TaskCreatedState extends TaskCreatorState {
  final TaskEntity task;

  const TaskCreatedState(this.task);
}

class TaskCreatorErrorState extends TaskCreatorState {
  final String message;
  const TaskCreatorErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

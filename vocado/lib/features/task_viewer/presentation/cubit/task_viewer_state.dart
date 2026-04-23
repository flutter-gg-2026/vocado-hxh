import 'package:equatable/equatable.dart';

abstract class TaskViewerState extends Equatable {
  const TaskViewerState();

  @override
  List<Object?> get props => [];
}

class TaskViewerInitialState extends TaskViewerState {}
class TaskViewerSuccessState extends TaskViewerState {}

class TaskViewerErrorState extends TaskViewerState {
  final String message;
  const TaskViewerErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


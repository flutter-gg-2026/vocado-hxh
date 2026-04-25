import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskViewerUseCase _taskViewerUseCase;

  TaskViewerCubit(this._taskViewerUseCase) : super(TaskViewerInitialState());

  Future<void> getTaskViewerMethod() async {
    final result = await _taskViewerUseCase.getTaskViewer();
    result.fold(
      (onleft) {
        emit(TaskViewerErrorState(message: onleft.message));
      },
      (onright) {
        emit(
          TaskViewerSuccessState(
            allTasks: onright,
            newTasks: onright.where((t) => t.status == "New").toList(),
            lateTasks: onright.where((t) => t.status == "Late").toList(),
            inProgressTasks: onright
                .where((t) => t.status == "In Progress")
                .toList(),
          ),
        );
      },
    );
  }

  Future<void> updateTaskMethod() async {
    final result = await _taskViewerUseCase.getTaskViewer();
    result.fold(
      (onleft) {
        emit(TaskViewerErrorState(message: onleft.message));
      },
      (onright) {
        // emit(TaskViewerSuccessState(tasks: onright));
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskViewerUseCase _taskViewerUseCase;

  TaskViewerCubit(this._taskViewerUseCase) : super(TaskViewerInitialState());

  /// Fetches all tasks for the current user and categorizes them into:
  /// - New tasks (not overdue)
  /// - Late tasks (past due date and not done)
  /// - In-progress tasks (currently being worked on and not overdue)
  ///
  /// Emits loading, error, or success states depending on the result.
  Future<void> getTaskViewerMethod() async {
    emit(TaskViewerLoadingState());
    final result = await _taskViewerUseCase.getTaskViewer();
    result.fold(
      (onleft) {
        emit(TaskViewerErrorState(message: onleft.message));
      },
      (onright) {
        final newTasks = onright
            .where(
              (t) => t.status == "New" && t.dueDate.isAfter(DateTime.now()),
            )
            .toList();
        final lateTasks = onright
            .where(
              (t) => t.status != "Done" && t.dueDate.isBefore(DateTime.now()),
            )
            .toList();
        final inProgressTask = onright
            .where(
              (t) =>
                  t.status == "In Progress" &&
                  t.dueDate.isAfter(DateTime.now()),
            )
            .toList();
        emit(
          TaskViewerSuccessState(
            allTasks: onright,
            newTasks: newTasks,
            lateTasks: lateTasks,
            inProgressTasks: inProgressTask,
          ),
        );
      },
    );
  }

  /// Updates the status of a specific task in the database.
  ///
  /// After a successful update, it refreshes the task list by calling
  /// [getTaskViewerMethod] to ensure the UI reflects the latest data.
  ///
  /// Emits an error state if the update fails.

  Future<void> updateTaskMethod({
    required int id,
    required String newStatus,
  }) async {
    final result = await _taskViewerUseCase.updateTask(
      id: id,
      newStatus: newStatus,
    );
    result.fold(
      (onleft) {
        emit(TaskViewerErrorState(message: onleft.message));
      },
      (onright) async {
        await getTaskViewerMethod();
      },
    );
  }
}

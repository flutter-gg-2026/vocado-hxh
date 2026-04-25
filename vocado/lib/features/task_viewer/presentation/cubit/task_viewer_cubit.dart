import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskViewerUseCase _taskViewerUseCase;

  TaskViewerCubit(this._taskViewerUseCase) : super(TaskViewerInitialState());
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

  Future<void> updateTaskMethod({
    required int id,
    required String newStatus,
  }) async {
    print("--------1$newStatus");
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

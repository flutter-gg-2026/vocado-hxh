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
        emit(TaskViewerSuccessState());
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}

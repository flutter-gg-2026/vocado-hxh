import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_creator/domain/use_cases/task_creator_use_case.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';

class TaskCreatorCubit extends Cubit<TaskCreatorState> {
  final TaskCreatorUseCase _taskCreatorUseCase;

  TaskCreatorCubit(this._taskCreatorUseCase) : super(TaskCreatorInitialState());

  Future<void> startVoiceMethod() async {
    print("Cubit startVoiceMethod called");
    emit(TaskRecordingLoadingState());
    final result = await _taskCreatorUseCase.startVoice();

    result.fold(
      (failure) {
        emit(TaskCreatorErrorState(message: failure.message));
      },
      (success) {
        emit(TaskRecordingState(start: true));
      },
    );
  }

  Future<void> stopVoiceMethod() async {
    print("Cubit stopVoiceMethod called");
    emit(TaskRecordingLoadingState());
    final result = await _taskCreatorUseCase.stopVoice();
    print("2️⃣ UseCase returned");

    result.fold(
      (failure) {
        print("3️⃣ FAILURE: ${failure.message}");

        emit(TaskCreatorErrorState(message: failure.message));
      },
      (task) {
        print("3️⃣ SUCCESS: ${task.title}");
        emit(TaskCreatedState(task));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}

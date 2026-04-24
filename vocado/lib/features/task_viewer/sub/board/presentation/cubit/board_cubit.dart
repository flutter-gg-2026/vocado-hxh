import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/sub/board/domain/use_cases/board_use_case.dart';
import 'package:vocado/features/task_viewer/sub/board/presentation/cubit/board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  final BoardUseCase _boardUseCase;

  BoardCubit(this._boardUseCase) : super(BoardInitialState());

  Future<void> getBoardMethod() async {
    final result = await _boardUseCase.getBoard();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}

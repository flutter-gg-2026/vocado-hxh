import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/view_member/domain/use_cases/view_member_use_case.dart';
import 'package:vocado/features/view_member/presentation/cubit/view_member_state.dart';

class ViewMemberCubit extends Cubit<ViewMemberState> {
  final ViewMemberUseCase _viewMemberUseCase;

  ViewMemberCubit(this._viewMemberUseCase) : super(ViewMemberInitialState()) {
    getViewMemberMethod();
  }

  Future<void> getViewMemberMethod() async {
    final result = await _viewMemberUseCase.getMember();
    result.when(
      (success) {
        emit(ViewMemberSuccessState(users: success));
      },
      (whenError) {
        emit(ViewMemberErrorState(message: whenError.message));
      },
    );
  }
}

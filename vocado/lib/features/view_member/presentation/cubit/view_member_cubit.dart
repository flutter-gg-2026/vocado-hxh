import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/view_member/domain/use_cases/view_member_use_case.dart';
import 'package:vocado/features/view_member/presentation/cubit/view_member_state.dart';

class ViewMemberCubit extends Cubit<ViewMemberState> {
  final ViewMemberUseCase _viewMemberUseCase;

  ViewMemberCubit(this._viewMemberUseCase) : super(ViewMemberInitialState()) {
    viewMemberMethod();
  }

  Future<void> viewMemberMethod() async {
    final result = await _viewMemberUseCase.getMember();
    result.fold(
      (onLeft) {
        emit(ViewMemberErrorState(message: onLeft.message));
      },
      (onRight) {
        emit(ViewMemberSuccessState(users: onRight));
      },
    );
  }
}

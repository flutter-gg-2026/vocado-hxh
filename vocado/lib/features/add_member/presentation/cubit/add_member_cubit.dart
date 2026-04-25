import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/add_member/domain/use_cases/add_member_use_case.dart';
import 'package:vocado/features/add_member/presentation/cubit/add_member_state.dart';

class AddMemberCubit extends Cubit<AddMemberState> {
  final AddMemberUseCase _addMemberUseCase;

  AddMemberCubit(this._addMemberUseCase) : super(AddMemberInitialState()) {
    getAddMemberMethod();
  }

  Future<void> getAddMemberMethod() async {
    final result = await _addMemberUseCase.getAddMember();
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

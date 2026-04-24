import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:vocado/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitialState());

  Future<void> getAuthMethod({
    required String email,
    required String password,
  }) async {
    final result = await _authUseCase.getAuth(email: email, password: password);
    result.when(
      (success) {
        emit(AuthSuccessState());
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}

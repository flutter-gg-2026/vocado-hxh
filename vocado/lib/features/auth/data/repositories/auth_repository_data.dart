import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/user/user_entity.dart';
import 'package:vocado/core/common/model/user_model/user_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';

import 'package:vocado/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';

@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain {
  final BaseAuthRemoteDataSource remoteDataSource;

  AuthRepositoryData(this.remoteDataSource);

  @override
  Future<Result<UserEntity, Failure>> getAuth({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.getAuth(
        email: email,
        password: password,
      );
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

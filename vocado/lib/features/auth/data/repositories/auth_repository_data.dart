
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';

import 'package:vocado/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';

@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain{
  final BaseAuthRemoteDataSource remoteDataSource;


  AuthRepositoryData(this.remoteDataSource);

@override
  Future<Result<void, Failure>> getAuth({
      required String email,
      required String password,
    }) async {
    try {
      final response = await remoteDataSource.getAuth(email: email,password: password);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/domain/entities/auth_entity.dart';
import 'package:vocado/features/auth/domain/repositories/auth_repository_domain.dart';


@lazySingleton
class AuthUseCase {
  final AuthRepositoryDomain _repositoryData;

  AuthUseCase(this._repositoryData);

   Future<Result<AuthEntity, Failure>> getAuth() async {
    return _repositoryData.getAuth();
  }
}

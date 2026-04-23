import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepositoryDomain {
    Future<Result<AuthEntity, Failure>> getAuth();
}

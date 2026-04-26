import 'package:fpdart/fpdart.dart';
import 'package:vocado/core/common/entities/user/user_entity.dart';
import 'package:vocado/core/errors/failure.dart';

abstract class ViewMemberRepositoryDomain {
Future<Either<Failure,List<UserEntity>>> getMember();
}

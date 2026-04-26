import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/user/user_entity.dart';
import 'package:vocado/core/errors/failure.dart';

abstract class ViewMemberRepositoryDomain {
 Future<Result<List<UserEntity>, Failure>> getMember();
}

import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/common/entities/user/user_entity.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/view_member/domain/repositories/view_member_repository_domain.dart';


@lazySingleton
class ViewMemberUseCase {
  final ViewMemberRepositoryDomain _repositoryData;

  ViewMemberUseCase(this._repositoryData);

   Future<Result<List<UserEntity>, Failure>> getMember() async {
    return _repositoryData.getMember();
  }
}

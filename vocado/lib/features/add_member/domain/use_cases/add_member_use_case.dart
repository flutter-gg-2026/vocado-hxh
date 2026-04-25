import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/add_member/domain/entities/add_member_entity.dart';
import 'package:vocado/features/add_member/domain/repositories/add_member_repository_domain.dart';


@lazySingleton
class AddMemberUseCase {
  final AddMemberRepositoryDomain _repositoryData;

  AddMemberUseCase(this._repositoryData);

   Future<Result<AddMemberEntity, Failure>> getAddMember() async {
    return _repositoryData.getAddMember();
  }
}

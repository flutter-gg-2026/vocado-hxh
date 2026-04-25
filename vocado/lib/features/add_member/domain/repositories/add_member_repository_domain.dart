import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/add_member/domain/entities/add_member_entity.dart';

abstract class AddMemberRepositoryDomain {
    Future<Result<AddMemberEntity, Failure>> getAddMember();
}

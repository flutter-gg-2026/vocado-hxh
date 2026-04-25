
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/add_member/domain/entities/add_member_entity.dart';

import 'package:vocado/features/add_member/data/datasources/add_member_remote_data_source.dart';
import 'package:vocado/features/add_member/data/models/add_member_model.dart';
import 'package:vocado/features/add_member/domain/repositories/add_member_repository_domain.dart';

@LazySingleton(as: AddMemberRepositoryDomain)
class AddMemberRepositoryData implements AddMemberRepositoryDomain{
  final BaseAddMemberRemoteDataSource remoteDataSource;


  AddMemberRepositoryData(this.remoteDataSource);

@override
  Future<Result<AddMemberEntity, Failure>> getAddMember() async {
    try {
      final response = await remoteDataSource.getAddMember();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

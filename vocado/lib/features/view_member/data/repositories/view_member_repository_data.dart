import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/user/user_entity.dart';
import 'package:vocado/core/common/model/user_model/user_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';

import 'package:vocado/features/view_member/data/datasources/view_member_remote_data_source.dart';
import 'package:vocado/features/view_member/domain/repositories/view_member_repository_domain.dart';

@LazySingleton(as: ViewMemberRepositoryDomain)
class ViewMemberRepositoryData implements ViewMemberRepositoryDomain {
  final BaseViewMemberRemoteDataSource remoteDataSource;

  ViewMemberRepositoryData(this.remoteDataSource);

  Future<Result<List<UserEntity>, Failure>> getMember() async {
    try {
      final response = await remoteDataSource.getMember();
      final users = response.map((u) => u.toEntity()).toList();

      return Success(users);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

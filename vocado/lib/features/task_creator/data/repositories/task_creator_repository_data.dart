
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';

import 'package:vocado/features/task_creator/data/datasources/task_creator_remote_data_source.dart';
import 'package:vocado/features/task_creator/data/models/task_creator_model.dart';
import 'package:vocado/features/task_creator/domain/repositories/task_creator_repository_domain.dart';

@LazySingleton(as: TaskCreatorRepositoryDomain)
class TaskCreatorRepositoryData implements TaskCreatorRepositoryDomain{
  final BaseTaskCreatorRemoteDataSource remoteDataSource;


  TaskCreatorRepositoryData(this.remoteDataSource);

@override
  Future<Result<TaskCreatorEntity, Failure>> getTaskCreator() async {
    try {
      final response = await remoteDataSource.getTaskCreator();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

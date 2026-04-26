import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/common/model/task_model/task_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_creator/data/datasources/task_creator_remote_data_source.dart';
import 'package:vocado/features/task_creator/domain/repositories/task_creator_repository_domain.dart';

@LazySingleton(as: TaskCreatorRepositoryDomain)
class TaskCreatorRepositoryData
    implements TaskCreatorRepositoryDomain {

  final BaseTaskCreatorRemoteDataSource remoteDataSource;

  TaskCreatorRepositoryData(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> startVoice() async {
    try {
      await remoteDataSource.startVoice();

      return const Right(true);

    } catch (error) {
      return Left(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> stopVoice() async {
    try {
      final response =
          await remoteDataSource.stopVoice();

      return Right(
        response.toEntity(),
      );

    } catch (error) {
      return Left(
        FailureExceptions.getException(error),
      );
    }
  }
  @override
Future<Either<Failure, List<TaskEntity>>> getAllTask() async {
  try {
    final response = await remoteDataSource.getAllTask();

    return Right(
      response.map((e) => e.toEntity()).toList(),
    );

  } catch (error) {
    return Left(
      FailureExceptions.getException(error),
    );
  }
}
}
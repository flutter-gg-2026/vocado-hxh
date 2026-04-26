import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_creator/domain/repositories/task_creator_repository_domain.dart';

@lazySingleton
class TaskCreatorUseCase {
  final TaskCreatorRepositoryDomain _repositoryData;
  TaskCreatorUseCase(this._repositoryData);

  Future<Either<Failure, bool>> startVoice() async {
    return _repositoryData.startVoice();
  }

  Future<Either<Failure, TaskEntity>> stopVoice() {
    return _repositoryData.stopVoice();
  }

  Future<Either<Failure, List<TaskEntity>>> getAllTask() {
    return _repositoryData.getAllTask();
  }
}

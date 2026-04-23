import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:vocado/features/task_creator/domain/repositories/task_creator_repository_domain.dart';


@lazySingleton
class TaskCreatorUseCase {
  final TaskCreatorRepositoryDomain _repositoryData;

  TaskCreatorUseCase(this._repositoryData);

   Future<Result<TaskCreatorEntity, Failure>> getTaskCreator() async {
    return _repositoryData.getTaskCreator();
  }
}

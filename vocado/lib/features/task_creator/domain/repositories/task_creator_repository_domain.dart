import 'package:fpdart/fpdart.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/errors/failure.dart';

abstract class TaskCreatorRepositoryDomain {
  Future<Either<Failure, bool>> startVoice();
  Future<Either<Failure, TaskEntity>> stopVoice();
 Future<Either<Failure, List<TaskEntity>>> getAllTask();
}

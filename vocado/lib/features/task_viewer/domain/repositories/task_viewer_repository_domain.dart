import 'package:fpdart/fpdart.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/errors/failure.dart';

abstract class TaskViewerRepositoryDomain {
  Future<Either<Failure, List<TaskEntity>>> getTaskViewer();
  Future<Either<Failure, List<TaskEntity>>> updateTask();
}

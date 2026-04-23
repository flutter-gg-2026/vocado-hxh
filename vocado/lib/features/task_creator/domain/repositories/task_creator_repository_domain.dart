import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';

abstract class TaskCreatorRepositoryDomain {
    Future<Result<TaskCreatorEntity, Failure>> getTaskCreator();
}

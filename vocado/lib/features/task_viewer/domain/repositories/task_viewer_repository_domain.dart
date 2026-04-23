import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_viewer_entity.dart';

abstract class TaskViewerRepositoryDomain {
    Future<Result<TaskViewerEntity, Failure>> getTaskViewer();
}

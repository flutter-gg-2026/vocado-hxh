import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';


@lazySingleton
class TaskViewerUseCase {
  final TaskViewerRepositoryDomain _repositoryData;

  TaskViewerUseCase(this._repositoryData);

   Future<Result<TaskViewerEntity, Failure>> getTaskViewer() async {
    return _repositoryData.getTaskViewer();
  }
}

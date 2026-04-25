import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';


@lazySingleton
class TaskViewerUseCase {
  final TaskViewerRepositoryDomain _repositoryData;

  TaskViewerUseCase(this._repositoryData);

  Future<Either<Failure, List<TaskEntity>>>getTaskViewer() async {
    return _repositoryData.getTaskViewer();
  }

  Future<Either<Failure, List<TaskEntity>>>updateTask() async {
    return _repositoryData.getTaskViewer();
  }
}

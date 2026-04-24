import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
import 'package:vocado/core/common/model/task_model/task_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:vocado/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart';
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@LazySingleton(as: TaskViewerRepositoryDomain)
class TaskViewerRepositoryData implements TaskViewerRepositoryDomain {
  final BaseTaskViewerRemoteDataSource remoteDataSource;

  TaskViewerRepositoryData(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTaskViewer() async {
    try {
      final response = await remoteDataSource.getTaskViewer();
              print("-------fffffffffff");

      final tasks = response.map((task) => task.toEntity()).toList();
        print("-------fffffffffff");

      return Either.right(tasks);
    } catch (error) {
      return Either.left(FailureExceptions.getException(error));
    }
  }
}

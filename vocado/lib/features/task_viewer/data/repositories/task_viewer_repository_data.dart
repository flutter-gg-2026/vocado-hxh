
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_viewer_entity.dart';

import 'package:vocado/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart';
import 'package:vocado/features/task_viewer/data/models/task_viewer_model.dart';
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@LazySingleton(as: TaskViewerRepositoryDomain)
class TaskViewerRepositoryData implements TaskViewerRepositoryDomain{
  final BaseTaskViewerRemoteDataSource remoteDataSource;


  TaskViewerRepositoryData(this.remoteDataSource);

@override
  Future<Result<TaskViewerEntity, Failure>> getTaskViewer() async {
    try {
      final response = await remoteDataSource.getTaskViewer();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

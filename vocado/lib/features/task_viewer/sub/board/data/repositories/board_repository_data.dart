
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/sub/board/domain/entities/board_entity.dart';

import 'package:vocado/features/task_viewer/sub/board/data/datasources/board_remote_data_source.dart';
import 'package:vocado/features/task_viewer/sub/board/data/models/board_model.dart';
import 'package:vocado/features/task_viewer/sub/board/domain/repositories/board_repository_domain.dart';

@LazySingleton(as: BoardRepositoryDomain)
class BoardRepositoryData implements BoardRepositoryDomain{
  final BaseBoardRemoteDataSource remoteDataSource;


  BoardRepositoryData(this.remoteDataSource);

@override
  Future<Result<BoardEntity, Failure>> getBoard() async {
    try {
      final response = await remoteDataSource.getBoard();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}

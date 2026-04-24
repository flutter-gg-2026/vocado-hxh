import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/sub/board/domain/entities/board_entity.dart';
import 'package:vocado/features/task_viewer/sub/board/domain/repositories/board_repository_domain.dart';


@lazySingleton
class BoardUseCase {
  final BoardRepositoryDomain _repositoryData;

  BoardUseCase(this._repositoryData);

   Future<Result<BoardEntity, Failure>> getBoard() async {
    return _repositoryData.getBoard();
  }
}

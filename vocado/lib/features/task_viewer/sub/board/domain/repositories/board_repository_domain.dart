import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/sub/board/domain/entities/board_entity.dart';

abstract class BoardRepositoryDomain {
    Future<Result<BoardEntity, Failure>> getBoard();
}

import 'package:vocado/features/task_viewer/sub/board/domain/entities/board_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'board_model.freezed.dart';
part 'board_model.g.dart';

@freezed
abstract class BoardModel with _$BoardModel {
  const factory BoardModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _BoardModel;

  factory BoardModel.fromJson(Map<String, Object?> json) => _$BoardModelFromJson(json);
}



extension BoardModelMapper on BoardModel {
  BoardEntity toEntity() {
    return BoardEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }

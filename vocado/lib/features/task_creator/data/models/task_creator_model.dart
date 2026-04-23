import 'package:vocado/features/task_creator/domain/entities/task_creator_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_creator_model.freezed.dart';
part 'task_creator_model.g.dart';

@freezed
abstract class TaskCreatorModel with _$TaskCreatorModel {
  const factory TaskCreatorModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _TaskCreatorModel;

  factory TaskCreatorModel.fromJson(Map<String, Object?> json) => _$TaskCreatorModelFromJson(json);
}



extension TaskCreatorModelMapper on TaskCreatorModel {
  TaskCreatorEntity toEntity() {
    return TaskCreatorEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }

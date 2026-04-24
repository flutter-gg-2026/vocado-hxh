import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocado/core/common/entities/task/task_entity.dart';
part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    required String assignee,
    required String dueDate,
    required String status,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) =>
      _$TaskModelFromJson(json);
}

extension TaskModelMapper on TaskModel {
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      assignee: assignee,
      dueDate: dueDate,
      status: status,
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  assignee: json['assignee'] as String,
  dueDate: DateTime.parse(json['due_date'] as String),
  status: json['status'] as String,
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'assignee': instance.assignee,
      'due_date': instance.dueDate.toIso8601String(),
      'status': instance.status,
    };

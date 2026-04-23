// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskCreatorModel _$TaskCreatorModelFromJson(Map<String, dynamic> json) =>
    _TaskCreatorModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$TaskCreatorModelToJson(_TaskCreatorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

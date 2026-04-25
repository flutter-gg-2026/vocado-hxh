// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddMemberModel _$AddMemberModelFromJson(Map<String, dynamic> json) =>
    _AddMemberModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$AddMemberModelToJson(_AddMemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

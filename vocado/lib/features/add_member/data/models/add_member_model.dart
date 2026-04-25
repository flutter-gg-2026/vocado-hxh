import 'package:vocado/features/add_member/domain/entities/add_member_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_member_model.freezed.dart';
part 'add_member_model.g.dart';

@freezed
abstract class AddMemberModel with _$AddMemberModel {
  const factory AddMemberModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AddMemberModel;

  factory AddMemberModel.fromJson(Map<String, Object?> json) => _$AddMemberModelFromJson(json);
}



extension AddMemberModelMapper on AddMemberModel {
  AddMemberEntity toEntity() {
    return AddMemberEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }

import 'package:equatable/equatable.dart';
import 'package:vocado/core/common/entities/user/user_entity.dart';

abstract class ViewMemberState extends Equatable {
  const ViewMemberState();

  @override
  List<Object?> get props => [];
}

class ViewMemberInitialState extends ViewMemberState {}

class ViewMemberSuccessState extends ViewMemberState {
  final List<UserEntity> users;
  const ViewMemberSuccessState({required this.users});
  @override
  List<Object?> get props => [users];
}

class ViewMemberErrorState extends ViewMemberState {
  final String message;
  const ViewMemberErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

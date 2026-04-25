import 'package:equatable/equatable.dart';

abstract class AddMemberState extends Equatable {
  const AddMemberState();

  @override
  List<Object?> get props => [];
}

class AddMemberInitialState extends AddMemberState {}
class AddMemberSuccessState extends AddMemberState {}

class AddMemberErrorState extends AddMemberState {
  final String message;
  const AddMemberErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


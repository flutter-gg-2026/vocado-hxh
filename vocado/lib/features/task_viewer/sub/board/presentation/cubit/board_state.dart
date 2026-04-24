import 'package:equatable/equatable.dart';

abstract class BoardState extends Equatable {
  const BoardState();

  @override
  List<Object?> get props => [];
}

class BoardInitialState extends BoardState {}
class BoardSuccessState extends BoardState {}

class BoardErrorState extends BoardState {
  final String message;
  const BoardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


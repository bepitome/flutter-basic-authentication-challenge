import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthorizedInitState extends AuthState {}

class AuthorizedState extends AuthState {
  final String userId;

  AuthorizedState(this.userId);

  @override
  List<Object?> get props => [userId];

}

class UnAuthorizedState extends AuthState {}
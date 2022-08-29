import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthorizedInitState extends AuthState {}

class AuthorizedState extends AuthState {}

class UnAuthorizedState extends AuthState {}
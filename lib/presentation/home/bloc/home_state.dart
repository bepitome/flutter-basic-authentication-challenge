import 'package:basic_auth_challenge/domain/entity/user.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeEmptyState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<User> data;

  HomeSuccessState(this.data);

  @override
  List<Object?> get props => [data];
}

class HomeErrorState extends HomeState {}
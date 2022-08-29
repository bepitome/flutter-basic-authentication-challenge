import 'package:basic_auth_challenge/domain/usecases/get_users_usecase.dart';
import 'package:basic_auth_challenge/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUsersUseCase _getUsersUseCase;

  HomeCubit({required GetUsersUseCase getUsersUseCase})
      : _getUsersUseCase = getUsersUseCase,
        super(HomeLoadingState());

  void getUsers() async {
    try {
      final response = await _getUsersUseCase.call(params: null);
      if (response != null) {
        emit(HomeSuccessState(response));
      } else {
        emit(HomeErrorState());
      }
    } catch (e) {
      emit(HomeErrorState());
    }
  }
}

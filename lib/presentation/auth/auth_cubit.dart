import 'package:basic_auth_challenge/domain/usecases/get_user_id_usecase.dart';
import 'package:basic_auth_challenge/domain/usecases/is_login_usecase.dart';
import 'package:basic_auth_challenge/domain/usecases/logout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsLoginUseCase _isLoginUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetUserIdUseCase _getUserIdUseCase;

  AuthCubit(
      {required IsLoginUseCase isLoginUseCase,
      required LogoutUseCase logoutUseCase,
      required GetUserIdUseCase getUserIdUseCase})
      : _isLoginUseCase = isLoginUseCase,
        _logoutUseCase = logoutUseCase,
        _getUserIdUseCase = getUserIdUseCase,
        super(AuthorizedInitState());

  void checkUserLoggedIn() async {
    try {
      final response = await _isLoginUseCase.call(params: null);

      await Future.delayed(const Duration(seconds: 1));

      if (response) {
        final userId = await _getUserIdUseCase.call(params: null);
        emit(AuthorizedState(userId?.toString() ?? ""));
      } else {
        emit(UnAuthorizedState());
      }
    } catch (e) {
      emit(UnAuthorizedState());
    }
  }

  void onLoggedIn() async {
    final userId = await _getUserIdUseCase.call(params: null);
    emit(AuthorizedState(userId?.toString() ?? ""));
  }

  void logout() async {
    await _logoutUseCase.call(params: null);
    emit(UnAuthorizedState());
  }
}

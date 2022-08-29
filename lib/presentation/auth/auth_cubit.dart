import 'package:basic_auth_challenge/domain/usecases/is_login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsLoginUseCase _isLoginUseCase;

  AuthCubit({required IsLoginUseCase isLoginUseCase})
      : _isLoginUseCase = isLoginUseCase,
        super(AuthorizedInitState());

  void checkUserLoggedIn() async {
    try {
      final response =
          await _isLoginUseCase.call(params: null);
      if (response) {
        emit(AuthorizedState());
      } else {
        emit(UnAuthorizedState());
      }
    } catch (e) {
      emit(UnAuthorizedState());
    }
  }
}

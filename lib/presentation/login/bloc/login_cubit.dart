import 'package:basic_auth_challenge/domain/usecases/login_usecase.dart';
import 'package:basic_auth_challenge/presentation/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase,
        super(LoginInitState());

  void login(String username, String password) async {
    try {
      final response =
          await _loginUseCase.call(params: LoginParams(username, password));
      if (response != null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginErrorState());
      }
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}

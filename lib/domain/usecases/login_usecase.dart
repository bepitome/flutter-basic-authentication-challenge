import 'package:basic_auth_challenge/core/usecase/usecase.dart';
import 'package:basic_auth_challenge/domain/entity/login.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';

class LoginUseCase implements UseCase<Login, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Login> call({required LoginParams params}) async {
    return _authRepository.login(params.username, params.password);
  }
}

class LoginParams
{
  final String username;
  final String password;

  LoginParams(this.username, this.password);
}

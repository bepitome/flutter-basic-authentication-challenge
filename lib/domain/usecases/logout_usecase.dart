import 'package:basic_auth_challenge/core/usecase/usecase.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';

class LogoutUseCase implements UseCase<void, void> {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  @override
  Future<void> call({required void params}) async {
    return _authRepository.logout();
  }
}

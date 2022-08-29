import 'package:basic_auth_challenge/core/usecase/usecase.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';

class IsLoginUseCase implements UseCase<bool, void> {
  final AuthRepository _authRepository;

  IsLoginUseCase(this._authRepository);

  @override
  Future<bool> call({required void params}) async {
    return _authRepository.isUserLoggedIn();
  }
}

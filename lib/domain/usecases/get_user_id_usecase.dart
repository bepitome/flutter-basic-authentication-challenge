import 'package:basic_auth_challenge/core/usecase/usecase.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';

class GetUserIdUseCase implements UseCase<int?, void> {
  final AuthRepository _authRepository;

  GetUserIdUseCase(this._authRepository);

  @override
  Future<int?> call({required void params}) async {
    return _authRepository.getUserId();
  }
}

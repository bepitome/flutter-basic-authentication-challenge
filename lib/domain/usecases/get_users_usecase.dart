import 'package:basic_auth_challenge/core/usecase/usecase.dart';
import 'package:basic_auth_challenge/domain/entity/user.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';

class GetUsersUseCase implements UseCase<List<User>?, void> {
  final AuthRepository _authRepository;

  GetUsersUseCase(this._authRepository);

  @override
  Future<List<User>?> call({required void params}) async {
    return _authRepository.getAllUsers();
  }
}

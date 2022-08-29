import 'package:basic_auth_challenge/core/usecase/usecase.dart';
import 'package:basic_auth_challenge/domain/entity/user.dart';
import 'package:basic_auth_challenge/domain/repository/auth_repository.dart';

class GetUserDetailsUseCase implements UseCase<User, GetUserDetailsParams> {
  final AuthRepository _authRepository;

  GetUserDetailsUseCase(this._authRepository);

  @override
  Future<User> call({required GetUserDetailsParams params}) async {
    return _authRepository.getUserDetails(params.userId);
  }
}

class GetUserDetailsParams
{
  final int userId;

  GetUserDetailsParams(this.userId);
}

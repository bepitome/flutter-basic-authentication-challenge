import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/users_repository.dart';
import 'package:basic_authentication_flutter_challenge/src/services/current_auth_user.dart';
import 'package:stacked/stacked.dart';

class TeammatesViewModel extends BaseViewModel {
  bool isLoading = false;
  List<User>? teammates;

  TeammatesViewModel() {
    _loadUsersInCompany();
  }

  Future<void> _loadUsersInCompany() async {
    _setLoading(true);
    final usersRepo = locator<UsersRepository>();
    final authUser = locator<CurrenAuthtUser>();
    try {
      final currentUserId = await authUser.getLocalUserId();
      final currentUser = await usersRepo.getUser(currentUserId);
      teammates = await usersRepo.getUsersInCompany(currentUser.company);
    } catch (e) {
      // TODO for future
      // Show alert message to the user
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

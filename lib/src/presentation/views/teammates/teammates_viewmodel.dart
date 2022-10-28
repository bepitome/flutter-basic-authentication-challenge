import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:basic_authentication_flutter_challenge/src/data/exceptions/http_exception.dart';
import 'package:basic_authentication_flutter_challenge/src/data/models/user.dart';
import 'package:basic_authentication_flutter_challenge/src/data/repositories/users_repository.dart';
import 'package:basic_authentication_flutter_challenge/src/services/current_auth_user.dart';
import 'package:basic_authentication_flutter_challenge/src/services/notifier.dart';
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
      final currentUser = await usersRepo.find(currentUserId);
      teammates = await usersRepo.getUsersInCompany(currentUser.company);
    } on HttpException catch (e) {
      locator<Notifier>().show(e.message);
    } catch (e) {
      locator<Notifier>().show('Couldn\'t load emplyees data: ${e.toString()}');
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

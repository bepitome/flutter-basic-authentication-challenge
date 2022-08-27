import 'package:basic_authentication_flutter_challenge/injection.dart';
import 'package:basic_authentication_flutter_challenge/src/services/auth_service.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/repositories/users_repository.dart';
import 'package:basic_authentication_flutter_challenge/src/data/exceptions/http_exception.dart';
import 'package:basic_authentication_flutter_challenge/src/domain/entities/user.dart';

User? currentUser;

// Authenticate
Future<void> challenge1Step1() async {
  try {
    final authService = locator<AuthService>();
    currentUser = await authService.login('jarmatage8', 'xwNEVYPnI');
    print('👍 User ${currentUser?.username} has been authenticated');
  } on HttpException catch (e) {
    print(e.toString());
  }
}

// Display user data
Future<void> challenge1Step2() async {
  print('😀 User Data: ${currentUser.toString()}');
}

// Display all employees who are working at the same company as a list
Future<void> challenge1Step3() async {
  try {
    final usersRepo = locator<UsersRepository>();
    final allUsers = await usersRepo.getAllUsers();
    final usersInSameCompany =
        allUsers.where((user) => user.company == currentUser?.company).toList();
    print('🦖 Users in same company are: ${usersInSameCompany.toString()}');
  } on HttpException catch (e) {
    print(e.toString());
  }
}

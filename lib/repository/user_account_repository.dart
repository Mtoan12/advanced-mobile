import 'package:lettutor/models/user.dart';

class UserRepository {
  final List<User> _users;

  UserRepository(this._users);

  bool isEmailExist(String email) {
    return _users.any((element) => element.email == email);
  }

  User? login(String email, String password) {
    return _users.firstWhere(
        (element) => element.email == email && element.password == password);
  }
}

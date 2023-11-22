import 'package:flutter/cupertino.dart';
import 'package:lettutor/models/user.dart';

class AuthProvider extends ChangeNotifier {
  List<User> _users = [
    User(email: "mail@gmail.com", password: "123"),
    User(email: "mail2@gmail.com", password: "1234")
  ];
  User? user;
  String error = '';

  AuthProvider();

  bool isEmailExist(String email) {
    return _users.any((user) => user.email == email);
  }

  bool isPasswordCorrect(String email, String password) {
    User findUser = _users.firstWhere((user) => user.email == email);
    return findUser.password == password;
  }

  void login({required String email, required String password}) {
    if (!isEmailExist(email)) {
      error = 'Invalid email or password';
    } else if (!isPasswordCorrect(email, password)) {
      error = 'Invalid email or password';
    } else {
      user = _users.firstWhere((user) => user.email == user.email);
    }

    notifyListeners();
  }

  void signUp({required String email, required String password}) {
    if (isEmailExist(email)) {
      error = 'Email already exists';
    } else {
      _users.add(User(email: email, password: password));
      user = _users.firstWhere((user) => user.email == user.email);

      _users.forEach((element) {
        print(element.email);
        print(element.password);
      });
    }

    notifyListeners();
  }
}

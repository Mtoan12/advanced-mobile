import 'package:flutter/cupertino.dart';
import 'package:lettutor/models/auth.dart';

class AuthProvider extends ChangeNotifier {
  final List<Auth> _users = [
    Auth(email: "mail@gmail.com", password: "123"),
    Auth(email: "mail2@gmail.com", password: "1234")
  ];
  Auth? user;
  String error = '';

  AuthProvider();

  void setError(String error) {
    this.error = error;
    notifyListeners();
  }

  bool isEmailExist(String email) {
    return _users.any((user) => user.email == email);
  }

  bool isPasswordCorrect(String email, String password) {
    Auth findUser = _users.firstWhere((user) => user.email == email);
    return findUser.password == password;
  }

  void login({required String email, required String password}) {
    if (!isEmailExist(email)) {
      error = 'Invalid email or password';
    } else if (!isPasswordCorrect(email, password)) {
      error = 'Invalid email or password';
    } else {
      error = '';
      user = _users.firstWhere((user) => user.email == user.email);
    }

    notifyListeners();
  }

  void signUp({required String email, required String password}) {
    if (isEmailExist(email)) {
      error = 'Email already exists';
    } else {
      error = '';
      _users.add(Auth(email: email, password: password));
      user = _users.firstWhere((user) => user.email == user.email);

      // _users.forEach((element) {
      //   print(element.email);
      //   print(element.password);
      // });
    }

    notifyListeners();
  }

  void forgotPassword({required String email}) {
    if (!isEmailExist(email)) {
      error = 'Email does not exist';
    } else {
      error = 'Email sent';
    }

    notifyListeners();
  }

  void logout() {
    user = null;
    notifyListeners();
  }
}

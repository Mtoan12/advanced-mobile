import 'package:flutter/cupertino.dart';
import 'package:lettutor/api/Apis.dart';
import 'package:lettutor/models/auth.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  Auth? auth;
  String error = '';

  AuthProvider();

  void setError(String error) {
    this.error = error;
    notifyListeners();
  }

  void login({required String email, required String password}) async {
    try {
      var uri = Uri.parse(Apis.login);
      print(uri.toString());
      var response = await http.post(uri, body: {
        'email': email,
        'password': password,
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }

  void signUp({required String email, required String password}) {
    notifyListeners();
  }

  void forgotPassword({required String email}) {
    notifyListeners();
  }

  void logout() {
    notifyListeners();
  }
}

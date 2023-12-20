import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:lettutor/api/Apis.dart';
import 'package:lettutor/models/auth.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/models/error_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Auth? auth;
  String error = '';

  AuthProvider();

  void setError(String error) {
    this.error = error;
    notifyListeners();
  }

  void login({required String email, required String password}) async {
    var uri = Uri.parse(Apis.login);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    });

    dynamic data = json.decode(response.body);

    if (response.statusCode == 200) {
      auth = Auth.fromJson(data);
      print("login successfully: ${auth!.user.name}");
      final SharedPreferences predf = await SharedPreferences.getInstance();
      predf.setString('access_token', auth!.tokens.access.token);
      setError("");
    } else {
      var errorResponse = ErrorResponse.fromJson(data);
      print("error: ${errorResponse.message}");
      setError(errorResponse.message);
    }

    // notifyListeners();
  }

  void signUp({required String email, required String password}) async {
    var uri = Uri.parse(Apis.login);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    });

    dynamic data = json.decode(response.body);

    if (response.statusCode == 200) {
      auth = Auth.fromJson(data);
      print("login successfully: ${auth!.user.name}");
      setError("");
    } else {
      var errorResponse = ErrorResponse.fromJson(data);
      print("error: ${errorResponse.message}");
      setError(errorResponse.message);
    }
    notifyListeners();
  }

  void forgotPassword({required String email}) {
    notifyListeners();
  }

  void logout() {
    notifyListeners();
  }
}

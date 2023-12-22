import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/api/Apis.dart';
import 'package:lettutor/models/auth.dart';
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

  Future login({required String email, required String password}) async {
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
      return auth;
    } else {
      var errorResponse = ErrorResponse.fromJson(data);
      print("error: ${errorResponse.message}");
      setError(errorResponse.message);
      return 'error: ${errorResponse.message}';
    }
  }

  Future signUp({required String email, required String password}) async {
    var uri = Uri.parse(Apis.register);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    });

    dynamic data = json.decode(response.body);

    if (response.statusCode == 200) {
      print("register successfully: $data");
      String message =
          "Sign up successful. Please check your email tc verify the account";
      return message;
    } else {
      var errorResponse = ErrorResponse.fromJson(data);
      print("error: ${errorResponse.message}");
      setError(errorResponse.message);
      return 'error: ${errorResponse.message}';
    }
  }

  Future forgotPassword({required String email}) async {
    var uri = Uri.parse("${Apis.baseUrl}user/forgotPassword");
    var response = await http.post(uri, body: {
      'email': email,
    });
    dynamic data = json.decode(response.body);
    print(data);
    if (response.statusCode == 200) {
      String message = "Please check your email to reset password";

      return message;
    } else {
      var errorResponse = ErrorResponse.fromJson(data);
      print("error: ${errorResponse.message}");

      return "error: ${data['message']}";
    }
  }

  void logout() {
    notifyListeners();
  }
}

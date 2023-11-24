import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  final String email;
  final String password;

  User({
    required this.email,
    required this.password,
  });
}

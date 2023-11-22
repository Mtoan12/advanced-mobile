import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  final int id;
  final String email;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.password,
  });
}

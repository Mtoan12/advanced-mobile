import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lettutor/json/user.dart';
import 'package:lettutor/models/user.dart';

class UserProvider extends ChangeNotifier {
  User user = User(
    id: '',
    level: '',
    avatar: '',
    name: '',
    country: '',
    language: '',
    isPublicRecord: false,
    courses: [],
  );

  UserProvider() {
    user = User.fromJson(json.decode(userJson));
    print(user.name);
  }
}

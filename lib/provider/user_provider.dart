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
  }

  void updateProfile(
      {required String name,
      required String email,
      required String phone,
      required String country,
      required DateTime birthday,
      required String level,
      required String requireNote,
      required String studySchedule}) {
    user.name = name;
    user.email = email;
    user.phone = phone;
    user.country = country;
    user.birthday = birthday;
    user.level = level;
    user.requireNote = requireNote;
    user.studySchedule = studySchedule;
    notifyListeners();
  }
}

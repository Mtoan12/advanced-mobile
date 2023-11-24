import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:lettutor/json/teachers.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:lettutor/store/store.dart';

Store store = Store();

class TeachersListProvider extends ChangeNotifier {
  List<Teacher> teachers = [];

  TeachersListProvider() {
    var list = json.decode(teachersJson) as List<dynamic>;
    teachers = list.map((e) => Teacher.fromJson(e)).toList();
  }
  void filterTeachers(String search, String spec) {
    List<Teacher> filteredTeachers = teachers;
    if (search != '') {
      filteredTeachers = filteredTeachers
          .where((teacher) =>
              teacher.name!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    if (spec != 'All') {
      filteredTeachers = filteredTeachers
          .where((teacher) => teacher.specialties!.contains(spec))
          .toList();
    }
    teachers = filteredTeachers;
    notifyListeners();
  }
}

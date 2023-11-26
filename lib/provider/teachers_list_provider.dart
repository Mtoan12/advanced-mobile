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

    teachers = sortTeachers(teachers);
  }

  List<Teacher> filterTeachers(String search, String spec) {
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
    return filteredTeachers;
  }

  void toggleLikeTeacher(String id) {
    teachers = teachers.map((teacher) {
      if (teacher.id == id) {
        teacher.isFavoriteTutor = !teacher.isFavoriteTutor!;
      }
      return teacher;
    }).toList();
    notifyListeners();
  }

  List<Teacher> sortTeachers(List<Teacher> teachers) {
    teachers.sort((a, b) {
      if (a.isFavoriteTutor != b.isFavoriteTutor) {
        return a.isFavoriteTutor! ? -1 : 1;
      } else {
        return (a.rating! - b.rating!) > 0 ? -1 : 1;
      }
    });

    return teachers;
  }

  void printTeachers() {
    teachers.forEach((element) {
      print("${element.name} ${element.rating}\n");
    });
  }
}

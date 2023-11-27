import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lettutor/json/teacher_details.dart';
import 'package:lettutor/models/tutor.dart';

class TutorProvider extends ChangeNotifier {
  List<Tutor> tutors = [];

  TutorProvider() {
    var list = json.decode(teacherDetailsJson);
    tutors = list.map<Tutor>((e) => Tutor.fromJson(e)).toList();
    tutors.forEach((element) {
      print(element.toString());
    });
  }
}

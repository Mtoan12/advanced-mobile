import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lettutor/json/courses.dart';
import 'package:lettutor/models/course_detail.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseDetail> courses = [];

  CourseProvider() {
    var list = json.decode(coursesJson) as List;

    courses = list.map((e) => CourseDetail.fromJson(e)).toList();
  }
}

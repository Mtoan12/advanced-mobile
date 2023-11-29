import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/json/courses.dart';
import 'package:lettutor/models/course_detail.dart';
import 'package:lettutor/models/topic.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseDetail> courses = [];

  CourseProvider() {
    var list = json.decode(coursesJson) as List;

    courses = list.map((e) => CourseDetail.fromJson(e)).toList();
  }

  CourseDetail? getCourseById(String id) {
    return courses.firstWhereOrNull((course) => course.id == id);
  }
}

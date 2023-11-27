import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/json/teacher_details.dart';
import 'package:lettutor/models/tutor.dart';

class TutorProvider extends ChangeNotifier {
  List<Tutor> tutors = [];

  TutorProvider() {
    var list = json.decode(teacherDetailsJson);
    tutors = list.map<Tutor>((e) => Tutor.fromJson(e)).toList();
  }

  Tutor? getTutorById(String? id) {
    if (id == null) return null;
    return tutors.firstWhereOrNull((element) => element.user!.id == id);
  }

  void toggleLikeTeacher(String? id) {
    if (id == null) return;
    Tutor? tutor = getTutorById(id);
    if (tutor != null) {
      tutor.isFavorite = !tutor.isFavorite!;
      notifyListeners();
    }
  }
}

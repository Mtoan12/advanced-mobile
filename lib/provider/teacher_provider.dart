import 'package:flutter/material.dart';
import 'package:lettutor/models/teacher.dart';

class TeacherProvider extends ChangeNotifier {
  List<String> likedTeacherIds = [];

  void getLikedTeachers(List<Teacher> teachers) {
    for (Teacher teacher in teachers) {
      if (teacher.isFavoriteTutor == true &&
          !likedTeacherIds.contains(teacher.id)) {
        likedTeacherIds.add(teacher.id);
      }
    }

    notifyListeners();
  }

  bool isLikedTeacher(String teacherId) {
    return likedTeacherIds.contains(teacherId);
  }

  void likeTeacher(String teacherId) {
    likedTeacherIds.add(teacherId);
    notifyListeners();
  }

  void unlikeTeacher(String teacherId) {
    likedTeacherIds.remove(teacherId);
    notifyListeners();
  }
}

import 'package:lettutor/models/tutor_course.dart';

class Course {
  String? id;
  String? name;
  TutorCourse? tutorCourse;

  Course({
    required this.id,
    required this.name,
    required this.tutorCourse,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tutorCourse = TutorCourse.fromJson(json['TutorCourse']);
  }
}

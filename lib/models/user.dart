import 'package:lettutor/models/course.dart';

class User {
  String? id;
  String? level;
  String? avatar;
  String? name;
  String? country;
  String? language;
  bool? isPublicRecord;
  List<Course>? courses;

  User({
    required this.id,
    required this.level,
    required this.avatar,
    required this.name,
    required this.country,
    required this.language,
    required this.isPublicRecord,
    required this.courses,
  });

  User.fromJson(Map<String, dynamic> json) {
    var courseList = json['courses'] as List;
    courses = courseList.map((course) => Course.fromJson(course)).toList();
    id = json['id'];
    level = json['level'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    language = json['language'];
    isPublicRecord = json['isPublicRecord'];
  }
}

import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:lettutor/utils/utils.dart';

class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  String? role;
  String? language;
  DateTime? birthday;
  bool? isActivated;
  TutorInfo? tutorInfo;
  String? requireNote;
  String? studySchedule;
  double? avgRating;
  String? testPreparations;
  String? level;
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
    var courseList = json['courses'] != null ? json['courses'] as List : [];
    courses = courseList.map((course) => Course.fromJson(course)).toList();
    id = json['id'] ?? '';
    level = json['level'] ?? '';
    avatar = json['avatar'] ?? '';
    name = json['name'] ?? '';
    country = json['country'] ?? '';
    language = json['language'] ?? '';
    isPublicRecord = json['isPublicRecord'] ?? false;
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    role = json['role'] ?? '';
    birthday = json['birthday'] != null
        ? Utils.parseDateString(json['birthday'])
        : null;
    isActivated = json['isActivated'] ?? false;
    // tutorInfo =
    //     json['tutorInfo'] != null ? Tutor.fromJson(json['tutorInfo']) : null;
    // requireNote = json['requireNote'] ?? '';
    studySchedule = json['studySchedule'] ?? '';
    // avgRating = json['avgRating'] ?? 0;
    // testPreparations = json['testPreparations'] ?? '';
  }
}

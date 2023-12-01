import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/tutor_info.dart';

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
    birthday =
        json['birthday'] != null ? DateTime.parse(json['birthday']) : null;
    isActivated = json['isActivated'] ?? false;
    // tutorInfo =
    //     json['tutorInfo'] != null ? Tutor.fromJson(json['tutorInfo']) : null;
    // requireNote = json['requireNote'] ?? '';
    // studySchedule = json['studySchedule'] ?? '';
    // avgRating = json['avgRating'] ?? 0;
    // testPreparations = json['testPreparations'] ?? '';
  }
}

// "user": {
//         "id": "f569c202-7bbf-4620-af77-ecc1419a6b28",
//         "email": "student@lettutor.com",
//         "name": "Pham Hai 123",
//         "avatar": "https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1700733990505.jpg",
//         "country": "VN",
//         "phone": "842499996508",
//         "roles": [
//             "student",
//             "CHANGE_PASSWORD"
//         ],
//         "language": "Albanian",
//         "birthday": "2002-01-24",
//         "isActivated": true,
//         "tutorInfo": {
//             "id": "db37f185-399f-470d-995b-bf6143cb1a5f",
//             "video": "https://sandbox.api.lettutor.com/video/f569c202-7bbf-4620-af77-ecc1419a6b28video1643096811438.mp4",
//             "bio": "You can't Xi me ! Bing chilling ! 1",
//             "education": "University of Science 3",
//             "experience": "3 years",
//             "profession": "WWE, Online English teacher",
//             "accent": null,
//             "targetStudent": "Advanced",
//             "interests": "I like reading book",
//             "languages": "+1268",
//             "specialties": "conversational-english,movers,flyers,toefl,toeic,business-english,Business English,Conversational English,Ielts,Movers,Toeic",
//             "resume": null,
//             "rating": 3.7401960784313726,
//             "isActivated": false,
//             "isNative": false,
//             "youtubeVideoId": null
//         },
//         "walletInfo": {
//             "amount": "961600000",
//             "isBlocked": false,
//             "bonus": 0
//         },
//         "requireNote": "aa",
//         "level": "HIGHER_BEGINNER",
//         "learnTopics": [],
//         "testPreparations": [
//             {
//                 "id": 7,
//                 "key": "toefl",
//                 "name": "TOEFL"
//             }
//         ],
//         "isPhoneActivated": true,
//         "timezone": 7,
//         "referralInfo": {
//             "referralCode": "RSJYDZYQLE",
//             "referralPackInfo": {
//                 "earnPercent": 5
//             }
//         },
//         "studySchedule": "hello 👋👋👋👋 I am Hai",
//         "canSendMessage": false,
//         "studentGroup": null,
//         "studentInfo": null,
//         "avgRating": 3.7401960784313726
//     }
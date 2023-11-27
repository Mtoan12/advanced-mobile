import 'package:lettutor/models/user.dart';

class Tutor {
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  double? rating;
  dynamic isNative;
  dynamic youtubeVideoId;
  User? user;
  bool? isFavorite;
  double? avgRating;
  int? totalFeedback;

  Tutor({
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    required this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    required this.rating,
    required this.isNative,
    required this.youtubeVideoId,
    required this.user,
    required this.isFavorite,
    required this.avgRating,
    required this.totalFeedback,
  });

  Tutor.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = json['accent'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    rating = json['rating'];
    isNative = json['isNative'];
    youtubeVideoId = json['youtubeVideoId'];
    user = User.fromJson(json['User']);
    isFavorite = json['isFavorite'];
    avgRating = json['avgRating'];
    totalFeedback = json['totalFeedback'];
  }

  @override
  String toString() {
    String result = "";
    result += "video: $video\n";
    result += "bio: $bio\n";
    result += "education: $education\n";
    result += "experience: $experience\n";
    result += "profession: $profession\n";
    result += "accent: $accent\n";
    result += "targetStudent: $targetStudent\n";
    result += "interests: $interests\n";
    result += "languages: $languages\n";
    result += "specialties: $specialties\n";
    result += "rating: $rating\n";
    result += "isNative: $isNative\n";
    result += "youtubeVideoId: $youtubeVideoId\n";
    result += "user: $user\n";
    result += "isFavorite: $isFavorite\n";
    result += "avgRating: $avgRating\n";
    result += "totalFeedback: $totalFeedback\n";
    return result;
  }
}

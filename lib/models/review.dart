import 'package:lettutor/models/user.dart';

class Review {
  String? id;
  String? bookingId;
  String? firstId;
  String? secondId;
  double? rating;
  String? content;
  String? createdAt;
  String? updatedAt;
  User? firstInfo;

  Review({
    required this.id,
    required this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['bookingId'];
    firstId = json['firstId'];
    secondId = json['secondId'];
    rating = json['rating'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    firstInfo = User.fromJson(json['firstInfo']);
  }
}


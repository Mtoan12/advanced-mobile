import 'package:lettutor/models/category.dart';
import 'package:lettutor/models/topic.dart';

class CourseDetail {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  dynamic courseType;
  dynamic sectionType;
  bool? visible;
  dynamic displayOrder;
  String? createdAt;
  String? updatedAt;
  List<Topic> topics;
  List<Category> categories;

  CourseDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.courseType,
    required this.sectionType,
    required this.visible,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.topics,
    required this.categories,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) {
    return CourseDetail(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      level: json['level'] ?? '',
      reason: json['reason'] ?? '',
      purpose: json['purpose'] ?? '',
      otherDetails: json['other_details'] ?? '',
      defaultPrice: json['default_price'] ?? 0,
      coursePrice: json['course_price'] ?? 0,
      courseType: json['courseType'] ?? '',
      sectionType: json['sectionType'] ?? '',
      visible: json['visible'] ?? false,
      displayOrder: json['displayOrder'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      topics: List<Topic>.from(json['topics'].map((x) => Topic.fromJson(x))),
      categories: json['categories'] != null
          ? List<Category>.from(
              json['categories'].map((x) => Category.fromJson(x)))
          : [],
    );
  }
}

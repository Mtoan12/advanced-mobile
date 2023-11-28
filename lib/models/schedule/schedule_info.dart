import 'package:lettutor/models/tutor_info.dart';

class ScheduleInfo {
  String date;
  int startTimestamp;
  int endTimestamp;
  String id;
  String tutorId;
  String startTime;
  String endTime;
  bool isDeleted;
  String createdAt;
  String updatedAt;
  TutorInfo  tutorInfo;

  ScheduleInfo({
    required this.date,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.tutorInfo,
  });

  factory ScheduleInfo.fromJson(Map<String, dynamic> json) {
    return ScheduleInfo(
      date: json['date'],
      startTimestamp: json['startTimestamp'],
      endTimestamp: json['endTimestamp'],
      id: json['id'],
      tutorId: json['tutorId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      isDeleted: json['isDeleted'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      tutorInfo: TutorInfo.fromJson(json['tutorInfo']),
    );
  }
}

import 'package:lettutor/models/schedule/schedule_detail_info.dart';

class Schedule {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  dynamic googleMeetLink;
  String? studentRequest;
  dynamic tutorReview;
  dynamic scoreByTutor;
  String? createdAt;
  String? updatedAt;
  dynamic recordUrl;
  dynamic cancelReasonId;
  dynamic lessonPlanId;
  dynamic cancelNote;
  dynamic calendarId;
  bool? isDeleted;
  bool? isTrial;
  int? convertedLesson;
  ScheduleDetailInfo? scheduleDetailInfo;

  Schedule({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.userId,
    required this.scheduleDetailId,
    required this.tutorMeetingLink,
    required this.studentMeetingLink,
    required this.googleMeetLink,
    required this.studentRequest,
    required this.tutorReview,
    required this.scoreByTutor,
    required this.createdAt,
    required this.updatedAt,
    required this.recordUrl,
    required this.cancelReasonId,
    required this.lessonPlanId,
    required this.cancelNote,
    required this.calendarId,
    required this.isDeleted,
    required this.isTrial,
    required this.convertedLesson,
    required this.scheduleDetailInfo,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      createdAtTimeStamp: json['createdAtTimeStamp'] ?? 0,
      updatedAtTimeStamp: json['updatedAtTimeStamp'] ?? 0,
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      scheduleDetailId: json['scheduleDetailId'] ?? '',
      tutorMeetingLink: json['tutorMeetingLink'] ?? '',
      studentMeetingLink: json['studentMeetingLink'] ?? '',
      googleMeetLink: json['googleMeetLink'] ?? '',
      studentRequest: json['studentRequest'] ?? '',
      tutorReview: json['tutorReview'] ?? '',
      scoreByTutor: json['scoreByTutor'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      recordUrl: json['recordUrl'] ?? '',
      cancelReasonId: json['cancelReasonId'] ?? '',
      lessonPlanId: json['lessonPlanId'] ?? '',
      cancelNote: json['cancelNote'] ?? '',
      calendarId: json['calendarId'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      isTrial: json['isTrial'] ?? false,
      convertedLesson: json['convertedLesson'] ?? 0,
      scheduleDetailInfo:
          ScheduleDetailInfo.fromJson(json['scheduleDetailInfo']),
    );
  }
}

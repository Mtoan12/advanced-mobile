import 'package:lettutor/models/schedule/schedule_info.dart';

class ScheduleDetail {
  int startPeriodTimestamp;
  int endPeriodTimestamp;
  String id;
  String scheduleId;
  String startPeriod;
  String endPeriod;
  String createdAt;
  String updatedAt;
  ScheduleInfo scheduleInfo;

  ScheduleDetail({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.scheduleInfo,
  });
  factory ScheduleDetail.fromJson(Map<String, dynamic> json) {
    return ScheduleDetail(
      startPeriodTimestamp: json['startPeriodTimestamp'],
      endPeriodTimestamp: json['endPeriodTimestamp'],
      id: json['id'],
      scheduleId: json['scheduleId'],
      startPeriod: json['startPeriod'],
      endPeriod: json['endPeriod'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      scheduleInfo: ScheduleInfo.fromJson(json['scheduleInfo']),
    );
  }
}

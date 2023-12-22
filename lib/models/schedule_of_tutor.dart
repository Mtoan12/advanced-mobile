class ScheduleOfTutor {
  String id;
  String tutorId;
  String startTime;
  String endTime;
  int startTimestamp;
  int endTimestamp;
  String createdAt;
  bool isBooked;
  List<ScheduleDetail> scheduleDetails;

  ScheduleOfTutor({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.createdAt,
    required this.isBooked,
    required this.scheduleDetails,
  });

  factory ScheduleOfTutor.fromJson(Map<String, dynamic> json) {
    return ScheduleOfTutor(
      id: json['id'],
      tutorId: json['tutorId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      startTimestamp: json['startTimestamp'],
      endTimestamp: json['endTimestamp'],
      createdAt: json['createdAt'],
      isBooked: json['isBooked'],
      scheduleDetails: List<ScheduleDetail>.from(json['scheduleDetails'].map((x) => ScheduleDetail.fromJson(x))),
    );
  }
}

class ScheduleDetail {
  String startPeriod;
  String endPeriod;
  String id;
  String scheduleId;
  int startPeriodTimestamp;
  int endPeriodTimestamp;
  String createdAt;
  String updatedAt;
  bool isBooked;

  ScheduleDetail({
    required this.startPeriod,
    required this.endPeriod,
    required this.id,
    required this.scheduleId,
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.createdAt,
    required this.updatedAt,
    required this.isBooked,
  });

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) {
    return ScheduleDetail(
      startPeriod: json['startPeriod'],
      endPeriod: json['endPeriod'],
      id: json['id'],
      scheduleId: json['scheduleId'],
      startPeriodTimestamp: json['startPeriodTimestamp'],
      endPeriodTimestamp: json['endPeriodTimestamp'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isBooked: json['isBooked'],
    );
  }
}
class ScheduleDetailInfo {
  String id;
  String subject;
  String grade;
  String location;
  String duration;
  String price;
  String studentNote;
  String tutorNote;
  String color;
  String background;
  String status;
  String lessonPlanId;
  String studentRequest;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String recordUrl;
  String lessonPlanNote;
  String learningMethod;
  String lessonPlanNoteItem;
  String lessonPlanIdItem;
  dynamic recordUrlItem;
  String durationItem;

  ScheduleDetailInfo({
    required this.id,
    required this.subject,
    required this.grade,
    required this.location,
    required this.duration,
    required this.price,
    required this.studentNote,
    required this.tutorNote,
    required this.color,
    required this.background,
    required this.status,
    required this.lessonPlanId,
    required this.studentRequest,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.recordUrl,
    required this.lessonPlanNote,
    required this.learningMethod,
    required this.lessonPlanNoteItem,
    required this.lessonPlanIdItem,
    required this.recordUrlItem,
    required this.durationItem,
  });

  factory ScheduleDetailInfo.fromJson(Map<String, dynamic> json) {
    return ScheduleDetailInfo(
      id: json['id'],
      subject: json['subject'],
      grade: json['grade'],
      location: json['location'],
      duration: json['duration'],
      price: json['price'],
      studentNote: json['studentNote'],
      tutorNote: json['tutorNote'],
      color: json['color'],
      background: json['background'],
      status: json['status'],
      lessonPlanId: json['lessonPlanId'],
      studentRequest: json['studentRequest'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      recordUrl: json['recordUrl'],
      lessonPlanNote: json['lessonPlanNote'],
      learningMethod: json['learningMethod'],
      lessonPlanNoteItem: json['lessonPlanNoteItem'],
      lessonPlanIdItem: json['lessonPlanIdItem'],
      recordUrlItem: json['recordUrlItem'],
      durationItem: json['durationItem'],
    );
  }
}

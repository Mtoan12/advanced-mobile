class Topic {
  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  dynamic beforeTheClassNotes;
  dynamic afterTheClassNotes;
  String? nameFile;
  dynamic numberOfPages;
  String? description;
  dynamic videoUrl;
  dynamic type;
  String? createdAt;
  String? updatedAt;

  Topic({
    required this.id,
    required this.courseId,
    required this.orderCourse,
    required this.name,
    required this.beforeTheClassNotes,
    required this.afterTheClassNotes,
    required this.nameFile,
    required this.numberOfPages,
    required this.description,
    required this.videoUrl,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'] ?? '',
      courseId: json['courseId'] ?? '',
      orderCourse: json['orderCourse'] ?? 0,
      name: json['name'] ?? '',
      beforeTheClassNotes: json['beforeTheClassNotes'] ?? '',
      afterTheClassNotes: json['afterTheClassNotes'] ?? '',
      nameFile: json['nameFile'] ?? '',
      numberOfPages: json['numberOfPages'] ?? 0,
      description: json['description'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      type: json['type'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

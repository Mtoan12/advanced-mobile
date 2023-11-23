class Specialty {
  int? id;
  String? key;
  String? name;
  String? createdAt;
  String? updatedAt;

  Specialty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

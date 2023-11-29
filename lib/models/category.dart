class Category {
  String? id;
  String? title;
  dynamic description;
  String? key;
  dynamic displayOrder;
  String? createdAt;
  String? updatedAt;

  Category({
    required this.id,
    required this.title,
    required this.description,
    required this.key,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      key: json['key'] ?? '',
      displayOrder: json['displayOrder'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

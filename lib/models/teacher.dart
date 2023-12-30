class Teacher {
  late String id;
  String? avatar;
  String? country;
  String? name;
  String? bio;
  bool? isNative;
  String? specialties;
  double? rating;
  String? userId;
  int? schedulesTimes;
  bool? isFavoriteTutor;
  int? price;

  Teacher({
    this.id = '',
    this.avatar,
    this.country,
    this.name,
    this.bio,
    this.isNative,
    this.specialties,
    this.rating,
    this.userId,
    this.schedulesTimes,
    this.isFavoriteTutor,
    this.price,
  });

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    country = json['country'];
    name = json['name'];
    bio = json['bio'];
    isNative = json['isNative'];
    specialties = json['specialties'];
    rating = json['rating'] ?? 0.0;
    userId = json['userId'];
    schedulesTimes = json['schedulesTimes'];
    isFavoriteTutor = json['isFavoriteTutor'] ?? false;
    price = json['price'];
  }
}

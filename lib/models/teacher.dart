class Teacher {
  String? id;
  String avatar;
  String country;
  String name;
  String bio;
  bool? isNative;
  String specialties;
  double rating;
  String? userId;
  int? schedulesTimes;
  bool? isFavoriteTutor;
  int? price;

  Teacher({
    this.id,
    required this.avatar,
    required this.country,
    required this.name,
    required this.bio,
    this.isNative,
    required this.specialties,
    required this.rating,
    this.userId,
    this.schedulesTimes,
    this.isFavoriteTutor,
    this.price,
  });
}

//  "avatar": "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
// "country": "TN",
// "id": "4d54d3d7-d2a9-42e5-97a2-5ed38af5789a",
// "name": "Keegan",
// "bio": "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
// "isNative": null,
// "specialties": "business-english,conversational-english,english-for-kids,ielts,starters,movers,flyers,ket,pet,toefl,toeic",
// "rating": 4.102189781021898,
// "userId": "4d54d3d7-d2a9-42e5-97a2-5ed38af5789a",
// "schedulesTimes": 14,
// "isFavoriteTutor": true,
// "price": 50000
import 'package:flutter/cupertino.dart';
import 'package:lettutor/models/teacher.dart';

class Store {
  static final Store _store = Store._internal();

  factory Store() {
    return _store;
  }

  Store._internal();

  final TEACHERS_LIST = [
    Teacher(
        avatar:
            "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
        country: "Tunisia",
        name: "Keegan",
        bio:
            "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
        specialties:
            "English for bussiness,Conversational,English for kids,IELTS,STARTERS",
        rating: 4.102189781021898,
        isFavoriteTutor: true),
    Teacher(
        avatar:
            "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
        country: "Chad",
        name: "Cassandre Balistreri",
        bio: "Est et vel.",
        specialties:
            "English for bussiness,Conversational,English for kids,IELTS,STARTERS",
        rating: 0),
    Teacher(
        avatar:
            "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
        country: "Kiribati",
        name: "Chad Ankunding",
        bio: "Rem neque quidem aliquam magni quasi et.",
        specialties:
            "English for bussiness,Conversational,English for kids,IELTS,STARTERS",
        rating: 0)
  ];
}

//   [
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "Kiribati",
//             "id": "e61012dc-cf03-46ee-9b34-a1c9e61a74cf",
//             "name": "Chad Ankunding",
//             "bio": "Rem neque quidem aliquam magni quasi et.",
//             "isNative": null,
//             "specialties": "bs,bs,it,of",
//             "rating": null,
//             "userId": "e61012dc-cf03-46ee-9b34-a1c9e61a74cf",
//             "schedulesTimes": null,
//             "isFavoriteTutor": true,
//             "price": 0
//         },
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "Indonesia",
//             "id": "7214c889-a46f-44ee-b916-02dde3c81052",
//             "name": "Damon Carroll",
//             "bio": "Tenetur sit dolorem qui aspernatur suscipit fugit sequi facere.",
//             "isNative": null,
//             "specialties": "of,hc,of",
//             "rating": null,
//             "userId": "7214c889-a46f-44ee-b916-02dde3c81052",
//             "schedulesTimes": null,
//             "isFavoriteTutor": true,
//             "price": 0
//         },
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "Niue",
//             "id": "5a681fa4-2a31-4aa8-9d17-86a1b0f3c8c8",
//             "name": "Dangelo Wehner",
//             "bio": "Quibusdam nam sint in aut et eius.",
//             "isNative": null,
//             "specialties": "ds,hc,fl",
//             "rating": null,
//             "userId": "5a681fa4-2a31-4aa8-9d17-86a1b0f3c8c8",
//             "schedulesTimes": null,
//             "isFavoriteTutor": true,
//             "price": 0
//         },
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "New Zealand",
//             "id": "efe28207-f161-4f6e-94f1-12279048b88a",
//             "name": "David Nikolaus",
//             "bio": "Ut autem possimus ipsum esse.",
//             "isNative": null,
//             "specialties": "ds,bs,ds,bs",
//             "rating": null,
//             "userId": "efe28207-f161-4f6e-94f1-12279048b88a",
//             "schedulesTimes": null,
//             "isFavoriteTutor": true,
//             "price": 0
//         },
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "Saint Martin",
//             "id": "da00e271-e849-4d2f-a365-3dbf8bfcc9ea",
//             "name": "Adelia Rice",
//             "bio": "Recusandae dignissimos ut commodi et iste qui eum quos.",
//             "isNative": null,
//             "specialties": "of,ds,ds,ds,hc",
//             "rating": null,
//             "userId": "da00e271-e849-4d2f-a365-3dbf8bfcc9ea",
//             "schedulesTimes": null,
//             "isFavoriteTutor": null,
//             "price": 0
//         },
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "Aruba",
//             "id": "61f78846-e907-4be6-ad39-f343ecddeaf2",
//             "name": "Allison Murray",
//             "bio": "Odit est ratione et dolorem tenetur illum.",
//             "isNative": null,
//             "specialties": "bs,mt,hc,fl,ds",
//             "rating": null,
//             "userId": "61f78846-e907-4be6-ad39-f343ecddeaf2",
//             "schedulesTimes": null,
//             "isFavoriteTutor": null,
//             "price": 0
//         },
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "Bolivia",
//             "id": "a649f315-1ca6-417f-81bb-580013495e21",
//             "name": "Ana Lubowitz",
//             "bio": "Debitis distinctio minus qui accusantium voluptatum.",
//             "isNative": null,
//             "specialties": "bs,hc",
//             "rating": null,
//             "userId": "a649f315-1ca6-417f-81bb-580013495e21",
//             "schedulesTimes": null,
//             "isFavoriteTutor": null,
//             "price": 0
//         },
//         {
//             "avatar": "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
//             "country": "Hong Kong",
//             "id": "f9064480-b5aa-4540-b94d-f7a4c8303c0c",
//             "name": "Angus Dickinson",
//             "bio": "Enim expedita explicabo saepe perferendis est et.",
//             "isNative": null,
//             "specialties": "hc,hc,ds,fl,of",
//             "rating": null,
//             "userId": "f9064480-b5aa-4540-b94d-f7a4c8303c0c",
//             "schedulesTimes": null,
//             "isFavoriteTutor": null,
//             "price": 0
//         },
        
//     ]
// }

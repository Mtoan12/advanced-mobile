import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:lettutor/screens/teachers_list_screen/teacher_card.dart';

class TeachersSuggestionWidget extends StatefulWidget {
  final List<Teacher> teachers;
  const TeachersSuggestionWidget({super.key, required this.teachers});

  @override
  State<TeachersSuggestionWidget> createState() =>
      _TeachersSuggestionWidgetState();
}

class _TeachersSuggestionWidgetState extends State<TeachersSuggestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recommended Tutors".tr,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        TeacherCard(
            imgUrl:
                "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
            hasLiked: false,
            name: "Keegan",
            national: "Tunisia",
            stars: 5,
            filters: [
              'English for business'.tr,
              'Conversational'.tr,
              'English for kids'.tr,
              'IELTS',
              'STARTERS',
            ],
            description:
                "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia."),
        SizedBox(
          height: 20,
        ),
        TeacherCard(
            imgUrl:
                "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
            hasLiked: false,
            name: "Keegan",
            national: "Tunisia",
            stars: 5,
            filters: [
              'English for business'.tr,
              'Conversational'.tr,
              'English for kids'.tr,
              'IELTS',
              'STARTERS',
            ],
            description:
                "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia."),
      ],
    );
  }

  Widget mainWidgets(List<String> strings) {
    List<Widget> list = [];
    for (var i = 0; i < widget.teachers.length; i++) {
      list.add(
        TeacherCard(
            imgUrl:
                "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
            hasLiked: false,
            name: "Keegan",
            national: "Tunisia",
            stars: 5,
            filters: [
              'English for business'.tr,
              'Conversational'.tr,
              'English for kids'.tr,
              'IELTS',
              'STARTERS',
            ],
            description:
                "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia."),
          
      );
      
    }
    return new Row(children: list);
  }
}

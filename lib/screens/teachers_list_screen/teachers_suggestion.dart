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
    return mainWidgets(context);
  }

  Widget mainWidgets(BuildContext context) {
    var teachers = widget.teachers;

    List<Widget> list = [];
    list.add(Text(
      "Recommended Tutors".tr,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    ));
    list.add(SizedBox(
      height: 8,
    ));

    for (Teacher teacher in teachers) {
      list.add(
        TeacherCard(
            imgUrl: teacher.avatar ?? '',
            hasLiked: teacher.isFavoriteTutor ?? false,
            name: teacher.name ?? '',
            national: teacher.country ?? '',
            stars: teacher.rating ?? 0,
            filters: teacher.specialties!.split(','),
            description: teacher.bio ?? ''),
      );
      list.add(SizedBox(
        height: 20,
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }
}

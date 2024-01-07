import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:lettutor/screens/teachers_list_screen/teacher_card.dart';

class TeachersSuggestionWidget extends StatefulWidget {
  final List<Teacher> teachers;
  final List<Specialty> specialties;
  const TeachersSuggestionWidget(
      {super.key, required this.teachers, required this.specialties});

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

    for (Teacher teacher in teachers) {
      list.add(
        TeacherCard(
          id: teacher.id ?? '',
          imgUrl: teacher.avatar ?? '',
          // hasLiked: teacherProvider.isLikedTeacher(teacher.id ?? ''),
          name: teacher.name ?? '',
          national: teacher.country ?? '',
          stars: teacher.rating ?? 0,
          filters: teacher.specialties!.split(','),
          description: teacher.bio ?? '',
          specialties: widget.specialties,
        ),
      );
      list.add(const SizedBox(
        height: 20,
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lettutor/models/course_detail.dart';
import 'package:lettutor/screens/courses_screen/course_card.dart';
import 'package:lettutor/utils/utils.dart';

class CourseTabWidget extends StatefulWidget {
  final List<CourseDetail> courses;
  const CourseTabWidget({super.key, required this.courses});

  @override
  State<CourseTabWidget> createState() => _CourseTabWidgetState();
}

class _CourseTabWidgetState extends State<CourseTabWidget> {
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.courses
          .map(
            (course) => Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CourseCardWidget(
                  id: course.id ?? "",
                  desc: course.description ?? "",
                  level: utils.levelsMap(course.level ?? ""),
                  numberLessons: course.topics.length,
                  imgUrl: course.imageUrl ?? "",
                  name: course.name ?? ""),
            ),
          )
          .toList(),
      // Text(
      //   "English For Traveling",
      //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      // ),
    );
  }
}

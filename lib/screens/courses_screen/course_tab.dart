import 'package:flutter/material.dart';
import 'package:lettutor/screens/courses_screen/course_card.dart';

class CourseTabWidget extends StatefulWidget {
  const CourseTabWidget({super.key});

  @override
  State<CourseTabWidget> createState() => _CourseTabWidgetState();
}

class _CourseTabWidgetState extends State<CourseTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "English For Traveling",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 24,
        ),
        CourseCardWidget(
            desc: "Let's discuss how technology is changing the way we live",
            level: "Intermediate",
            numberLessons: 9,
            imgUrl: "assets/images/5e0e8b212ac750e7dc9886ac.png",
            name: "Life in the Internet Age"),
        SizedBox(
          height: 30,
        ),
        CourseCardWidget(
            desc:
                "Let's discuss our relationship as humans with our planet, Earth",
            level: "Intermediate",
            numberLessons: 7,
            imgUrl: "assets/images/5e2b99f70f8f1e9f625e8317.png",
            name: "Caring for Our Planet"),
        SizedBox(
          height: 30,
        ),
        CourseCardWidget(
            desc: "Let's discuss the many aspects of living a long, happy life",
            level: "Intermediate",
            numberLessons: 6,
            imgUrl: "assets/images/5e2b9a4c05342470fdddf8b8.png",
            name: "Healthy Mind, Healthy Body"),
        SizedBox(
          height: 30,
        ),
        CourseCardWidget(
            desc:
                "Let's discuss our preferences and habits surrounding movies and television shows",
            level: "Beginner",
            numberLessons: 10,
            imgUrl: "assets/images/5eab4979c920a20f93071fdd.png",
            name: "Movies and Television"),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

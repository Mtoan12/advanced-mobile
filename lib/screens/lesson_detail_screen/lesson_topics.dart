import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/screens/lesson_detail_screen/lesson_topic.dart';

class LessonTopicsWidget extends StatefulWidget {
  const LessonTopicsWidget({super.key});

  @override
  State<LessonTopicsWidget> createState() => LessonTopicsWidgetState();
}

class LessonTopicsWidgetState extends State<LessonTopicsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "listTopics".tr,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        LessonTopicWidget(
          active: true,
          number: 1,
          name: "Foods You Love",
        ),
        SizedBox(
          height: 8,
        ),
        LessonTopicWidget(
          active: false,
          number: 2,
          name: "Your Job",
        ),
        SizedBox(
          height: 8,
        ),
        LessonTopicWidget(
          active: false,
          number: 3,
          name: "Playing and Watching Sports",
        ),
        SizedBox(
          height: 8,
        ),
        LessonTopicWidget(
          active: false,
          number: 4,
          name: "The Best Pet",
        ),
        SizedBox(
          height: 8,
        ),
        LessonTopicWidget(
          active: false,
          number: 5,
          name: "Having Fun in Your Free Time",
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

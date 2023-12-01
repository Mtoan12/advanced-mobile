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
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const LessonTopicWidget(
          active: true,
          number: 1,
          name: "Foods You Love",
        ),
        const SizedBox(
          height: 8,
        ),
        const LessonTopicWidget(
          active: false,
          number: 2,
          name: "Your Job",
        ),
        const SizedBox(
          height: 8,
        ),
        const LessonTopicWidget(
          active: false,
          number: 3,
          name: "Playing and Watching Sports",
        ),
        const SizedBox(
          height: 8,
        ),
        const LessonTopicWidget(
          active: false,
          number: 4,
          name: "The Best Pet",
        ),
        const SizedBox(
          height: 8,
        ),
        const LessonTopicWidget(
          active: false,
          number: 5,
          name: "Having Fun in Your Free Time",
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

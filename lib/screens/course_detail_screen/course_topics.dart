import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/screens/course_detail_screen/course_topic.dart';

class CourseTopicsWidget extends StatefulWidget {
  const CourseTopicsWidget({super.key});

  @override
  State<CourseTopicsWidget> createState() => _CourseTopicsWidgetState();
}

class _CourseTopicsWidgetState extends State<CourseTopicsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "List Topics".tr,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CourseTopicWidget(
          number: 1,
          name: "Foods You Love",
        ),
        SizedBox(
          height: 20,
        ),
        CourseTopicWidget(
          number: 2,
          name: "Your Job",
        ),
        SizedBox(
          height: 20,
        ),
        CourseTopicWidget(
          number: 3,
          name: "Playing and Watching Sports",
        ),
        SizedBox(
          height: 20,
        ),
        CourseTopicWidget(
          number: 4,
          name: "The Best Pet",
        ),
        SizedBox(
          height: 20,
        ),
        CourseTopicWidget(
          number: 5,
          name: "Having Fun in Your Free Time",
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

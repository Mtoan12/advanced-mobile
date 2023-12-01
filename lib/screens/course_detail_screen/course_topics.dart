import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/topic.dart';
import 'package:lettutor/screens/course_detail_screen/course_topic.dart';

class CourseTopicsWidget extends StatefulWidget {
  final List<Topic> topics;
  const CourseTopicsWidget({super.key, required this.topics});

  @override
  State<CourseTopicsWidget> createState() => _CourseTopicsWidgetState();
}

class _CourseTopicsWidgetState extends State<CourseTopicsWidget> {
  @override
  Widget build(BuildContext context) {
    int number = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "List Topics".tr,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: widget.topics
              .map(
                (topic) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CourseTopicWidget(
                    number: ++number,
                    name: topic.name ?? "",
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

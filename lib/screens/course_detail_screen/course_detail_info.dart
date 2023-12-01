import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetailInfoWidget extends StatefulWidget {
  final String content1;
  final String content2;
  final String level;
  final int numberTopic;

  const CourseDetailInfoWidget({
    super.key,
    required this.content1,
    required this.content2,
    required this.level,
    required this.numberTopic,
  });

  @override
  State<CourseDetailInfoWidget> createState() => CourseDetailInfoWidgetState();
}

class CourseDetailInfoWidgetState extends State<CourseDetailInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Overview".tr,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Icon(
              Icons.help_outline,
              color: Colors.red[700],
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "Why take this course".tr,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                widget.content1,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Icon(
              Icons.help_outline,
              color: Colors.red[700],
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "What will you be able to do".tr,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                widget.content2,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Experience Level".tr,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Icon(
              Icons.group_outlined,
              color: Colors.blue[700],
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                widget.level,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          "Course Length".tr,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Icon(
              Icons.book_outlined,
              color: Colors.blue[700],
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${widget.numberTopic} ${"Topics".tr}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

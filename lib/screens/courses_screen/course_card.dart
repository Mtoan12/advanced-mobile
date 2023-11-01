import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseCardWidget extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String desc;
  final String level;
  final int numberLessons;

  const CourseCardWidget({
    super.key,
    required this.desc,
    required this.level,
    required this.numberLessons,
    required this.imgUrl,
    required this.name,
  });

  @override
  State<CourseCardWidget> createState() => CourseCardWidgetState();
}

class CourseCardWidgetState extends State<CourseCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(widget.imgUrl)),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.desc,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    widget.level,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${widget.numberLessons > 0 ? " - ${widget.numberLessons} Lessons" : ""}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}

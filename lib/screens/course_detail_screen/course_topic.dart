import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseTopicWidget extends StatefulWidget {
  final int number;
  final String name;
  const CourseTopicWidget(
      {super.key, required this.number, required this.name});

  @override
  State<CourseTopicWidget> createState() => _CourseTopicWidgetState();
}

class _CourseTopicWidgetState extends State<CourseTopicWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
        ),
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.number}.",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "${widget.name}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

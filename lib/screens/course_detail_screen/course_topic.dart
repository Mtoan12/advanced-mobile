import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/router/app_router_constant.dart';

class CourseTopicWidget extends StatefulWidget {
  final int number;
  final String name;
  final String fileLink;
  const CourseTopicWidget(
      {super.key,
      required this.number,
      required this.name,
      required this.fileLink});

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
      child: GestureDetector(
        onTap: () {
          context.pushNamed(AppRouterConstant.lessonRouteName,
              extra: widget.fileLink);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: isHovered
                ? [
                    const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [
                    const BoxShadow(
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
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonTopicWidget extends StatefulWidget {
  final int number;
  final String name;
  final bool active;
  const LessonTopicWidget(
      {super.key,
      required this.number,
      required this.name,
      required this.active});

  @override
  State<LessonTopicWidget> createState() => _LessonTopicWidgetState();
}

class _LessonTopicWidgetState extends State<LessonTopicWidget> {
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
        height: 48,
        decoration: BoxDecoration(
          color: widget.active || isHovered
              ? Colors.grey.withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${widget.number}.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
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

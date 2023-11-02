import 'package:flutter/material.dart';

class LessonInfoWidget extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String desc;

  const LessonInfoWidget({
    super.key,
    required this.desc,
    required this.imgUrl,
    required this.name,
  });

  @override
  State<LessonInfoWidget> createState() => LessonInfoWidgetState();
}

class LessonInfoWidgetState extends State<LessonInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(widget.imgUrl)),
      const SizedBox(
        height: 30,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            widget.desc,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ]);
  }
}

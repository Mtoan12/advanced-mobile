import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetailCardWidget extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String desc;

  const CourseDetailCardWidget({
    super.key,
    required this.desc,
    required this.imgUrl,
    required this.name,
  });

  @override
  State<CourseDetailCardWidget> createState() => CourseDetailCardWidgetState();
}

class CourseDetailCardWidgetState extends State<CourseDetailCardWidget> {
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
            offset: const Offset(0, 3),
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
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
              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700]),
                      onPressed: () {},
                      child: Text(
                        "Discover".tr,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )))
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

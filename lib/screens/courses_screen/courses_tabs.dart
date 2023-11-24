import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesTabsWidget extends StatefulWidget {
  const CoursesTabsWidget({super.key});

  @override
  State<CoursesTabsWidget> createState() => _CoursesTabsWidgetState();
}

class _CoursesTabsWidgetState extends State<CoursesTabsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1.0,
        ),
      )),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            )),
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              "Course".tr,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              "E-book",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 12.0),
            child: Text(
              "Interactive E-book",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

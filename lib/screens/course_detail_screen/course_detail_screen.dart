import 'package:flutter/material.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_card.dart';
import 'package:lettutor/widgets/appbar.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenHeight * 0.02,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseDetailCardWidget(
                      desc: "Gain confidence speaking about familiar topics",
                      imgUrl: "assets/images/5e2b895e541a832674533c18.png",
                      name: "Basic Conversation Topics")
                ],
              ),
            ),
          ),
        ));
  }
}

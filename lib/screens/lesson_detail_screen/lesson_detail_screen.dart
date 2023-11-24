import 'package:flutter/material.dart';
import 'package:lettutor/screens/lesson_detail_screen/lesson_info.dart';
import 'package:lettutor/screens/lesson_detail_screen/lesson_review.dart';
import 'package:lettutor/screens/lesson_detail_screen/lesson_topics.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';

class LessonDetailScreen extends StatefulWidget {
  const LessonDetailScreen({super.key});

  @override
  State<LessonDetailScreen> createState() => LessonDetailScreenState();
}

class LessonDetailScreenState extends State<LessonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar(),
        endDrawer: DrawerWidget(),
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
                  LessonInfoWidget(
                    desc: "Gain confidence speaking about familiar topics",
                    imgUrl: "assets/images/5e2b895e541a832674533c18.png",
                    name: "Basic Conversation Topics",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  LessonTopicsWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  LessonReviewWidget(
                      lessonUrl:
                          "https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileFoods%20You%20Love.pdf"),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

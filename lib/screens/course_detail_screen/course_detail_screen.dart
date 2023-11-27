import 'package:flutter/material.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_card.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_info.dart';
import 'package:lettutor/screens/course_detail_screen/course_topics.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';

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
        appBar: appBar(context),
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
                  CourseDetailCardWidget(
                      desc: "Gain confidence speaking about familiar topics",
                      imgUrl: "assets/images/5e2b895e541a832674533c18.png",
                      name: "Basic Conversation Topics"),
                  SizedBox(
                    height: 40,
                  ),
                  CourseDetailInfoWidget(
                    content1:
                        "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
                    content2:
                        "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
                    level: "Beginner",
                    numberTopic: 10,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CourseTopicsWidget(),
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

import 'package:flutter/material.dart';
import 'package:lettutor/api/course_api.dart';
import 'package:lettutor/models/course_detail.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_card.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_info.dart';
import 'package:lettutor/screens/course_detail_screen/course_topics.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';

class CourseDetailScreen extends StatefulWidget {
  final String id;
  const CourseDetailScreen({super.key, required this.id});

  @override
  State<CourseDetailScreen> createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen> {
  CourseDetail course = CourseDetail(
    id: "",
    name: "",
    description: "",
    imageUrl: "",
    level: "",
    reason: "",
    purpose: "",
    otherDetails: "",
    defaultPrice: 0,
    coursePrice: 0,
    courseType: "",
    sectionType: "",
    visible: false,
    displayOrder: 0,
    createdAt: "",
    updatedAt: "",
    topics: [],
    categories: [],
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CourseApi.getCourseDetail(widget.id).then((value) {
      setState(() {
        course = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    var courseTopics = course.topics ?? [];

    Utils utils = Utils();

    return Scaffold(
        appBar: appBar(context),
        endDrawer: const DrawerWidget(),
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
                      desc: course.description ?? "",
                      imgUrl: course.imageUrl ?? "",
                      name: course.name ?? ""),
                  const SizedBox(
                    height: 40,
                  ),
                  CourseDetailInfoWidget(
                    content1: course.reason ?? "",
                    content2: course.purpose ?? "",
                    level: utils.levelsMap(course.level ?? ""),
                    numberTopic: course.topics.length ?? 0,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CourseTopicsWidget(
                    topics: courseTopics,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

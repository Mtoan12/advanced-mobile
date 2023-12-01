import 'package:flutter/material.dart';
import 'package:lettutor/provider/course_provider.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_card.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_info.dart';
import 'package:lettutor/screens/course_detail_screen/course_topics.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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

    Map<String, dynamic> qparams =
        GoRouterState.of(context).uri.queryParameters;
    String id = qparams['id'] ?? '964bed84-6450-49ee-92d5-e8c565864bd9';

    CourseProvider courseProvider = context.watch<CourseProvider>();
    var course = courseProvider.getCourseById(id);
    var courseTopics = course?.topics ?? [];

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
                      desc: course?.description ?? "",
                      imgUrl: course?.imageUrl ?? "",
                      name: course?.name ?? ""),
                  const SizedBox(
                    height: 40,
                  ),
                  CourseDetailInfoWidget(
                    content1: course?.reason ?? "",
                    content2: course?.purpose ?? "",
                    level: utils.levelsMap(course?.level ?? ""),
                    numberTopic: course?.topics.length ?? 0,
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

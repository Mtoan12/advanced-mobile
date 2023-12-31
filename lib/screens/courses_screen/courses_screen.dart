import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/api/course_api.dart';
import 'package:lettutor/models/course_detail.dart';
import 'package:lettutor/screens/courses_screen/course_tab.dart';
import 'package:lettutor/screens/courses_screen/courses_filters.dart';
import 'package:lettutor/screens/courses_screen/courses_tabs.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => CoursesScreenState();
}

class CoursesScreenState extends State<CoursesScreen> {
  List<CourseDetail> courses = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CourseApi.getCourseList().then((value) {
      setState(() {
        courses = value.rows;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
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
                  SvgPicture.asset(
                    'assets/images/course.svg',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Discover Courses".tr,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 3))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields"
                                  .tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  const CoursesFiltersWidget(),
                  const SizedBox(
                    height: 24,
                  ),
                  const CoursesTabsWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                  CourseTabWidget(
                    courses: courses,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const NumberPaginator(numberPages: 1),
                ],
              ),
            ),
          ),
        ));
  }
}

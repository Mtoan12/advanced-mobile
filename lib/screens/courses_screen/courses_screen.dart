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
  int coursesNumber = 0;
  int page = 1;
  int perPage = 12;
  String q = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CourseApi.getCourseList().then((value) {
      setState(() {
        courses = value.rows;
        coursesNumber = value.count;
      });
    });
  }

  void fetchCourses() {
    CourseApi.getCourseList(page: page, perPage: perPage, q: q).then((value) {
      setState(() {
        courses = value.rows;
        coursesNumber = value.count;
      });
    });
  }

  final ScrollController _scrollController = ScrollController();

  void handleChangePage(int page) {
    setState(() {
      this.page = page;
    });
    fetchCourses();
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void handleSearch(String q) {
    setState(() {
      this.q = q;
    });
    fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar(context),
        endDrawer: const DrawerWidget(),
        body: SingleChildScrollView(
          controller: _scrollController,
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
                  NumberPaginator(
                    numberPages:
                        coursesNumber ~/ double.parse(perPage.toString()) + 1,
                    showNextButton: false,
                    showPrevButton: false,
                    onPageChange: (int index) {
                      handleChangePage(index + 1);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

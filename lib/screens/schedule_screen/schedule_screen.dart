import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/screens/schedule_screen/latest_book.dart';
import 'package:lettutor/screens/schedule_screen/teacher_books.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
                  SvgPicture.asset(
                    'assets/images/calendar-check.svg',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Schedule".tr,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 3))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Here is a list of the sessions you have booked"
                                  .tr,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours"
                                  .tr,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  LatestBookWidget(),
                  SizedBox(
                    height: 36,
                  ),
                  TeacherBooksWidget(),
                  SizedBox(
                    height: 36,
                  ),
                  NumberPaginator(numberPages: 1),
                  SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

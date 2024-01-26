import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/localization/locales.dart';
import 'package:lettutor/screens/schedule_screen/latest_book.dart';
import 'package:lettutor/screens/schedule_screen/teacher_books.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ScrollController _scrollController = ScrollController();

  void handleScrollToTop() {
    Utils.scrollToTop(_scrollController);
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
                    'assets/images/calendar-check.svg',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    LocaleData.schedule.getString(context),
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
                              "Here is a list of the sessions you have booked"
                                  .tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours"
                                  .tr,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  const LatestBookWidget(),
                  const SizedBox(
                    height: 36,
                  ),
                  TeacherBooksWidget(
                    handleScrollToTop: handleScrollToTop,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

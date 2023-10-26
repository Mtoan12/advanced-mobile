import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/schedule_card.dart';
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
                  Icon(
                    Icons.calendar_month,
                    size: 96,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "schedule".tr,
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
                              "scheduleDescription1".tr,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "scheduleDescription2".tr,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "latestBook".tr,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.3)))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                    color: Colors.grey.withOpacity(0.1)),
                                width: screenWidth * 0.25,
                                height: 48,
                                child: Center(
                                    child: Text(
                                  "Name",
                                  style: TextStyle(fontSize: 12),
                                ))),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  top: BorderSide(
                                      color: Colors.grey.withOpacity(0.3)),
                                )),
                                width: screenWidth * 0.25,
                                height: 48,
                                child: Center(
                                    child: Text(
                                  "sample.pdf",
                                  style: TextStyle(
                                      color: Colors.blue[500], fontSize: 12),
                                ))),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.withOpacity(0.3)),
                                    ),
                                    color: Colors.grey.withOpacity(0.1)),
                                width: screenWidth * 0.15,
                                height: 48,
                                child: Center(
                                    child: Text("Page",
                                        style: TextStyle(fontSize: 12)))),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.grey.withOpacity(0.3)),
                                    right: BorderSide(
                                        color: Colors.grey.withOpacity(0.3)),
                                  ),
                                ),
                                width: screenWidth * 0.1,
                                height: 48,
                                child: Center(
                                    child: Text("0",
                                        style: TextStyle(fontSize: 12)))),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.withOpacity(0.3)),
                                      left: BorderSide(
                                          color: Colors.grey.withOpacity(0.3)),
                                    ),
                                    color: Colors.grey.withOpacity(0.1)),
                                width: screenWidth * 0.25,
                                height: 48,
                                child: Center(
                                    child: Text(
                                  "Description",
                                  style: TextStyle(fontSize: 12),
                                ))),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                width: screenWidth * 0.5,
                                height: 48,
                                child: Center(
                                    child: Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.blue[800], fontSize: 12),
                                ))),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  ScheduleCardWidget(
                      date: "T6, 27 Thg 10 23",
                      lessonsQuantity: 1,
                      imgUrl:
                          "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
                      name: "Keegan",
                      national: "Tunisia",
                      time: "05:30 - 05:55",
                      request: "Tôi muốn học"),
                  SizedBox(
                    height: 24,
                  ),
                  ScheduleCardWidget(
                      date: "T7, 28 Thg 10 23",
                      lessonsQuantity: 1,
                      imgUrl:
                          "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
                      name: "Keegan",
                      national: "Tunisia",
                      time: "15:30 - 15:55",
                      request:
                          "Currently there are no requests for this class. Please write down any requests for the teacher."),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/widgets/appbar.dart';

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
              right: screenHeight * 0.05,
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
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
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
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              color: Colors.grey.withOpacity(0.1)),
                          width: screenWidth * 0.15,
                          height: 48,
                          child: Center(
                              child: Text("Page",
                                  style: TextStyle(fontSize: 12)))),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          width: screenWidth * 0.1,
                          height: 48,
                          child: Center(
                              child:
                                  Text("0", style: TextStyle(fontSize: 12)))),
                    ],
                  ),
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
                                color: Colors.blue[500], fontSize: 12),
                          ))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/widgets/appbar.dart';

class TeachersListScreen extends StatefulWidget {
  const TeachersListScreen({super.key});

  @override
  State<TeachersListScreen> createState() => _TeachersListScreenState();
}

class _TeachersListScreenState extends State<TeachersListScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.01,
            right: screenHeight * 0.01,
          ),
          child: Container(
            width: screenWidth,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: screenWidth,
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue[900]!,
                        Colors.blue[800]!,
                      ],
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.02, right: screenHeight * 0.01),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "upcommingLesson".tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Wrap(
                              children: [
                                Text("timeLabel".tr,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text("timeRemainingLabel".tr,
                                    style: TextStyle(
                                        color: Colors.yellow[200],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.smart_display,
                                      color: Colors.blue[400]),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "enterLessonRoom".tr,
                                    style: TextStyle(color: Colors.blue[400]),
                                  )
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text("totalTimeLabel".tr,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03, right: screenWidth * 0.03),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "findATutor".tr,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: [
                          Input(
                            width: 160,
                            height: 32,
                            icon: Icon(null),
                            placeHolder: "enterTutorName".tr,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Input(
                            width: 160,
                            height: 32,
                            icon: Icon(Icons.arrow_drop_down),
                            placeHolder: "selectTutorNationality".tr,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "selectAvailableTutoringTime".tr,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                        children: [
                          Input(
                            width: 144,
                            height: 32,
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                            ),
                            placeHolder: "selectADay".tr,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Input(
                            width: 100,
                            height: 32,
                            icon: Icon(null),
                            placeHolder: "startTime".tr,
                          ),
                          Input(
                            width: 100,
                            height: 32,
                            icon: Icon(
                              Icons.timelapse,
                              color: Colors.grey,
                            ),
                            placeHolder: "endTime".tr,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                        )),
                        child: Wrap(runSpacing: 8, spacing: 4, children: [
                          Category(
                            name: "all".tr,
                            active: true,
                          ),
                          Category(
                            name: "englishForKids".tr,
                            active: false,
                          ),
                          Category(
                            name: "englishForBusiness".tr,
                            active: false,
                          ),
                          Category(
                            name: "conversational".tr,
                            active: false,
                          ),
                          Category(
                            name: "STARTERS",
                            active: false,
                          ),
                          Category(
                            name: "MOVERS",
                            active: false,
                          ),
                          Category(
                            name: "FLYERS",
                            active: false,
                          ),
                          Category(
                            name: "KET",
                            active: false,
                          ),
                          Category(
                            name: "PET",
                            active: false,
                          ),
                          Category(
                            name: "IELTS",
                            active: false,
                          ),
                          Category(
                            name: "TOEFL",
                            active: false,
                          ),
                          Category(
                            name: "TOEIC",
                            active: false,
                          ),
                          SizedBox(
                            height: 32,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 2, bottom: 2),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue[300],
                                    side: BorderSide(
                                        width: 1, color: Colors.blue)),
                                onPressed: () {},
                                child: Text(
                                  'resetFilters'.tr,
                                )),
                          )
                        ]),
                      )
                    ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String placeHolder;
  final Icon icon;
  final double width;
  final double height;
  const Input({
    super.key,
    required this.placeHolder,
    required this.icon,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            suffixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(width: 3, color: Colors.blue),
            ),
            hintText: placeHolder,
            hintStyle: TextStyle(fontSize: 10),
            hoverColor: Colors.blue,
            contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 12),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ));
  }
}

class Category extends StatefulWidget {
  final String name;
  final bool active;
  const Category({super.key, required this.name, required this.active});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
            backgroundColor: widget.active ? Colors.blue[50] : Colors.grey[200],
            foregroundColor:
                widget.active ? Colors.blue[700] : Colors.grey[700],
          ),
          onPressed: () {},
          child: Text(widget.name)),
    );
  }
}

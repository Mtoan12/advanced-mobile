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
                            width: 120,
                            height: 32,
                            icon: Icon(Icons.arrow_drop_down),
                            placeHolder: "selectTutorNationality".tr,
                          ),
                        ],
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
            hoverColor: Colors.blue,
            contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 12),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ));
  }
}

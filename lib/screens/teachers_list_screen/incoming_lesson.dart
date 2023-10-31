import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomingLessonWidget extends StatefulWidget {
  const IncomingLessonWidget({super.key});

  @override
  State<IncomingLessonWidget> createState() => _IncomingLessonWidgetState();
}

class _IncomingLessonWidgetState extends State<IncomingLessonWidget> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
                          Icon(Icons.smart_display, color: Colors.blue[400]),
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
        ));
  }
}

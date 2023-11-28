import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/utils/utils.dart';

class IncomingLessonWidget extends StatefulWidget {
  final int totalTime;
  const IncomingLessonWidget({super.key, required this.totalTime});

  @override
  State<IncomingLessonWidget> createState() => _IncomingLessonWidgetState();
}

class _IncomingLessonWidgetState extends State<IncomingLessonWidget> {
  Utils utils = Utils();
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
                "Upcomming lesson".tr,
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
                        Text("Thu, 26 Oct 23 03:30 - 03:55".tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("(starts in 81:48:36)".tr,
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
                            "Enter lesson room".tr,
                            style: TextStyle(color: Colors.blue[400]),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                  'Total lesson time is ${utils.convertTime(widget.totalTime)}',
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

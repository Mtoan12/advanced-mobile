import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleCardWidget extends StatefulWidget {
  final String date;
  final int lessonsQuantity;
  final String imgUrl;
  final String name;
  final String national;
  final String time;
  final String request;
  const ScheduleCardWidget(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.national,
      required this.time,
      required this.request,
      required this.date,
      required this.lessonsQuantity});

  @override
  State<ScheduleCardWidget> createState() => _ScheduleCardWidgetState();
}

class _ScheduleCardWidgetState extends State<ScheduleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.date,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(
            "${widget.lessonsQuantity} buổi học",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imgUrl),
                    radius: 32,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        widget.national,
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "directMessage".tr,
                        style: TextStyle(fontSize: 12, color: Colors.blue[500]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.time),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: BorderSide(width: 1, color: Colors.red)),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.cancel),
                              SizedBox(
                                width: 4,
                              ),
                              Text("cancel".tr),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.expand_more_outlined),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "requestForLesson".tr,
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text("editRequest".tr,
                            style: TextStyle(fontSize: 10, color: Colors.blue))
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border(
                            left:
                                BorderSide(color: Colors.grey.withOpacity(0.2)),
                            right:
                                BorderSide(color: Colors.grey.withOpacity(0.2)),
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.2)))),
                    child: Column(children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(widget.request),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Center(
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: BorderSide(width: 1, color: Colors.blue)),
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Text("goToMeeting".tr, style: TextStyle()),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}

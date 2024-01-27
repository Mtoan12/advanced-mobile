import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:lettutor/api/schedule_api.dart';
import 'package:lettutor/localization/locales.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScheduleCardWidget extends StatefulWidget {
  final Function fetchBookingList;
  final String scheduleDetailId;
  final String date;
  final int lessonsQuantity;
  final String imgUrl;
  final String name;
  final String national;
  final String time;
  final String request;
  final int startTimestamp;
  final Schedule schedule;
  const ScheduleCardWidget(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.national,
      required this.time,
      required this.request,
      required this.date,
      required this.lessonsQuantity,
      required this.startTimestamp,
      required this.scheduleDetailId,
      required this.fetchBookingList,
      required this.schedule});

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
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.date,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imgUrl != ''
                        ? widget.imgUrl
                        : "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg"),
                    radius: 32,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.name != '' ? widget.name : "Keegan",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        widget.national != '' ? widget.national : "TN",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Text(
                        LocaleData.directMessage.getString(context),
                        style: TextStyle(fontSize: 12, color: Colors.blue[500]),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.time,
                          style: const TextStyle(color: Colors.black)),
                      Utils.checkIfInTwoHours(widget.startTimestamp)
                          ? Container()
                          : TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(
                                      width: 1, color: Colors.red)),
                              onPressed: () async {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      String note = "";
                                      return AlertDialog(
                                        title: const Text("Cancel schedule"),
                                        content: TextField(
                                          onChanged: (value) {
                                            note = value;
                                          },
                                          decoration: const InputDecoration(
                                              hintText: "Notes"),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Later")),
                                          TextButton(
                                              onPressed: () {
                                                ScheduleApi.cancelSchedule(
                                                        widget.scheduleDetailId,
                                                        note)
                                                    .then((value) => {
                                                          if (value
                                                                  .statusCode ==
                                                              200)
                                                            {
                                                              widget
                                                                  .fetchBookingList(),
                                                            }
                                                        });
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Submit")),
                                        ],
                                      );
                                    });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.cancel),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text("Cancel".tr),
                                ],
                              ))
                    ],
                  ),
                  const SizedBox(
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
                            const Icon(Icons.expand_more_outlined),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              LocaleData.requestForLesson.getString(context),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                        Text(LocaleData.editRequest.getString(context),
                            style: const TextStyle(
                                fontSize: 10, color: Colors.blue))
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
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.request,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(width: 1, color: Colors.blue)),
                onPressed: () async {
                  String token =
                      widget.schedule.studentMeetingLink!.split("=")[1];
                  await Utils.joinMeeting(
                      widget.schedule.userId!,
                      widget
                          .schedule.scheduleDetailInfo!.scheduleInfo!.tutorId!,
                      token);
                  Fluttertoast.showToast(
                      msg:
                          "Your lesson will start in ${Utils.differentTime(widget.schedule.scheduleDetailInfo!.scheduleInfo!.startTimestamp!)}",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Text(LocaleData.goToMeeting.getString(context),
                        style: const TextStyle()),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}

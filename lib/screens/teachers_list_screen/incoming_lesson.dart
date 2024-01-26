import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:lettutor/api/booking_api.dart';
import 'package:lettutor/api/total_time_api.dart';
import 'package:lettutor/localization/locales.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/models/total_time.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/count_down.dart';

class IncomingLessonWidget extends StatefulWidget {
  const IncomingLessonWidget({super.key});

  @override
  State<IncomingLessonWidget> createState() => _IncomingLessonWidgetState();
}

class _IncomingLessonWidgetState extends State<IncomingLessonWidget> {
  Utils utils = Utils();

  TotalTime totalTime = TotalTime(total: 0);
  List<Schedule> schedules = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchTotalTime();
    fetchUpcommingCourses();
  }

  fetchTotalTime() {
    TotalTimeApi.getTotalTime().then((data) {
      setState(() {
        totalTime = data;
      });
    });
  }

  fetchUpcommingCourses() {
    BookingApi.getBookingList(perPage: 1).then((data) {
      setState(() {
        schedules = data.rows;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    // if (schedules.isEmpty) {
    //   return Container();
    // }

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
                LocaleData.upcommingLesson.getString(context),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              schedules.isEmpty
                  ? const Text("You have no upcoming lesson.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                  "${Utils.convertTimeStamp(schedules[0].scheduleDetailInfo!.scheduleInfo!.startTimestamp!)} - ${Utils.convertTimeStamp(schedules[0].scheduleDetailInfo!.scheduleInfo!.endTimestamp!).split(' ').last}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                width: 2,
                              ),
                              CountdownWidget(
                                  timestampInMilliseconds: schedules[0]
                                      .scheduleDetailInfo!
                                      .scheduleInfo!
                                      .startTimestamp!)
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              String token = schedules[0]
                                  .studentMeetingLink!
                                  .split("=")[1];
                              Utils.joinMeeting(
                                  schedules[0].userId!,
                                  schedules[0]
                                      .scheduleDetailInfo!
                                      .scheduleInfo!
                                      .tutorId!,
                                  token);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.smart_display,
                                    color: Colors.blue[400]),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  LocaleData.enterLessonRoom.getString(context),
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
                  '${LocaleData.totalTimeLabel.getString(context)} ${utils.convertTime(totalTime.total)}',
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

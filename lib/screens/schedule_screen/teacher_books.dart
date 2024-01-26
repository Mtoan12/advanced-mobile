import 'package:flutter/material.dart';
import 'package:lettutor/api/booking_api.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/screens/schedule_screen/schedule_card.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:number_paginator/number_paginator.dart';

class TeacherBooksWidget extends StatefulWidget {
  final Function handleScrollToTop;
  const TeacherBooksWidget({super.key, required this.handleScrollToTop});

  @override
  State<TeacherBooksWidget> createState() => _TeacherBooksWidgetState();
}

class _TeacherBooksWidgetState extends State<TeacherBooksWidget> {
  Utils utils = Utils();
  List<Schedule> schedules = [];
  int page = 1;
  int scheduleNumbers = 0;
  int perPage = 12;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BookingApi.getBookingList(page: page, perPage: perPage).then((value) {
      setState(() {
        schedules = value.rows;
        scheduleNumbers = value.count;
      });
    });
  }

  void handleChangePage(int index) {
    setState(() {
      page = index + 1;
    });

    BookingApi.getBookingList(page: page, perPage: perPage).then((value) {
      setState(() {
        schedules = value.rows;
        scheduleNumbers = value.count;
      });
    }).then((value) => widget.handleScrollToTop());
  }

  void fetchBookingList() {
    BookingApi.getBookingList(page: page, perPage: perPage).then((value) {
      setState(() {
        schedules = value.rows;
        scheduleNumbers = value.count;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: schedules
              .map((schedule) => Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: ScheduleCardWidget(
                        schedule: schedule,
                        fetchBookingList: fetchBookingList,
                        scheduleDetailId: schedule.id ?? '',
                        startTimestamp: schedule.scheduleDetailInfo
                                ?.scheduleInfo?.startTimestamp ??
                            0,
                        date: utils.convertDate(
                            schedule.scheduleDetailInfo?.scheduleInfo?.date ??
                                ''),
                        lessonsQuantity: schedule.convertedLesson ?? 0,
                        imgUrl: schedule.scheduleDetailInfo?.scheduleInfo
                                ?.tutorInfo?.avatar ??
                            '',
                        name: schedule.scheduleDetailInfo?.scheduleInfo
                                ?.tutorInfo?.name ??
                            '',
                        national: schedule.scheduleDetailInfo?.scheduleInfo
                                ?.tutorInfo?.country ??
                            '',
                        time:
                            "${Utils.addTimeZone(schedule.scheduleDetailInfo?.scheduleInfo?.startTime, schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.timezone)} - ${Utils.addTimeZone(schedule.scheduleDetailInfo?.scheduleInfo?.endTime, schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.timezone)}",
                        request: schedule.studentRequest ?? ''),
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 36,
        ),
        NumberPaginator(
          numberPages: scheduleNumbers ~/ double.parse(perPage.toString()) + 1,
          showNextButton: false,
          showPrevButton: false,
          onPageChange: (int index) {
            handleChangePage(index);
          },
        ),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }
}

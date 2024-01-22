import 'package:flutter/material.dart';
import 'package:lettutor/api/booking_api.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/screens/history_screen/history_card.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:number_paginator/number_paginator.dart';

class HistoryCardsWidget extends StatefulWidget {
  final Function handleScrollToTop;
  const HistoryCardsWidget({super.key, required this.handleScrollToTop});

  @override
  State<HistoryCardsWidget> createState() => _HistoryCardsWidgetState();
}

class _HistoryCardsWidgetState extends State<HistoryCardsWidget> {
  Utils utils = Utils();
  List<Schedule> historySchedules = [];
  int page = 1;
  int historyNumbers = 0;
  int perPage = 12;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BookingApi.getBookingList(
            inFuture: 0, sortBy: "desc", perPage: perPage, page: page)
        .then((value) {
      setState(() {
        historySchedules = value.rows;
        historyNumbers = value.count;
      });
    });
  }

  void handleChangePage(int index) {
    setState(() {
      page = index + 1;
    });

    BookingApi.getBookingList(
            inFuture: 0, sortBy: "desc", perPage: perPage, page: page)
        .then((value) {
      setState(() {
        historySchedules = value.rows;
        historyNumbers = value.count;
      });
    }).then((value) => widget.handleScrollToTop());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: historySchedules
              .map((schedule) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: HistoryCardWidget(
                      imgUrl: schedule.scheduleDetailInfo?.scheduleInfo
                              ?.tutorInfo?.avatar ??
                          '',
                      name: schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                              ?.name ??
                          '',
                      national: schedule.scheduleDetailInfo?.scheduleInfo
                              ?.tutorInfo?.country ??
                          '',
                      lessonTime:
                          "${Utils.addTimeZone(schedule.scheduleDetailInfo?.scheduleInfo?.startTime, schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.timezone)} - ${Utils.addTimeZone(schedule.scheduleDetailInfo?.scheduleInfo?.endTime, schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.timezone)}",
                      date: utils.convertDate(
                          schedule.scheduleDetailInfo?.scheduleInfo?.date ??
                              ''),
                      updateTime: utils.convertDate(schedule.updatedAt ?? ''),
                      request: schedule.studentRequest ?? '',
                      review: schedule.tutorReview ?? '',
                      rating: 0,
                      createdAt: schedule.createdAt ?? '',
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 24,
        ),
        NumberPaginator(
          numberPages: historyNumbers ~/ double.parse(perPage.toString()) + 1,
          showNextButton: false,
          showPrevButton: false,
          onPageChange: (int index) {
            handleChangePage(index);
          },
        ),
      ],
    );
  }
}

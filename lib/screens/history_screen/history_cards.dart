import 'package:flutter/material.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/provider/schedule_provider.dart';
import 'package:lettutor/screens/history_screen/history_card.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:provider/provider.dart';

class HistoryCardsWidget extends StatefulWidget {
  const HistoryCardsWidget({super.key});

  @override
  State<HistoryCardsWidget> createState() => _HistoryCardsWidgetState();
}

class _HistoryCardsWidgetState extends State<HistoryCardsWidget> {
  Utils utils = Utils();
  @override
  Widget build(BuildContext context) {
    ScheduleProvider scheduleProvider = context.watch<ScheduleProvider>();
    List<Schedule> historySchedules = scheduleProvider.getHistorySchedules();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: historySchedules
          .map((schedule) => Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: HistoryCardWidget(
                  imgUrl: schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                          ?.avatar ??
                      '',
                  name: schedule
                          .scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name ??
                      '',
                  national: schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                          ?.country ??
                      '',
                  lessonTime:
                      "${schedule.scheduleDetailInfo?.scheduleInfo?.startTime} - ${schedule.scheduleDetailInfo?.scheduleInfo?.endTime}",
                  date: utils.convertDate(
                      schedule.scheduleDetailInfo?.scheduleInfo?.date ?? ''),
                  updateTime: utils.convertDate(schedule.updatedAt ?? ''),
                  request: schedule.studentRequest ?? '',
                  review: schedule.tutorReview ?? '',
                  rating: 0,
                ),
              ))
          .toList(),
    );
  }
}

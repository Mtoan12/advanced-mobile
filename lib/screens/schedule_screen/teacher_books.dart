import 'package:flutter/material.dart';
import 'package:lettutor/provider/schedult_provider.dart';
import 'package:lettutor/screens/schedule_screen/schedule_card.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:provider/provider.dart';

class TeacherBooksWidget extends StatefulWidget {
  const TeacherBooksWidget({super.key});

  @override
  State<TeacherBooksWidget> createState() => _TeacherBooksWidgetState();
}

class _TeacherBooksWidgetState extends State<TeacherBooksWidget> {
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    ScheduleProvider scheduleProvider = context.watch<ScheduleProvider>();
    var schedules = scheduleProvider.schedules;

    var scheduleInfos = schedules
        .map((schedule) => schedule.scheduleDetailInfo?.scheduleInfo!)
        .toList();

    return Column(
      children: schedules
          .map((schedule) => Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ScheduleCardWidget(
                    date: utils.convertDate(
                        schedule.scheduleDetailInfo?.scheduleInfo?.date ?? ''),
                    lessonsQuantity: schedule.convertedLesson ?? 0,
                    imgUrl: schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                            ?.avatar ??
                        '',
                    name: schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                            ?.name ??
                        '',
                    national: schedule.scheduleDetailInfo?.scheduleInfo
                            ?.tutorInfo?.country ??
                        '',
                    time:
                        "${schedule.scheduleDetailInfo?.scheduleInfo?.startTime} - ${schedule.scheduleDetailInfo?.scheduleInfo?.endTime}}",
                    request: schedule.studentRequest ?? ''),
              ))
          .toList(),
    );
  }
}

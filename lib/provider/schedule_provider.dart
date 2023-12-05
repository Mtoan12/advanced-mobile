import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lettutor/json/schedules.dart';
import 'package:lettutor/models/schedule.dart';

class ScheduleProvider extends ChangeNotifier {
  List<Schedule> schedules = [];

  ScheduleProvider() {
    var list = json.decode(schedulesJson) as List<dynamic>;

    schedules = list.map((e) => Schedule.fromJson(e)).toList();
  }

  List<Schedule> getUpcomingSchedules() {
    DateTime now = DateTime.now();
    return schedules
        .where((schedule) =>
            DateTime.parse(schedule.scheduleDetailInfo!.scheduleInfo!.date!)
                .isAfter(now))
        .toList();
  }

  List<Schedule> getHistorySchedules() {
    DateTime now = DateTime.now();
    return schedules
        .where((schedule) =>
            DateTime.parse(schedule.scheduleDetailInfo!.scheduleInfo!.date!)
                .isBefore(now))
        .toList();
  }

  void addSchedule(Schedule schedule) {
    schedules.add(schedule);
    schedules.sort((a, b) =>
        DateTime.parse(b.createdAt!).compareTo(DateTime.parse(a.createdAt!)));
    for (var element in schedules) {
      print(element.studentRequest);
    }
    notifyListeners();
  }
}

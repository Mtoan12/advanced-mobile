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
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:lettutor/api/apis.dart';
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/schedule_of_tutor.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleApi {
  static Future<List<ScheduleOfTutor>> getSchedulesOfTutor(
      String tutorId) async {
    List<ScheduleOfTutor> schedulesOfTutor = [];
    var uri = Uri.parse(Apis.getScheduleList(tutorId));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(uri,
        headers: headers(token: prefs.getString("access_token")));

    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      schedulesOfTutor = List<ScheduleOfTutor>.from(
          data['scheduleOfTutor'].map((x) => ScheduleOfTutor.fromJson(x)));
      return schedulesOfTutor;
    } else {
      throw Exception(data['message']);
    }
  }

  static ScheduleOfTutor? getScheduleOfTutor(
      List<ScheduleOfTutor> schedulesOfTutor, String date, String time) {
    ScheduleOfTutor? scheduleOfTutor =
        schedulesOfTutor.firstWhereOrNull((element) {
      String startTime = Utils.convertTimeStamp(element.startTimestamp);
      return startTime.contains(date) &&
          startTime.contains(time.split(' - ')[0]);
    });
    return scheduleOfTutor;
  }

  static Future cancelSchedule(String scheduleDetailId, String note) async {
    var uri = Uri.parse(Apis.scheduleDetail);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = jsonEncode({
      "scheduleDetailId": scheduleDetailId,
      "cancelInfo": {
        "cancelReasonId": 1,
        "note": note,
      },
    });
    var response = await http.delete(uri,
        headers: headers(token: prefs.getString("access_token")), body: body);

    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(data['message']);
    }
  }
}

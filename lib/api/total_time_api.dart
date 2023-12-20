import 'dart:convert';

import 'package:lettutor/api/apis.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/total_time.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TotalTimeApi {
  static Future<TotalTime> getTotalTime() async {
    TotalTime totalTime;
    var url = Uri.parse(Apis.totalTime);

    final SharedPreferences predf = await SharedPreferences.getInstance();

    var response = await http.get(url,
        headers: headers(token: predf.getString("access_token")));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      totalTime = TotalTime.fromJson(jsonResponse);
      return totalTime;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load data');
    }
  }
}

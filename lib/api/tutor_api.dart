import 'dart:convert';

import 'package:lettutor/api/apis.dart';

import 'package:http/http.dart' as http;
import 'package:lettutor/api/headers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorApi {
  static Future like(String tutorId) async {
    var uri = Uri.parse(Apis.manageFavoriteTutor);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map body = {
      'tutorId': tutorId,
    };

    var response = await http.post(uri,
        body: json.encode(body),
        headers: headers(token: prefs.getString('access_token')));

    if (response.statusCode == 200) {
      print('like tutor success');
      return response;
    } else {
      print('like tutor failed');
      throw Exception('Failed to like tutor');
    }
  }

  static Future report(String tutorId, String content) async {

    var uri = Uri.parse(Apis.report);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map body = {
      'tutorId': tutorId,
      'content': content,
    };

    var response = await http.post(uri,
        body: json.encode(body),
        headers: headers(token: prefs.getString('access_token')));

    if (response.statusCode == 200) {
      print('report tutor success');
      return response;
    } else {
      print('report tutor failed');
      throw Exception('Failed to report tutor');
    }
  }
}

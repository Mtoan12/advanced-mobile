import 'dart:convert';

import 'package:lettutor/api/Apis.dart';
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/course_detail.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseApi {
  int count;
  List<CourseDetail> rows;

  CourseApi.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        rows = json['rows']
            .map<CourseDetail>((course) => CourseDetail.fromJson(course))
            .toList();

  static Future<CourseApi> getCourseList(
      {int page = 1, int perPage = 100}) async {
    CourseApi courseApi;
    var uri = Uri.parse('${Apis.baseUrl}course?page=$page&perPage=$perPage');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(
      uri,
      headers: headers(token: prefs.getString("access_token")),
    );

    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      courseApi = CourseApi.fromJson(data['data']);
      return courseApi;
    } else {
      throw Exception(data['message']);
    }
  }

  static Future<CourseDetail> getCourseDetail(String id) async {
    CourseDetail courseDetail;
    var uri = Uri.parse('${Apis.baseUrl}course/$id');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(
      uri,
      headers: headers(token: prefs.getString("access_token")),
    );

    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      courseDetail = CourseDetail.fromJson(data['data']);
      return courseDetail;
    } else {
      throw Exception(data['message']);
    }
  }
}

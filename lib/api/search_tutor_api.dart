import 'dart:convert';

import 'package:lettutor/api/apis.dart';
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/error_response.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/models/tutors_filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchTutorApi {
  int count = 0;
  List<Teacher> rows = [];

  SearchTutorApi.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    rows = json['rows'].map<Teacher>((e) => Teacher.fromJson(e)).toList();
  }

  static Future<SearchTutorApi> searchTutor(
      {required TutorsFilter tutorsFilter}) async {
    SearchTutorApi searchTutorApi;
    var uri = Uri.parse(Apis.searchTutor);

    final SharedPreferences predf = await SharedPreferences.getInstance();

    List<String> specialties =
        tutorsFilter.specialty.isNotEmpty ? [tutorsFilter.specialty] : [];
    String search = tutorsFilter.search;
    String page = tutorsFilter.page;
    String perPage = tutorsFilter.perPage;

    Map body = {
      "filters": {
        "specialties": specialties,
      },
      "page": page,
      "perPage": perPage,
      "search": search,
    };

    var response = await http.post(uri,
        body: json.encode(body),
        headers: headers(token: predf.getString("access_token")));

    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      searchTutorApi = SearchTutorApi.fromJson(data);
      return searchTutorApi;
    } else {
      var errorResponse = ErrorResponse.fromJson(data);
      print("error: ${errorResponse.message}");
      throw Exception(errorResponse.message);
    }
  }

  static Future<List<Specialty>> getSpecialties() async {
    List<Specialty> specialties = [];

    var uri1 = Uri.parse(Apis.learnTopic);
    var uri2 = Uri.parse(Apis.testPreparation);

    final SharedPreferences predf = await SharedPreferences.getInstance();

    var response1 = await http.get(uri1,
        headers: headers(token: predf.getString("access_token")));

    var response2 = await http.get(uri2,
        headers: headers(token: predf.getString("access_token")));

    dynamic data1 = json.decode(response1.body);
    dynamic data2 = json.decode(response2.body);

    if (response1.statusCode == 200 && response2.statusCode == 200) {
      var data = data1 + data2;
      specialties = data.map<Specialty>((e) => Specialty.fromJson(e)).toList();
      return specialties;
    } else {
      var errorResponse = ErrorResponse.fromJson(data1);
      print("error: ${errorResponse.message}");
      throw Exception(errorResponse.message);
    }
  }
}

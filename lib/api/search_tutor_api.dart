import 'dart:convert';

import 'package:lettutor/api/apis.dart';
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/error_response.dart';
import 'package:lettutor/models/filters.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchTutorApi {
  int count = 0;
  List<Teacher> rows = [];

  SearchTutorApi.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    rows = json['rows'].map<Teacher>((e) => Teacher.fromJson(e)).toList();
  }

  static Future<SearchTutorApi> searchTutor(
      {String? specialties, String page = '1', int perPage = 12}) async {
    SearchTutorApi searchTutorApi;
    var uri = Uri.parse(Apis.searchTutor);

    final SharedPreferences predf = await SharedPreferences.getInstance();

    var response = await http.post(uri,
        body: {
          // "filter": json.encode(),
        },
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
}

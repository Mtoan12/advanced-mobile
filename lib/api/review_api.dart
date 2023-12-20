import 'dart:convert';

import 'package:lettutor/api/apis.dart';
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/reviews.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReviewApi {
  static Future<Reviews> getTutorReviews(
      {required String tutorId, int page = 1, int perPage = 12}) async {
    Reviews reviews;
    var uri = Uri.parse(Apis.getTutorReviews(tutorId, page, perPage));

    final SharedPreferences predf = await SharedPreferences.getInstance();
    var response = await http.get(uri,
        headers: headers(token: predf.getString("access_token")));
    dynamic data = json.decode(response.body);

    if (response.statusCode == 200) {
      reviews = Reviews.fromJson(data);
      for (var element in reviews.rows) {
        print(element);
      }
      return reviews;
    } else {
      throw Exception("Error: ${data['message']}");
    }
  }
}

import 'dart:convert';

import 'package:lettutor/api/apis.dart';
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/reviews.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReviewApi {
  String message;
  Reviews data;

  ReviewApi.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = Reviews.fromJson(json['data']);

  static Future<ReviewApi> getTutorReviews(
      {required String tutorId, int page = 1, int perPage = 12}) async {
    ReviewApi reviewApi;
    var uri = Uri.parse(Apis.getTutorReviews(tutorId, page, perPage));

    final SharedPreferences predf = await SharedPreferences.getInstance();
    var response = await http.get(uri,
        headers: headers(token: predf.getString("access_token")));
    dynamic data = json.decode(response.body);

    if (response.statusCode == 200) {
      reviewApi = ReviewApi.fromJson(data);
      print(reviewApi.data.rows[0].firstInfo?.name);
      return reviewApi;
    } else {
      throw Exception("Error: ${data['message']}");
    }
  }
}

import 'dart:convert';

import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingApi {
  int count;
  List<Schedule> rows;

  BookingApi.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        rows = json['rows']
            .map<Schedule>((schedule) => Schedule.fromJson(schedule))
            .toList();

  static Future<BookingApi> getBookingList(
      {int page = 1,
      int perPage = 12,
      int inFuture = 1,
      String orderBy = 'meeting',
      String sortBy = 'asc'}) async {
    BookingApi bookingApi;
    var uri = Uri.parse(
        "https://sandbox.api.lettutor.com/booking/list/student?page=$page&perPage=$perPage&inFuture=$inFuture&orderBy=$orderBy&sortBy=$sortBy");

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(uri,
        headers: headers(token: prefs.getString("access_token")));

    dynamic data = json.decode(response.body);
    print("data:::::$data");
    if (response.statusCode == 200) {
      bookingApi = BookingApi.fromJson(data['data']);
      return bookingApi;
    } else {
      throw Exception(data['message']);
    }
  }
}

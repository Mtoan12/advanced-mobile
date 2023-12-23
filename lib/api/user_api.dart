import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lettutor/api/apis.dart';
import 'package:lettutor/api/headers.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  static Future<User> getUser() async {
    User user;

    var url = Uri.parse(Apis.userInfo);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.get(url,
        headers: headers(token: prefs.getString("access_token")));

    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      user = User.fromJson(data['user']);
      return user;
    } else {
      throw Exception(data['message']);
    }
  }

  static Future<User> updateUser(
      {required String name,
      required String country,
      required DateTime birthday,
      required String level,
      required String studySchedule}) async {
    User user;
    var url = Uri.parse(Apis.userInfo);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final dateFormat = DateFormat('yyyy-MM-dd');

    Map body = {
      "name": name,
      "country": country,
      "birthday": dateFormat.format(birthday),
      "level": Utils.levelMap(level),
      'studySchedule': studySchedule
    };

    var response = await http.put(url,
        headers: headers(token: prefs.getString("access_token")),
        body: json.encode(body));
    print("body ${json.encode(body)}");
    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      user = User.fromJson(data['user']);
      return user;
    } else {
      throw Exception(data['message']);
    }
  }

  static Future uploadAvatar(File avatar) async {
    // request: avatar: binary multipart/form-data

    var url = Uri.parse(Apis.uploadAvatar);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('avatar', avatar.path));
    request.headers.addAll({
      "Authorization": "Bearer ${prefs.getString("access_token")}",
      "Content-Type": "multipart/form-data"
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

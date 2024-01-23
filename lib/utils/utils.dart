import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class Utils {
  List<Teacher> filterTeachers(
      {required List<Teacher> teachers,
      required String search,
      required String national,
      required String specKey}) {
    List<Teacher> filteredTeachers = teachers;

    if (search != '') {
      filteredTeachers = filteredTeachers
          .where((teacher) =>
              teacher.name!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    if (national != '') {
      filteredTeachers = filteredTeachers
          .where((teacher) =>
              teacher.country!.toLowerCase().contains(national.toLowerCase()))
          .toList();
    }

    if (specKey != 'All') {
      filteredTeachers = filteredTeachers.where((teacher) {
        return teacher.specialties!.contains(specKey);
      }).toList();
    }
    return filteredTeachers;
  }

  String formatDate(String date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(DateTime.parse(date));

    return formatted;
  }

  String convertTime(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;

    String formatted = '$hours hours $minutes minutes';

    return formatted;
  }

  String convertDate(String date) {
    DateTime parsedDate = DateFormat("yyyy-MM-dd").parse(date);

    String formattedDate = DateFormat("E, dd MMM yy").format(parsedDate);

    return formattedDate;
  }

  String levelsMap(String levelNumber) {
    Map<String, String> levels = {
      '0': 'Any Level',
      '1': 'Beginner',
      '2': 'Upper-Beginner',
      '3': 'Pre-Intermediate',
      '4': 'Intermediate',
      '5': 'Upper-Intermediate',
      '6': 'Pre-Advanced',
      '7': 'Advanced',
    };

    return levels[levelNumber]!;
  }

  static List<Teacher> sortTeachers(List<Teacher> teachers) {
    teachers.sort((a, b) {
      if (a.isFavoriteTutor != b.isFavoriteTutor) {
        return a.isFavoriteTutor! ? -1 : 1;
      } else {
        return (a.rating! - b.rating!) > 0 ? -1 : 1;
      }
    });

    return teachers;
  }

  static String getSpecialtyName(List<Specialty> specialties, String key) {
    Specialty? find =
        specialties.firstWhereOrNull((element) => element.key == key);

    return find != null ? find.name! : '';
  }

  static String formatTimeDifference(int minutesDifference) {
    if (minutesDifference < 1) {
      return "just now";
    } else if (minutesDifference == 1) {
      return "1 minute ago";
    } else if (minutesDifference < 60) {
      return "$minutesDifference minutes ago";
    } else if (minutesDifference < 24 * 60) {
      // Calculate hours and remaining minutes
      int hours = minutesDifference ~/ 60;

      if (hours == 1) {
        return "1 hour ago";
      } else {
        return "$hours hours ago";
      }
    } else {
      // Calculate days, hours, and remaining minutes
      int days = minutesDifference ~/ (24 * 60);

      if (days == 1) {
        return "1 day ago";
      } else {
        return "$days days ago";
      }
    }
  }

  // Map below Strings
  static String levelMap(String level) {
    Map<String, String> levels = {
      'BEGINNER': 'Pre A1 (Beginner)',
      'HIGHER_BEGINNER': 'A1 (Higher Beginner)',
      'PRE_INTERMEDIATE': 'A2 (Pre-Intermediate)',
      'INTERMEDIATE': 'B1 (Intermediate)',
      'UPPER_INTERMEDIATE': 'B2 (Upper-Intermediate)',
      'ADVANCED': 'C1 (Advanced)',
      'PROFICIENCY': 'C2 (Proficiency)',
    };

    Map<String, String> levelsBack = {
      'Pre A1 (Beginner)': 'BEGINNER',
      'A1 (Higher Beginner)': 'HIGHER_BEGINNER',
      'A2 (Pre-Intermediate)': 'PRE_INTERMEDIATE',
      'B1 (Intermediate)': 'INTERMEDIATE',
      'B2 (Upper-Intermediate)': 'UPPER_INTERMEDIATE',
      'C1 (Advanced)': 'ADVANCED',
      'C2 (Proficiency)': 'PROFICIENCY',
    };

    if (levels.keys.contains(level)) {
      print("level: $level");
      print("level: ${levels[level]}");
      return levels[level]!;
    } else {
      return levelsBack[level]!;
    }
  }

  static String convertTimeStamp(int timeStamp) {
    // timeStamp += 8 * 60 * 60 * 1000;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);

    final dateFormat = DateFormat('E, d MMM yy HH:mm');
    String result = dateFormat.format(dateTime);
    return result;
  }

  static joinMeeting(String userId, String tutorId, String token) async {
    var jitsiMeet = JitsiMeet();
    var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.lettutor.com",
        room: "$userId-$tutorId",
        configOverrides: {
          "startWithAudioMuted": false,
          "startWithVideoMuted": false,
          "subject": "Jitsi with Flutter",
        },
        featureFlags: {"unsaferoomwarning.enabled": false},
        token: token);
    jitsiMeet.join(options);
  }

  static scrollToTop(ScrollController scrollController) {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  static checkIfInTwoHours(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    DateTime now = DateTime.now();

    return dateTime.difference(now).inHours <= 2;
  }

  static String _formatTwoDigits(int value) {
    // Helper function to ensure two-digit formatting
    return value.toString().padLeft(2, '0');
  }

  static String addTimeZone(String? time, int? timezone) {
    // Parse the input time string
    time = time ?? '00:00';
    timezone = timezone ?? 0;
    DateTime inputTime = DateTime.parse("2022-01-01 $time:00");

    // Add hours
    DateTime resultTime = inputTime.add(Duration(hours: timezone));

    // Format the result time as a string
    String resultTimeString =
        "${_formatTwoDigits(resultTime.hour)}:${_formatTwoDigits(resultTime.minute)}";

    return resultTimeString;
  }

  static DateTime parseDateString(String inputDate) {
    // Assuming inputDate is in the format 'yyyy-M-d'
    List<String> parts = inputDate.split('-');

    // Ensure parts have at least year, month, and day
    if (parts.length < 3) {
      throw const FormatException("Invalid date format");
    }

    // Pad month and day with leading zeros if necessary
    String year = parts[0];
    String month = parts[1].padLeft(2, '0');
    String day = parts[2].padLeft(2, '0');

    // Create a formatted date string
    String formattedDate = '$year-$month-$day';

    // Parse the formatted date
    DateTime parsedDate = DateTime.parse(formattedDate);

    return parsedDate;
  }
}

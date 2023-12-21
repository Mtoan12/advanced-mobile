import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/models/teacher.dart';

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
      int remainingMinutes = minutesDifference % 60;

      if (hours == 1) {
        return "1 hour ago";
      } else {
        return "$hours hours ago";
      }
    } else {
      // Calculate days, hours, and remaining minutes
      int days = minutesDifference ~/ (24 * 60);
      int remainingHours = (minutesDifference % (24 * 60)) ~/ 60;

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
}

/* 
  BEGINNER <-> Pre A1 (Beginner), 
  HIGHER_BEGINNER <-> A1 (Higher Beginner), 
  PRE_INTERMEDIATE <-> A2 (Pre-Intermediate), 
  INTERMEDIATE <-> B1 (Intermediate), 
  UPPER_INTERMEDIATE <-> B2 (Upper-Intermediate), 
  ADVANCED <-> C1 (Advanced), 
  PROFICIENCY <-> C2 (Proficiency)
*/


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
}

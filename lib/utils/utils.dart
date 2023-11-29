import 'package:intl/intl.dart';
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
    // Parse the input string to obtain a DateTime object
    DateTime parsedDate = DateFormat("yyyy-dd-MM").parse(date);

    // Format the DateTime object to the desired output format
    String formattedDate = DateFormat("E, dd MMM yy").format(parsedDate);

    return formattedDate;
  }
}

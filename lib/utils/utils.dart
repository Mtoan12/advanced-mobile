import 'package:lettutor/models/teacher.dart';

class Utils {
  List<Teacher> filterTeachers(
      List<Teacher> teachers, String search, String specKey) {
    List<Teacher> filteredTeachers = teachers;
    if (search != '') {
      filteredTeachers = filteredTeachers
          .where((teacher) =>
              teacher.name!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    if (specKey != 'All') {
      filteredTeachers = filteredTeachers.where((teacher) {
        return teacher.specialties!.contains(specKey);
      }).toList();
    }
    return filteredTeachers;
  }
}

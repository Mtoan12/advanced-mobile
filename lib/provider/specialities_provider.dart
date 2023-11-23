import 'dart:convert';

import 'package:lettutor/json/specialities.dart';
import 'package:lettutor/models/speciality.dart';

class SpecialtiesProvider {
  List<Specialty> specialities = [];

  SpecialtiesProvider() {
    var list = json.decode(specialitiesJson) as List<dynamic>;
    specialities = list.map((e) => Specialty.fromJson(e)).toList();
  }
}

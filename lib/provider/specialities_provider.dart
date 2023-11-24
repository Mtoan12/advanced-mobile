import 'dart:convert';

import 'package:get/get.dart';
import 'package:lettutor/json/specialities.dart';
import 'package:lettutor/models/speciality.dart';

class SpecialtiesProvider {
  List<Specialty> specialties = [];

  SpecialtiesProvider() {
    var list = json.decode(specialitiesJson) as List<dynamic>;
    specialties = list.map((e) => Specialty.fromJson(e)).toList();
  }

  List<Specialty> loadSpecialties() {
    var list = json.decode(specialitiesJson) as List<dynamic>;
    specialties = list.map((e) => Specialty.fromJson(e)).toList();

    return specialties;
  }

  String getSpecialtyName(String key) {
    Specialty? find =
        specialties.firstWhereOrNull((element) => element.key == key);

    return find != null ? find.name! : '';
  }

  List<String> mapSpecialtiesName(List<String> keys) {
    return keys.map((key) => getSpecialtyName(key)).toList();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:lettutor/store/store.dart';

Store store = Store();

class TeachersListProvider extends ChangeNotifier {
  List<Teacher> teachers = store.TEACHERS_LIST;

}

import 'package:flutter/material.dart';
import 'package:lettutor/provider/specialities_provider.dart';
import 'package:lettutor/provider/teachers_list_provider.dart';
import 'package:lettutor/screens/teachers_list_screen/filters_teachers.dart';
import 'package:lettutor/screens/teachers_list_screen/incoming_lesson.dart';
import 'package:lettutor/screens/teachers_list_screen/teachers_suggestion.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class TeachersListScreen extends StatefulWidget {
  const TeachersListScreen({super.key});

  @override
  State<TeachersListScreen> createState() => _TeachersListScreenState();
}

class _TeachersListScreenState extends State<TeachersListScreen> {
  String specActive = 'All';

  void changeSpecActive(String spec) {
    setState(() {
      specActive = spec;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    TeachersListProvider teachersListProvider =
        context.watch<TeachersListProvider>();
    SpecialtiesProvider specialtiesProvider =
        context.watch<SpecialtiesProvider>();

    specialtiesProvider.specialities.forEach((element) {
      print(element.name);
    });
    return Scaffold(
      appBar: appBar(),
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.01,
            right: screenHeight * 0.01,
          ),
          child: Container(
            width: screenWidth,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IncomingLessonWidget(),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03, right: screenWidth * 0.03),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FiltersTeachersWidget(
                          spec: specActive, changeSpecActive: changeSpecActive),
                      SizedBox(
                        height: 24,
                      ),
                      TeachersSuggestionWidget(
                          teachers: teachersListProvider.teachers),
                      SizedBox(
                        height: 28,
                      ),
                      NumberPaginator(
                        numberPages: 1,
                        onPageChange: (int index) {
                          // handle page change...
                        },
                      ),
                      SizedBox(
                        height: 120,
                      ),
                    ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

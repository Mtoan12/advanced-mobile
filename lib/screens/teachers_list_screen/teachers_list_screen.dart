import 'package:flutter/material.dart';
import 'package:lettutor/api/search_tutor_api.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:lettutor/models/tutors_filter.dart';
import 'package:lettutor/screens/teachers_list_screen/filters_teachers.dart';
import 'package:lettutor/screens/teachers_list_screen/incoming_lesson.dart';
import 'package:lettutor/screens/teachers_list_screen/teachers_suggestion.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';

class TeachersListScreen extends StatefulWidget {
  const TeachersListScreen({super.key});

  @override
  State<TeachersListScreen> createState() => _TeachersListScreenState();
}

class _TeachersListScreenState extends State<TeachersListScreen> {
  String specKeyActive = 'All';
  String search = '';
  String national = '';

  List<Teacher> teachers = [];
  List<Specialty> specialties = [];
  TutorsFilter tutorsFilter = TutorsFilter();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchTeachers();
    fetchSpecialties();
  }

  fetchTeachers() {
    SearchTutorApi.searchTutor(tutorsFilter: tutorsFilter).then((data) {
      List<Teacher> sortTeachers = Utils.sortTeachers(data.rows);
      setState(() {
        teachers = sortTeachers;
      });
    });
  }

  fetchSpecialties() {
    SearchTutorApi.getSpecialties().then((data) {
      setState(() {
        specialties = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    void changeSpecActive(String specKey) {
      setState(() {
        specKeyActive = specKey;
      });
      tutorsFilter.specialty = specKey;
      fetchTeachers();
    }

    void handleSearch(String search) {
      setState(() {
        this.search = search;
      });
      tutorsFilter.search = search;
      fetchTeachers();
    }

    void handleNationalChange(String national) {
      setState(() {
        this.national = national;
      });
    }

    return Scaffold(
      appBar: appBar(context),
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.01,
            right: screenHeight * 0.01,
          ),
          child: SizedBox(
            width: screenWidth,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const IncomingLessonWidget(),
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
                          spec: specKeyActive,
                          changeSpecActive: changeSpecActive,
                          search: search,
                          handleSearch: handleSearch,
                          national: national,
                          handleNationalChange: handleNationalChange,
                          specialties: specialties),
                      const SizedBox(
                        height: 24,
                      ),
                      TeachersSuggestionWidget(
                          teachers: teachers, specialties: specialties),
                      const SizedBox(
                        height: 28,
                      ),
                      NumberPaginator(
                        numberPages: 1,
                        onPageChange: (int index) {
                          // handle page change...
                        },
                      ),
                      const SizedBox(
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

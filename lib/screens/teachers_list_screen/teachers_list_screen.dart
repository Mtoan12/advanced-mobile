import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:lettutor/api/search_tutor_api.dart';
import 'package:lettutor/localization/locales.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/models/teacher.dart';
import 'package:lettutor/models/tutors_filter.dart';
import 'package:lettutor/provider/teacher_provider.dart';
import 'package:lettutor/screens/teachers_list_screen/filters_teachers.dart';
import 'package:lettutor/screens/teachers_list_screen/incoming_lesson.dart';
import 'package:lettutor/screens/teachers_list_screen/teachers_suggestion.dart';
import 'package:lettutor/utils/utils.dart';
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
  String specKeyActive = 'All';
  String search = '';
  String national = '';
  bool showLikedList = false;
  int teacherNumbers = 0;

  List<Teacher> teachers = [];
  List<Specialty> specialties = [];
  TutorsFilter tutorsFilter = TutorsFilter();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    fetchTeachers();
    fetchLikedTeachers();
    fetchSpecialties();
  }

  fetchLikedTeachers() {
    SearchTutorApi.searchTutor(tutorsFilter: TutorsFilter(perPage: "12"))
        .then((data) {
      List<Teacher> sortTeachers = Utils.sortTeachers(data.rows);

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<TeacherProvider>(context, listen: false)
            .getLikedTeachers(sortTeachers);
      });
    });
  }

  fetchTeachers() {
    SearchTutorApi.searchTutor(tutorsFilter: tutorsFilter).then((data) {
      List<Teacher> sortTeachers = Utils.sortTeachers(data.rows);

      if (showLikedList) {
        sortTeachers =
            sortTeachers.where((element) => element.isFavoriteTutor!).toList();
      }

      setState(() {
        teachers = sortTeachers;
        teacherNumbers = data.count;
      });
    }).then((value) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<TeacherProvider>(context, listen: false)
            .getLikedTeachers(teachers);
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

    void handleShowLiked() {
      setState(() {
        showLikedList = !showLikedList;
      });
      tutorsFilter.isLiked = showLikedList;
      fetchTeachers();
    }

    void handleNationalChange(String national) {
      setState(() {
        this.national = national;
      });
    }

    void handleChangePage(String page) {
      setState(() {
        tutorsFilter.page = page;
      });
      fetchTeachers();
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      appBar: appBar(context),
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        controller: _scrollController,
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
                      ElevatedButton(
                          onPressed: () {
                            handleShowLiked();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blue,
                            backgroundColor:
                                showLikedList ? Colors.blue[50] : Colors.white,
                            side: const BorderSide(color: Colors.blue),
                            textStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: showLikedList
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          child: Text(
                              LocaleData.likedTeachers.getString(context))),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        LocaleData.recommendedTutors.getString(context),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        teachers.isEmpty
                            ? LocaleData.noTutorFound.getString(context)
                            : "We found $teacherNumbers tutors for you",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TeachersSuggestionWidget(
                          teachers: teachers, specialties: specialties),
                      const SizedBox(
                        height: 28,
                      ),
                      NumberPaginator(
                        numberPages: teacherNumbers ~/
                                double.parse(tutorsFilter.perPage) +
                            1,
                        showNextButton: false,
                        showPrevButton: false,
                        onPageChange: (int index) {
                          handleChangePage((index + 1).toString());
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

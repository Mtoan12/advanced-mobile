import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/models/schedule/schedule_detail_info.dart';
import 'package:lettutor/models/schedule/schedule_info.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:lettutor/provider/schedule_provider.dart';
import 'package:lettutor/provider/tutor_provider.dart';
import 'package:lettutor/screens/teacher_detail_screen/comments.dart';
import 'package:lettutor/screens/teacher_detail_screen/teacher_information.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/TextInput.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/button.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class TeacherDetailScreen extends StatefulWidget {
  final String id;

  const TeacherDetailScreen({super.key, required this.id});

  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  Utils utils = Utils();
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    TutorProvider tutorProvider = context.watch<TutorProvider>();

    String id = widget.id;

    Tutor? tutor = tutorProvider.getTutorById(id);
    

    return Scaffold(
      appBar: appBar(context),
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenHeight * 0.05,
          ),
          child: SizedBox(
            width: screenWidth,
            child: tutor != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TeacherInformationWidget(
                        user: tutor.user,
                        rating: tutor.avgRating,
                        bio: tutor.bio,
                        isFavorite: tutor.isFavorite ?? false,
                        videoUrl: tutor.video,
                        education: tutor.education,
                        languages: tutor.languages,
                        specialties: tutor.specialties,
                        experience: tutor.experience,
                        courses: tutor.user?.courses ?? [],
                        interests: tutor.interests,
                        id: id,
                      ),
                      const CommentsWidget(),
                      const SizedBox(
                        height: 30,
                      ),
                      const NumberPaginator(numberPages: 1),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: table(context, tutor),
                        ),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  )
                : Container(),
          ),
        ),
      ),
    );
  }

  Widget table(BuildContext context, Tutor tutor) {
    ScheduleProvider scheduleProvider = context.watch<ScheduleProvider>();
    List<TableRow> rows = [];
    List<Widget> header = [];
    header.addAll([
      Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: const Border(
            right: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ),
      Container(
        height: 64,
        color: Colors.white,
        child: const Align(
          alignment: Alignment.center,
          child: Text("01/12"),
        ),
      ),
      Container(
        height: 64,
        color: Colors.white,
        child: const Align(
          alignment: Alignment.center,
          child: Text("02/12"),
        ),
      ),
      Container(
        height: 64,
        color: Colors.white,
        child: const Align(
          alignment: Alignment.center,
          child: Text("03/12"),
        ),
      ),
      Container(
        height: 64,
        color: Colors.white,
        child: const Align(
          alignment: Alignment.center,
          child: Text("04/12"),
        ),
      ),
      Container(
        height: 64,
        color: Colors.white,
        child: const Align(
          alignment: Alignment.center,
          child: Text("05/12"),
        ),
      ),
      Container(
        height: 64,
        color: Colors.white,
        child: const Align(
          alignment: Alignment.center,
          child: Text("06/12"),
        ),
      ),
      Container(
        height: 64,
        color: Colors.white,
        child: const Align(
          alignment: Alignment.center,
          child: Text("07/12"),
        ),
      ),
    ]);
    rows.add(TableRow(children: header));
    List<String> times = [
      "00:00 - 00:25",
      "00:30 - 00:55",
      "01:00 - 01:25",
      "01:30 - 01:55",
      "02:00 - 02:25",
      "02:30 - 02:55",
      "03:00 - 03:25",
      "03:30 - 03:55",
      "04:00 - 04:25",
      "04:30 - 04:55",
      "05:00 - 05:25",
      "05:30 - 05:55",
      "06:00 - 06:25",
      "06:30 - 06:55",
      "07:00 - 07:25",
      "07:30 - 07:55",
      "08:00 - 08:25",
      "08:30 - 08:55",
      "09:00 - 09:25",
      "09:30 - 09:55",
      "10:00 - 10:25",
      "10:30 - 10:55",
      "11:00 - 11:25",
      "11:30 - 11:55",
      "12:00 - 12:25",
      "12:30 - 12:55",
      "13:00 - 13:25",
      "13:30 - 13:55",
      "14:00 - 14:25",
      "14:30 - 14:55",
      "15:00 - 15:25",
      "15:30 - 15:55",
      "16:00 - 16:25",
      "16:30 - 16:55",
      "17:00 - 17:25",
      "17:30 - 17:55",
      "18:00 - 18:25",
      "18:30 - 18:55",
      "19:00 - 19:25",
      "19:30 - 19:55",
      "20:00 - 20:25",
      "20:30 - 20:55",
      "21:00 - 21:25",
      "21:30 - 21:55",
      "22:00 - 22:25",
      "22:30 - 22:55",
    ];
    for (var i = 0; i < times.length; i++) {
      List<Widget> row = [];
      row.add(Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: const Border(
            right: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              times[i],
              style: const TextStyle(fontWeight: FontWeight.w700),
            )),
      ));
      for (var j = 0; j < 7; j++) {
        row.add(Container(
          height: 64,
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: ButtonWidget(
                text: "Book",
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      DateTime now = DateTime.now();
                      bool isDisable = false;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 360,
                          // width: screenWidth,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  "Booking Detail",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Wrap(
                                  children: [
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    const Text("Booking Time: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                      "${times[i]} ${utils.convertDate(DateTime(now.year, now.month, now.day + j).toString())}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Note",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                        TextInput(
                                          controller: noteController,
                                          maxLine: 6,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ButtonWidget(
                                    text: "Book",
                                    isDisable: isDisable,
                                    onPressed: () {
                                      ScheduleInfo scheduleInfo = ScheduleInfo(
                                          date: DateTime(now.year, now.month,
                                                  now.day + j)
                                              .toString(),
                                          startTimestamp: 0,
                                          endTimestamp: 0,
                                          id: "",
                                          tutorId: tutor.user!.id,
                                          startTime: times[i].split('-')[0],
                                          endTime: times[i].split('-')[1],
                                          isDeleted: false,
                                          createdAt: DateTime.now().toString(),
                                          updatedAt: DateTime.now().toString(),
                                          tutorInfo: tutor.user!.tutorInfo);

                                      ScheduleDetailInfo newScheduleDetailInfo =
                                          ScheduleDetailInfo(
                                              id: "",
                                              subject: "",
                                              grade: "",
                                              location: "",
                                              duration: "",
                                              price: "",
                                              studentNote: noteController.text,
                                              tutorNote: "",
                                              color: "",
                                              background: "",
                                              status: "",
                                              lessonPlanId: "",
                                              studentRequest:
                                                  noteController.text,
                                              createdAt:
                                                  DateTime.now().toString(),
                                              updatedAt:
                                                  DateTime.now().toString(),
                                              deletedAt:
                                                  DateTime.now().toString(),
                                              recordUrl: "",
                                              lessonPlanNote: "",
                                              learningMethod: "",
                                              lessonPlanNoteItem: "",
                                              lessonPlanIdItem: "",
                                              recordUrlItem: "",
                                              durationItem: "",
                                              scheduleInfo: scheduleInfo);
                                      Schedule newSchedule = Schedule(
                                          createdAtTimeStamp:
                                              DateTime.now().millisecond,
                                          updatedAtTimeStamp:
                                              DateTime.now().millisecond,
                                          id: "",
                                          userId: tutor.user!.id,
                                          scheduleDetailId: "",
                                          tutorMeetingLink: "",
                                          studentMeetingLink: "",
                                          googleMeetLink: "",
                                          studentRequest: noteController.text,
                                          tutorReview: "",
                                          scoreByTutor: "",
                                          createdAt: DateTime.now().toString(),
                                          updatedAt: DateTime.now().toString(),
                                          recordUrl: "",
                                          cancelReasonId: "",
                                          lessonPlanId: "",
                                          cancelNote: "",
                                          calendarId: "",
                                          isDeleted: false,
                                          isTrial: false,
                                          convertedLesson: 1,
                                          scheduleDetailInfo:
                                              newScheduleDetailInfo);

                                      scheduleProvider.addSchedule(newSchedule);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(content: Text('Booked')),
                                      );
                                      // setState(() {
                                      //   isDisable = true;
                                      // });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
        ));
      }
      rows.add(TableRow(children: row));
    }

    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(128),
        1: FixedColumnWidth(128),
        2: FixedColumnWidth(128),
        3: FixedColumnWidth(128),
        4: FixedColumnWidth(128),
        5: FixedColumnWidth(128),
        6: FixedColumnWidth(128),
        7: FixedColumnWidth(128),
        8: FixedColumnWidth(128),
        9: FixedColumnWidth(128),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: rows,
    );
  }
}

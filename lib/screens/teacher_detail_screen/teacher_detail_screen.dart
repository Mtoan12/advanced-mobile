import 'package:flutter/material.dart';
import 'package:lettutor/api/booking_api.dart';
import 'package:lettutor/api/review_api.dart';
import 'package:lettutor/api/schedule_api.dart';
import 'package:lettutor/api/search_tutor_api.dart';
import 'package:lettutor/models/review.dart';
import 'package:lettutor/models/schedule_of_tutor.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/screens/teacher_detail_screen/comments.dart';
import 'package:lettutor/screens/teacher_detail_screen/teacher_information.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/TextInput.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/button.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';

class TeacherDetailScreen extends StatefulWidget {
  final String id;

  const TeacherDetailScreen({super.key, required this.id});

  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  Utils utils = Utils();
  TextEditingController noteController = TextEditingController();

  Tutor tutor = Tutor();
  List<Review> reviews = [];
  List<ScheduleOfTutor> schedules = [];
  List<String> bookTimes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchTutorDetail();

    const int PAGE = 1;
    const int PERPAGE = 12;
    fetchReviews(PAGE, PERPAGE);
    fetchScheduleOfTutor();
  }

  fetchTutorDetail() async {
    SearchTutorApi.getTutor(widget.id).then((data) {
      setState(() {
        tutor = data;
      });
    });
  }

  fetchScheduleOfTutor() async {
    ScheduleApi.getSchedulesOfTutor(widget.id).then((data) {
      setState(() {
        schedules = data;
        bookTimes = schedules
            .map((e) => Utils.convertTimeStamp(e.startTimestamp))
            .toList();
      });
    });
  }

  fetchReviews(int page, int perPage) async {
    ReviewApi.getTutorReviews(tutorId: widget.id, page: page, perPage: perPage)
        .then((res) {
      setState(() {
        reviews = res.data.rows;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

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
            child: Column(
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
                  id: widget.id,
                ),
                CommentsWidget(comments: reviews),
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
            ),
          ),
        ),
      ),
    );
  }

  Widget table(BuildContext context, Tutor tutor) {
    List<TableRow> rows = [];
    List<Widget> header = [];

    header.add(Container(
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
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          "Time",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    ));
    for (int i = 0; i < 7; i++) {
      header.add(Container(
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
            utils.convertDate(DateTime.now().add(Duration(days: i)).toString()),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ));
    }

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
        DateTime now = DateTime.now();
        String date = utils
            .convertDate(DateTime(now.year, now.month, now.day + j).toString());
        String time = times[i];

        ScheduleOfTutor? scheduleOfTutor =
            ScheduleApi.getScheduleOfTutor(schedules, date, time);

        if (scheduleOfTutor != null) {
          row.add(Container(
            height: 64,
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: scheduleOfTutor.isBooked
                  ? const Text(
                      "Booked",
                      style: TextStyle(color: Colors.green),
                    )
                  : ButtonWidget(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                      fontWeight:
                                                          FontWeight.w700)),
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
                                            BookingApi.booking(
                                                    scheduleOfTutor
                                                        .scheduleDetails[0].id,
                                                    noteController.text)
                                                .then((value) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text('Booked')),
                                              );
                                              fetchScheduleOfTutor();
                                              Navigator.pop(context);
                                            });
                                            // setState(() {
                                            //   isDisable = true;
                                            // });
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
        } else {
          row.add(Container(
            height: 64,
            color: Colors.white,
          ));
        }
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

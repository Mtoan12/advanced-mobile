import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/provider/tutor_provider.dart';
import 'package:lettutor/screens/teacher_detail_screen/comments.dart';
import 'package:lettutor/screens/teacher_detail_screen/teacher_information.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/button.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class TeacherDetailScreen extends StatefulWidget {
  const TeacherDetailScreen({super.key});

  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  Utils utils = Utils();
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    TutorProvider tutorProvider = context.watch<TutorProvider>();

    Map<String, dynamic> qparams =
        GoRouterState.of(context).uri.queryParameters;
    String? id = qparams['id'] ?? '4d54d3d7-d2a9-42e5-97a2-5ed38af5789a';

    Tutor? tutor = tutorProvider.getTutorById(id);

    return Scaffold(
      appBar: appBar(context),
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenHeight * 0.05,
          ),
          child: Container(
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
                      CommentsWidget(),
                      SizedBox(
                        height: 30,
                      ),
                      NumberPaginator(numberPages: 1),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: table(),
                        ),
                      ),
                      SizedBox(
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

  Widget table() {
    List<TableRow> rows = [];
    List<Widget> header = [];
    header.addAll([
      Container(
        height: 64,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border(
            right: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ),
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("01/12"),
        ),
        height: 64,
        color: Colors.white,
      ),
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("02/12"),
        ),
        height: 64,
        color: Colors.white,
      ),
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("03/12"),
        ),
        height: 64,
        color: Colors.white,
      ),
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("04/12"),
        ),
        height: 64,
        color: Colors.white,
      ),
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("05/12"),
        ),
        height: 64,
        color: Colors.white,
      ),
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("06/12"),
        ),
        height: 64,
        color: Colors.white,
      ),
      Container(
        child: Align(
          alignment: Alignment.center,
          child: Text("07/12"),
        ),
        height: 64,
        color: Colors.white,
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
        child: Align(
            alignment: Alignment.center,
            child: Text(
              times[i],
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
        height: 64,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border(
            right: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ));
      for (var j = 0; j < 7; j++) {
        row.add(Container(
          child: Align(
            alignment: Alignment.center,
            child: ButtonWidget(
                text: "Book",
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      DateTime now = DateTime.now();
                      return Container(
                        height: 360,
                        // width: screenWidth,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Booking Detail",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Wrap(
                                children: [
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text("Booking Time: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  Text(
                                    "${times[i]} ${utils.convertDate(DateTime(now.year, now.month, now.day + j).toString())}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
          height: 64,
          color: Colors.white,
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

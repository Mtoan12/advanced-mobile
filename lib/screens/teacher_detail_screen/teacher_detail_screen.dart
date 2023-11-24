import 'package:flutter/material.dart';
import 'package:lettutor/screens/teacher_detail_screen/comments.dart';
import 'package:lettutor/screens/teacher_detail_screen/teacher_information.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';

class TeacherDetailScreen extends StatefulWidget {
  const TeacherDetailScreen({super.key});

  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenHeight * 0.05,
          ),
          child: Container(
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TeacherInformationWidget(),
                CommentsWidget(),
                SizedBox(
                  height: 30,
                ),
                NumberPaginator(numberPages: 1),
                SizedBox(
                  height: 40,
                ),
                // BookTableWidget(),
                SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/provider/tutor_provider.dart';
import 'package:lettutor/screens/teacher_detail_screen/comments.dart';
import 'package:lettutor/screens/teacher_detail_screen/teacher_information.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

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
    TutorProvider tutorProvider = context.watch<TutorProvider>();
    // Uri uri = Uri.parse(Uri.base.fragment);
    // String? id = uri.queryParameters['id'];

    Map<String, dynamic> qparams =
        GoRouterState.of(context).uri.queryParameters;
    String? id = qparams['id'];

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
                      ),
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
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}

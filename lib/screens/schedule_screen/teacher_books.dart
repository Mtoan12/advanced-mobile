import 'package:flutter/material.dart';
import 'package:lettutor/screens/schedule_screen/schedule_card.dart';

class TeacherBooksWidget extends StatefulWidget {
  const TeacherBooksWidget({super.key});

  @override
  State<TeacherBooksWidget> createState() => _TeacherBooksWidgetState();
}

class _TeacherBooksWidgetState extends State<TeacherBooksWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScheduleCardWidget(
            date: "T6, 27 Thg 10 23",
            lessonsQuantity: 1,
            imgUrl:
                "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
            name: "Keegan",
            national: "Tunisia",
            time: "05:30 - 05:55",
            request: "Tôi muốn học"),
        SizedBox(
          height: 24,
        ),
        ScheduleCardWidget(
            date: "T7, 28 Thg 10 23",
            lessonsQuantity: 1,
            imgUrl:
                "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
            name: "Keegan",
            national: "Tunisia",
            time: "15:30 - 15:55",
            request:
                "Currently there are no requests for this class. Please write down any requests for the teacher."),
      ],
    );
  }
}

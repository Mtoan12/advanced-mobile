import 'package:flutter/material.dart';
import 'package:lettutor/screens/history_screen/history_card.dart';

class HistoryCardsWidget extends StatefulWidget {
  const HistoryCardsWidget({super.key});

  @override
  State<HistoryCardsWidget> createState() => _HistoryCardsWidgetState();
}

class _HistoryCardsWidgetState extends State<HistoryCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HistoryCardWidget(
          imgUrl:
              "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
          name: "Keegan",
          national: "Tunisia",
          lessonTime: "19:30 - 19:55",
          date: "T3, 31 Thg 10 23",
          updateTime: "1 hour ago",
          request: "",
          review: "",
          rating: 0,
        ),
        SizedBox(
          height: 20,
        ),
        HistoryCardWidget(
          imgUrl:
              "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg",
          name: "Keegan",
          national: "Tunisia",
          lessonTime: "00:00 - 00:25",
          date: "T2, 23 Thg 10 23",
          updateTime: "1 week ago",
          request: "Hello World...",
          review:
              "Lesson status: Completed\nBehavior (⭐⭐⭐⭐⭐): aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\nListening:\nSpeaking (⭐⭐⭐⭐⭐):\nVocabulary (⭐⭐⭐⭐⭐):\nOverall comment: Good",
          rating: 5,
        )
      ],
    );
  }
}

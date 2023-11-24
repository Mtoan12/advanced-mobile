import 'package:flutter/material.dart';
import 'package:lettutor/widgets/comment.dart';

class CommentsWidget extends StatefulWidget {
  const CommentsWidget({super.key});

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Người khác đánh giá",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16,
        ),
        Column(
          children: [
            CommentWidget(
              imgUrl:
                  "https://sandbox.api.lettutor.com/avatar/cb9e7deb-3382-48db-b07c-90acf52f541cavatar1686550060378.jpg",
              username: "Hưng Flutter God",
              stars: 5,
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              date: '3 ngày trước',
            ),
            SizedBox(
              height: 24,
            ),
            CommentWidget(
              imgUrl:
                  "https://sandbox.api.lettutor.com/avatar/cb9e7deb-3382-48db-b07c-90acf52f541cavatar1686550060378.jpg",
              username: "Hưng Flutter God",
              stars: 5,
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              date: '3 ngày trước',
            )
          ],
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lettutor/widgets/stars.dart';

class CommentWidget extends StatelessWidget {
  final String imgUrl;
  final String username;
  final String date;
  final double stars;
  final String content;

  const CommentWidget(
      {super.key,
      required this.imgUrl,
      required this.username,
      required this.stars,
      required this.content,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
        ),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    username,
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                  )
                ],
              ),
              StarsWidget(rating: stars),
              Text(content)
            ],
          ),
        )
      ],
    );
  }
}

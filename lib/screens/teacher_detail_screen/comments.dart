import 'package:flutter/material.dart';
import 'package:lettutor/models/review.dart';
import 'package:lettutor/provider/review_provider.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/comment.dart';
import 'package:provider/provider.dart';

class CommentsWidget extends StatefulWidget {
  final List<Review> comments;
  const CommentsWidget({super.key, required this.comments});

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    List<Review> comments = widget.comments;

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Người khác đánh giá",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          children: comments
              .map(
                (comment) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: CommentWidget(
                    imgUrl:
                        comment.firstInfo?.avatar ?? "assets/images/avatar.png",
                    username: comment.firstInfo?.name ?? "",
                    stars: comment.rating ?? 0,
                    content: comment.content ?? "",
                    date: utils.formatDate(comment.createdAt ?? ""),
                  ),
                ),
              )
              .toList(),
        ),
      ]),
    );
  }
}

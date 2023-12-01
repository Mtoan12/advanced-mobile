import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  final double rating;
  const StarsWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    if (rating == 0) {
      list.add(const Text(
        "No reviews yet",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic),
      ));
    } else {
      for (var i = 1; i <= 5; i++) {
        if (i < rating + 1) {
          list.add(Icon(
            Icons.star,
            color: Colors.yellow[600],
          ));
        } else {
          list.add(Icon(
            Icons.star,
            color: Colors.grey.withOpacity(0.4),
          ));
        }
      }
    }
    return Row(children: list);
  }
}

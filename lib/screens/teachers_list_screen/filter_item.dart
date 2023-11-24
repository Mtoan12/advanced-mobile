import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  final String name;
  final bool active;
  final Function() onPressed;
  const FilterItem(
      {super.key,
      required this.name,
      required this.active,
      required this.onPressed});

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
            backgroundColor: widget.active ? Colors.blue[50] : Colors.grey[200],
            foregroundColor:
                widget.active ? Colors.blue[700] : Colors.grey[700],
          ),
          onPressed: widget.onPressed,
          child: Text(widget.name)),
    );
  }
}

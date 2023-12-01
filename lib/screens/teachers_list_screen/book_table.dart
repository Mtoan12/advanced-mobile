import 'package:flutter/material.dart';

class BookTableWidget extends StatefulWidget {
  const BookTableWidget({super.key});

  @override
  State<BookTableWidget> createState() => _BookTableWidgetState();
}

class _BookTableWidgetState extends State<BookTableWidget> {
  List<Widget> _buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        color: Colors.white,
        margin: const EdgeInsets.all(4.0),
        child: Text(
          "${index + 1}",
        ),
      ),
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildCells(20),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildRows(20),
            ),
          ),
        ],
      ),
    );
  }
}

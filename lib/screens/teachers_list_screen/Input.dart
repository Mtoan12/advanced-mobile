import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String placeHolder;
  final Icon icon;
  final double width;
  final double height;
  const Input({
    super.key,
    required this.placeHolder,
    required this.icon,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: TextField(
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            suffixIcon: icon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(width: 3, color: Colors.blue),
            ),
            hintText: placeHolder,
            hintStyle: TextStyle(fontSize: 10),
            hoverColor: Colors.blue,
            contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 12),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ));
  }
}

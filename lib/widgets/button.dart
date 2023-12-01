import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isDisable;
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isDisable = false});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                widget.isDisable ? Colors.grey[200] : Colors.blue[700]),
        onPressed: widget.isDisable ? null : widget.onPressed,
        child: Text(
          widget.text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ));
  }
}

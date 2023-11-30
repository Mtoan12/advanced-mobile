import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.controller,
    this.placeHolder,
    this.maxLine,
  }) : super(key: key);

  final TextEditingController controller;
  final String? placeHolder;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(width: 3, color: Colors.blue),
        ),
        hintText: placeHolder,
        hintStyle: TextStyle(fontSize: 10),
        hoverColor: Colors.blue,
        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 12),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      // validator: (value) {
      //   return Validation.required(value);
      // },
    );
  }
}

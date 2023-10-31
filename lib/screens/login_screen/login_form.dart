import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "emailLabel".tr,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.005,
        ),
        const TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hintText: 'mail@example.com',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "passwordLabel".tr,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.005,
        ),
        const TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
        ),
        SizedBox(
          height: screenHeight * 0.015,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "forgotPassword".tr,
            textAlign: TextAlign.start,
            style:
                TextStyle(color: Colors.blue[500], fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.012,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              backgroundColor: Colors.blue[500],
              foregroundColor: Colors.white,
              minimumSize: Size.fromHeight(screenHeight * 0.05),
            ),
            onPressed: () {},
            child: Text(
              "loginButton".tr,
              style: TextStyle(fontSize: screenHeight * 0.02),
            )),
      ],
    );
  }
}

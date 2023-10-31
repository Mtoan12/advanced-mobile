import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/screens/login_screen/login_form.dart';
import 'package:lettutor/screens/login_screen/login_icons.dart';
import 'package:lettutor/widgets/change_language_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String lang = "Vietnamese";
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          title: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 60),
                    blurRadius: 8)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/images/lettutor_logo.svg",
                  width: screenWidth * 0.4,
                ),
                const ChangeLanguageButton()
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.08,
            right: MediaQuery.of(context).size.width * 0.08,
          ),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/login_banner.png",
                    height: screenHeight * 0.25,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    "loginTitle".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenHeight * 0.035,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue[700]),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    "loginDescription".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenHeight * 0.015,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  LoginForm(),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    "continueLabel".tr,
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  LoginIcons(),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("haveNoAccount".tr),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.blue[500]),
                          onPressed: () {},
                          child: Text("SignInLabel".tr))
                    ],
                  )
                ]),
          ),
        ));
  }
}

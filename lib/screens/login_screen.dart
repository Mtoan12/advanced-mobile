import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/localization_service.dart';

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
                changeLanguageButton()
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
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
                        suffixIcon: Icon(Icons.remove_red_eye_rounded),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
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
                      style: TextStyle(
                          color: Colors.blue[500], fontWeight: FontWeight.w500),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: screenHeight * 0.024,
                        child: SvgPicture.asset(
                          "assets/images/facebook-logo.svg",
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      CircleAvatar(
                        radius: screenHeight * 0.024,
                        child:
                            SvgPicture.asset("assets/images/google-logo.svg"),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      CircleAvatar(
                        radius: screenHeight * 0.024,
                        child:
                            SvgPicture.asset("assets/images/mobile-logo.svg"),
                      )
                    ],
                  ),
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

  Widget changeLanguageButton() {
    return Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          DropdownButton<String>(
              selectedItemBuilder: (context) {
                return LocalizationService.langs.map<Widget>((String value) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      CircleAvatar(
                          radius: 12,
                          child: SvgPicture.asset("assets/images/$lang.svg")),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  );
                }).toList();
              },
              items: LocalizationService.langs
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/images/$value.svg",
                        height: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: value == lang
                                ? FontWeight.w700
                                : FontWeight.w500),
                      )
                    ],
                  ),
                );
              }).toList(),
              value: lang,
              iconSize: 0.0,
              underline: Container(
                color: Colors.transparent,
              ),
              isExpanded: false,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (newVal) {
                setState(() {
                  lang = newVal!;
                  LocalizationService().changeLocale(lang);
                });
              })
        ]));
  }
}

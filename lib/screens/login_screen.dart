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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/images/lettutor_logo.svg",
                  width: 172,
                ),
                ChangeLanguageButton()
              ],
            ),
          ),
        ),
        body: Text("loginTitle".tr));
  }

  Widget ChangeLanguageButton() {
    return Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          DropdownButton<String>(
              selectedItemBuilder: (context) {
                return LocalizationService.langs.map<Widget>((String value) {
                  return Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        CircleAvatar(
                            radius: 12,
                            child: SvgPicture.asset("assets/images/$lang.svg")),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
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
                      SizedBox(
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

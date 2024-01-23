import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '925564155670-rbmqgsh995dssgjhb21ufam2leltl9jn.apps.googleusercontent.com',
    scopes: [
      'email',
      'openid',
      'profile',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
}

class LoginIcons extends StatelessWidget {
  const LoginIcons({super.key});

  Future<void> _handleSignIn() async {
    try {
      dynamic res = await GoogleLogin._googleSignIn.signIn();
      print(json.encode(res));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Row(
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
        GestureDetector(
          onTap: () async {
            await _handleSignIn();
          },
          child: CircleAvatar(
            radius: screenHeight * 0.024,
            child: SvgPicture.asset("assets/images/google-logo.svg"),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        CircleAvatar(
          radius: screenHeight * 0.024,
          child: SvgPicture.asset("assets/images/mobile-logo.svg"),
        )
      ],
    );
  }
}

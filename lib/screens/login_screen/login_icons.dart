import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginIcons extends StatelessWidget {
  const LoginIcons({super.key});

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
        CircleAvatar(
          radius: screenHeight * 0.024,
          child: SvgPicture.asset("assets/images/google-logo.svg"),
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

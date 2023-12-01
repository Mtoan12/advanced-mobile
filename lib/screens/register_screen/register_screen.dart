import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/router/app_router_constant.dart';
import 'package:lettutor/screens/login_screen/login_icons.dart';
import 'package:lettutor/screens/register_screen/register_form.dart';
import 'package:lettutor/widgets/change_language_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String lang = "Vietnamese";
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    AuthProvider authProvider = context.watch<AuthProvider>();

    if (authProvider.user != null) {
      context.goNamed(AppRouterConstant.teachersListRouteName);
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          title: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 60),
                    blurRadius: 10)
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
                  Expanded(
                    child: Image.network(
                      "assets/images/login_banner.png",
                      height: screenHeight * 0.25,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    "Start learning with LetTutor",
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
                    "Become fluent faster through one on one video chat lessons tailored to your goals.",
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
                  const RegisterForm(),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Text(
                    "Or continue with",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const LoginIcons(),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.blue[500]),
                          onPressed: () {
                            context.goNamed(AppRouterConstant.loginRouteName);
                          },
                          child: const Text("Log in"))
                    ],
                  )
                ]),
          ),
        ));
  }
}

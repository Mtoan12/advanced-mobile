import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/widgets/change_language_button.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

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
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Text(
                    "Please enter your email address to search for your account.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.005,
                          ),
                          TextFormField(
                            controller: emailEditingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8)),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              authProvider.error,
                              style: TextStyle(color: Colors.red[400]),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                backgroundColor: Colors.blue[500],
                                foregroundColor: Colors.white,
                                minimumSize:
                                    Size.fromHeight(screenHeight * 0.05),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  authProvider
                                      .forgotPassword(
                                    email: emailEditingController.text,
                                  )
                                      .then((value) {
                                    if (value is String) {
                                      if (value.contains("error")) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.red[400]),
                                          ),
                                        ));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.green[400]),
                                          ),
                                        ));
                                        Navigator.pop(context);
                                      }
                                    }
                                  });
                                }
                              },
                              child: Text(
                                "Send reset link",
                                style: TextStyle(fontSize: screenHeight * 0.02),
                              )),
                        ],
                      ))
                ]),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/router/app_router_constant.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();
    var screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "EMAIL".tr,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.grey),
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
              "PASSWORD".tr,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.005,
          ),
          TextFormField(
            controller: passwordEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              authProvider.error,
              style: TextStyle(color: Colors.red[400]),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              child: Text(
                "Forgot Password?".tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.blue[500], fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                context.goNamed(AppRouterConstant.forgotPasswordRouteName);
              },
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
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  authProvider.login(
                      email: emailEditingController.text,
                      password: passwordEditingController.text);
                  // if (authRepository.user) {
                  //   context.goNamed(AppRouterConstant.teachersListRouteName);
                  // }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text(
                "LOG IN".tr,
                style: TextStyle(fontSize: screenHeight * 0.02),
              )),
        ],
      ),
    );
  }
}

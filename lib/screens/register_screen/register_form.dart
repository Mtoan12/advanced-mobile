import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
                  authProvider.signUp(
                      email: emailEditingController.text,
                      password: passwordEditingController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(fontSize: screenHeight * 0.02),
              )),
        ],
      ),
    );
  }
}

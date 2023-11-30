import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/provider/user_provider.dart';
import 'package:lettutor/screens/profile_screen/profile_form.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    UserProvider userProvider = context.watch<UserProvider>();
    User user = userProvider.user;

    return Scaffold(
        appBar: appBar(context),
        endDrawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.005,
              right: screenWidth * 0.005,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 2.0, right: 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(userProvider.user.avatar!)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        userProvider.user.name ?? "",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Account ID: ${userProvider.user.id}'),
                      SizedBox(
                        height: 48,
                      ),
                      ProfileFormWidget(
                        user: user,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Future getImage() async {
    final selectedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(selectedFile!.path);
    });
  }
}

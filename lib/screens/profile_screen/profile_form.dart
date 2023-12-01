import 'package:flutter/material.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/provider/user_provider.dart';
import 'package:lettutor/widgets/TextINput.dart';
import 'package:provider/provider.dart';

class ProfileFormWidget extends StatefulWidget {
  final User user;
  const ProfileFormWidget({super.key, required this.user});

  @override
  State<ProfileFormWidget> createState() => _ProfileFormWidgetState();
}

class _ProfileFormWidgetState extends State<ProfileFormWidget> {
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController countryEditingController =
      TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();

  final TextEditingController wantToLearnEditingController =
      TextEditingController();
  final TextEditingController studyScheduleEditingController =
      TextEditingController();

  DateTime birthday = DateTime.now();
  String dropdownValue = "Pre A1 (Beginner)";

  @override
  void initState() {
    super.initState();
    nameEditingController.text = widget.user.name ?? "";
    emailEditingController.text = widget.user.email ?? "";
    countryEditingController.text = widget.user.country ?? "";
    phoneEditingController.text = widget.user.phone ?? "";
    wantToLearnEditingController.text = widget.user.requireNote ?? "";
    studyScheduleEditingController.text = widget.user.studySchedule ?? "";

    birthday = widget.user.birthday ?? DateTime.now();

    if (widget.user.level == '') {
      dropdownValue = "Pre A1 (Beginner)";
    } else {
      dropdownValue = widget.user.level!;
    }
  }

  void handleLevelChange(String value) {
    setState(() {
      dropdownValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1)),
              child: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8),
                child: Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextInput(
                          controller: nameEditingController,
                          placeHolder: "Enter your name",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email Address",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextInput(
                          controller: emailEditingController,
                          placeHolder: "Enter your email",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Country",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextInput(
                          controller: countryEditingController,
                          placeHolder: "Enter your country",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextInput(
                          controller: phoneEditingController,
                          placeHolder: "Enter your phone number",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Birthday",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: InputDatePickerFormField(
                          acceptEmptyDate: true,
                          initialDate: birthday,
                          onDateSaved: (value) {
                            setState(() {
                              birthday = value;
                            });
                          },
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Level",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            items: <String>[
                              'Pre A1 (Beginner)',
                              'A1 (Higher Beginner)',
                              'A2 (Pre-Intermediate)',
                              'B1 (Intermediate)',
                              'B2 (Upper-Intermediate)',
                              'C1 (Advanced)',
                              'C2 (Proficiency)',
                              'Upper A1 (High Beginner)',
                              'Upper A2 (Pre Intermediate)'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              handleLevelChange(value!);
                            },
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Want to learn",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextInput(
                          controller: wantToLearnEditingController,
                          placeHolder: "Want to learn",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Study Schedule",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextInput(
                          maxLine: 4,
                          controller: studyScheduleEditingController,
                          placeHolder:
                              "Note the time of the week you want to study on LetTutor",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[700]),
                          onPressed: () {
                            String name = nameEditingController.text;
                            String email = emailEditingController.text;
                            String country = countryEditingController.text;
                            String phone = phoneEditingController.text;
                            String requiredNote =
                                wantToLearnEditingController.text;
                            String studySchedule =
                                studyScheduleEditingController.text;

                            userProvider.updateProfile(
                                name: name,
                                email: email,
                                country: country,
                                phone: phone,
                                birthday: birthday,
                                level: dropdownValue,
                                requireNote: requiredNote,
                                studySchedule: studySchedule);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Saved')),
                            );
                          },
                          child: Text(
                            "Save change",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )))
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

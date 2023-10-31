import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/screens/teachers_list_screen/Input.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';

class FiltersTeachersWidget extends StatefulWidget {
  const FiltersTeachersWidget({super.key});

  @override
  State<FiltersTeachersWidget> createState() => _FiltersTeachersWidgetState();
}

class _FiltersTeachersWidgetState extends State<FiltersTeachersWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "findATutor".tr,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          children: [
            Input(
              width: 160,
              height: 32,
              icon: Icon(null),
              placeHolder: "enterTutorName".tr,
            ),
            SizedBox(
              width: 4,
            ),
            Input(
              width: 160,
              height: 32,
              icon: Icon(Icons.arrow_drop_down),
              placeHolder: "selectTutorNationality".tr,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "selectAvailableTutoringTime".tr,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Wrap(
          children: [
            Input(
              width: 144,
              height: 32,
              icon: Icon(
                Icons.calendar_month,
                color: Colors.grey,
              ),
              placeHolder: "selectADay".tr,
            ),
            SizedBox(
              width: 4,
            ),
            Input(
              width: 100,
              height: 32,
              icon: Icon(null),
              placeHolder: "startTime".tr,
            ),
            Input(
              width: 100,
              height: 32,
              icon: Icon(
                Icons.timelapse,
                color: Colors.grey,
              ),
              placeHolder: "endTime".tr,
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
          )),
          child: Padding(
            padding: EdgeInsets.only(bottom: 28),
            child: Wrap(runSpacing: 8, spacing: 4, children: [
              FilterItem(
                name: "all".tr,
                active: true,
              ),
              FilterItem(
                name: "englishForKids".tr,
                active: false,
              ),
              FilterItem(
                name: "englishForBusiness".tr,
                active: false,
              ),
              FilterItem(
                name: "conversational".tr,
                active: false,
              ),
              FilterItem(
                name: "STARTERS",
                active: false,
              ),
              FilterItem(
                name: "MOVERS",
                active: false,
              ),
              FilterItem(
                name: "FLYERS",
                active: false,
              ),
              FilterItem(
                name: "KET",
                active: false,
              ),
              FilterItem(
                name: "PET",
                active: false,
              ),
              FilterItem(
                name: "IELTS",
                active: false,
              ),
              FilterItem(
                name: "TOEFL",
                active: false,
              ),
              FilterItem(
                name: "TOEIC",
                active: false,
              ),
              SizedBox(
                height: 32,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 2, bottom: 2),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue[300],
                        side: BorderSide(width: 1, color: Colors.blue)),
                    onPressed: () {},
                    child: Text(
                      'resetFilters'.tr,
                    )),
              )
            ]),
          ),
        )
      ],
    );
  }
}

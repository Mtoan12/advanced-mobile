import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/provider/specialities_provider.dart';
import 'package:lettutor/screens/teachers_list_screen/Input.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';
import 'package:provider/provider.dart';

class FiltersTeachersWidget extends StatefulWidget {
  const FiltersTeachersWidget({super.key});

  @override
  State<FiltersTeachersWidget> createState() => _FiltersTeachersWidgetState();
}

class _FiltersTeachersWidgetState extends State<FiltersTeachersWidget> {
  @override
  Widget build(BuildContext context) {
    SpecialtiesProvider specialtiesProvider =
        context.watch<SpecialtiesProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Find a tutor".tr,
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
              placeHolder: "Enter tutor name...".tr,
            ),
            SizedBox(
              width: 4,
            ),
            Input(
              width: 160,
              height: 32,
              icon: Icon(Icons.arrow_drop_down),
              placeHolder: "Select tutor nationality".tr,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Select available tutoring time:".tr,
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
              placeHolder: "Select a day".tr,
            ),
            SizedBox(
              width: 4,
            ),
            Input(
              width: 100,
              height: 32,
              icon: Icon(null),
              placeHolder: "Start time".tr,
            ),
            Input(
              width: 100,
              height: 32,
              icon: Icon(
                Icons.timelapse,
                color: Colors.grey,
              ),
              placeHolder: "End Time".tr,
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
              child: specialitiesWidget(context)),
        )
      ],
    );
  }

  Widget specialitiesWidget(BuildContext context) {
    SpecialtiesProvider specialtiesProvider =
        context.watch<SpecialtiesProvider>();
    var specialities = specialtiesProvider.specialities;

    List<Widget> list = [];
    list.add(
      FilterItem(
        name: "All".tr,
        active: true,
      ),
    );
    for (Specialty speciality in specialities) {
      list.add(
        FilterItem(
          name: speciality.name!,
          active: false,
        ),
      );
    }
    list.add(SizedBox(
      height: 32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue[300],
              side: BorderSide(width: 1, color: Colors.blue)),
          onPressed: () {},
          child: Text(
            'Reset Filters'.tr,
          )),
    ));
    return Wrap(
      runSpacing: 8,
      spacing: 4,
      children: list,
    );
  }
}

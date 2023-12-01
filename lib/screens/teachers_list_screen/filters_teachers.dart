import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/provider/specialities_provider.dart';
import 'package:lettutor/screens/teachers_list_screen/Input.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';
import 'package:provider/provider.dart';

class FiltersTeachersWidget extends StatefulWidget {
  final String spec;
  final Function(String spec) changeSpecActive;
  final String search;
  final Function(String search) handleSearch;
  final String national;
  final Function(String national) handleNationalChange;

  const FiltersTeachersWidget(
      {super.key,
      required this.spec,
      required this.changeSpecActive,
      required this.handleSearch,
      required this.search,
      required this.national,
      required this.handleNationalChange});

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
              height: 40,
              icon: const Icon(Icons.search_outlined),
              placeHolder: "Enter tutor name...".tr,
              value: widget.search,
              handleChange: widget.handleSearch,
            ),
            const SizedBox(
              width: 4,
            ),
            Input(
              value: widget.national,
              handleChange: widget.handleNationalChange,
              width: 160,
              height: 40,
              icon: const Icon(Icons.arrow_drop_down),
              placeHolder: "Select tutor nationality".tr,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Select available tutoring time:".tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Wrap(
          children: [
            Input(
              value: '',
              handleChange: (String value) {},
              width: 144,
              height: 40,
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.grey,
              ),
              placeHolder: "Select a day".tr,
            ),
            const SizedBox(
              width: 4,
            ),
            Input(
              value: '',
              handleChange: (String value) {},
              width: 100,
              height: 40,
              icon: const Icon(null),
              placeHolder: "Start time".tr,
            ),
            Input(
              value: '',
              handleChange: (String value) {},
              width: 100,
              height: 40,
              icon: const Icon(
                Icons.timelapse,
                color: Colors.grey,
              ),
              placeHolder: "End Time".tr,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
          )),
          child: Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: specialtiesWidget(context)),
        )
      ],
    );
  }

  Widget specialtiesWidget(BuildContext context) {
    SpecialtiesProvider specialtiesProvider =
        context.watch<SpecialtiesProvider>();
    var specialities = specialtiesProvider.specialties;

    List<Widget> list = [];
    list.add(
      FilterItem(
        onPressed: () {
          widget.changeSpecActive("All");
        },
        name: "All".tr,
        active: widget.spec == "All",
      ),
    );
    for (Specialty speciality in specialities) {
      list.add(
        FilterItem(
          onPressed: () {
            widget.changeSpecActive(speciality.key!);
          },
          name: speciality.name!,
          active: speciality.key == widget.spec,
        ),
      );
    }
    list.add(SizedBox(
      height: 40,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue[300],
              side: const BorderSide(width: 1, color: Colors.blue)),
          onPressed: () {
            setState(() {
              widget.changeSpecActive("All");
              widget.handleSearch("");
              widget.handleNationalChange("");
            });
          },
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

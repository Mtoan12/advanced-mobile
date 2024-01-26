import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:lettutor/localization/locales.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/screens/teachers_list_screen/Input.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';

class FiltersTeachersWidget extends StatefulWidget {
  final String spec;
  final Function(String spec) changeSpecActive;
  final String search;
  final Function(String search) handleSearch;
  final String national;
  final Function(String national) handleNationalChange;
  final List<Specialty> specialties;

  const FiltersTeachersWidget(
      {super.key,
      required this.spec,
      required this.changeSpecActive,
      required this.handleSearch,
      required this.search,
      required this.national,
      required this.handleNationalChange,
      required this.specialties});

  @override
  State<FiltersTeachersWidget> createState() => _FiltersTeachersWidgetState();
}

class _FiltersTeachersWidgetState extends State<FiltersTeachersWidget> {
  @override
  Widget build(BuildContext context) {
    List<Specialty> specialties = widget.specialties;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleData.findATutor.getString(context),
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
              placeHolder: LocaleData.enterTutorName.getString(context),
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
              placeHolder: LocaleData.selectTutorNationality.getString(context),
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
              child: specialtiesWidget(context, specialties)),
        )
      ],
    );
  }

  Widget specialtiesWidget(BuildContext context, List<Specialty> specialties) {
    List<Widget> list = [];
    list.add(
      FilterItem(
        onPressed: () {
          widget.changeSpecActive("");
        },
        name: "All".tr,
        active: widget.spec == "All",
      ),
    );
    for (Specialty speciality in specialties) {
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
              widget.changeSpecActive("");
              widget.handleSearch("");
              widget.handleNationalChange("");
            });
          },
          child: Text(
            LocaleData.resetFilters.getString(context),
          )),
    ));
    return Wrap(
      runSpacing: 8,
      spacing: 4,
      children: list,
    );
  }
}

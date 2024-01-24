import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesFiltersWidget extends StatefulWidget {
  final Function handleSearch;

  const CoursesFiltersWidget({super.key, required this.handleSearch});

  @override
  State<CoursesFiltersWidget> createState() => _CoursesFiltersWidgetState();
}

class _CoursesFiltersWidgetState extends State<CoursesFiltersWidget> {
  String q = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    q = value;
                  });
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10),
                    hintText: "Course".tr,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ))),
              ),
            ),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, border: Border.all(width: 1)),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  widget.handleSearch(q);
                },
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InputFilterWidget(
                    hintText: "Select level".tr,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: InputFilterWidget(
                  hintText: "Select Category".tr,
                )),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            InputFilterWidget(
              hintText: "Sort by level".tr,
            ),
          ],
        )
      ],
    );
  }
}

class InputFilterWidget extends StatefulWidget {
  final String hintText;

  const InputFilterWidget({super.key, required this.hintText});

  @override
  State<InputFilterWidget> createState() => _InputFilterWidgetState();
}

class _InputFilterWidgetState extends State<InputFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.expand_more,
            color: Colors.grey,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          hintText: widget.hintText,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.blue)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ))),
    );
  }
}

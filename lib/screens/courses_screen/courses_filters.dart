import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesFiltersWidget extends StatefulWidget {
  const CoursesFiltersWidget({super.key});

  @override
  State<CoursesFiltersWidget> createState() => _CoursesFiltersWidgetState();
}

class _CoursesFiltersWidgetState extends State<CoursesFiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                    hintText: "course".tr,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    border: OutlineInputBorder(
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
                icon: Icon(Icons.search),
                onPressed: () {
                  // Xử lý sự kiện khi nhấn vào biểu tượng tìm kiếm
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InputFilterWidget(
                    hintText: "selectLevel".tr,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: InputFilterWidget(
                  hintText: "selectCategory".tr,
                )),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            InputFilterWidget(
              hintText: "sortByLevel".tr,
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
          suffixIcon: Icon(
            Icons.expand_more,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          hintText: widget.hintText,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.blue)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ))),
    );
  }
}

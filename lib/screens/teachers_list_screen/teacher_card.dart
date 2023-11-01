import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';

class TeacherCard extends StatelessWidget {
  final String imgUrl;
  final bool hasLiked;
  final String name;
  final String national;
  final double stars;
  final List<String> filters;
  final String description;

  const TeacherCard(
      {super.key,
      required this.imgUrl,
      required this.hasLiked,
      required this.name,
      required this.national,
      required this.stars,
      required this.filters,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 1.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(imgUrl),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Text(national,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Wrap(
                    runSpacing: 8,
                    spacing: 4,
                    children: filters.map((filter) {
                      return FilterItem(name: filter, active: true);
                    }).toList()),
                SizedBox(
                  height: 24,
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue[500],
                              side: BorderSide(color: Colors.blue)),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(
                                width: 4,
                              ),
                              Text("book".tr),
                            ],
                          )),
                    ))
              ],
            ),
            Positioned(
                right: 0,
                child: Icon(
                  hasLiked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.blue,
                  size: 32,
                ))
          ],
        ),
      ),
    );
  }
}

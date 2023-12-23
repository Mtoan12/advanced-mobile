import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/api/tutor_api.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/router/app_router_constant.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/stars.dart';

class TeacherCard extends StatefulWidget {
  final String id;
  final String imgUrl;
  final bool hasLiked;
  final String name;
  final String national;
  final double stars;
  final List<String> filters;
  final String description;

  final List<Specialty> specialties;

  const TeacherCard(
      {super.key,
      required this.imgUrl,
      required this.hasLiked,
      required this.name,
      required this.national,
      required this.stars,
      required this.filters,
      required this.description,
      required this.id,
      required this.specialties});

  @override
  State<TeacherCard> createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  bool hasLiked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      hasLiked = widget.hasLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRouterConstant.teacherDetailRouteName,
          extra: widget.id),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
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
              const BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(widget.imgUrl),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      // SvgPicture.network(
                      //     "https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.4.3/flags/4x3/${national}.svg"),
                      Text(widget.national,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  StarsWidget(rating: widget.stars),
                  const SizedBox(
                    height: 24,
                  ),
                  widget.filters.isNotEmpty
                      ? Wrap(
                          runSpacing: 8,
                          spacing: 4,
                          children: widget.filters.map((filter) {
                            return FilterItem(
                              name: Utils.getSpecialtyName(
                                  widget.specialties, filter),
                              active: true,
                              onPressed: () {},
                            );
                          }).toList())
                      : Container(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue[500],
                                side: const BorderSide(color: Colors.blue)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.calendar_today),
                                const SizedBox(
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
                  child: TextButton(
                    onPressed: () {
                      TutorApi.like(widget.id).then((value) {
                        setState(() {
                          hasLiked = !hasLiked;
                        });
                      });
                    },
                    child: Icon(
                      hasLiked ? Icons.favorite : Icons.favorite_border,
                      color: hasLiked ? Colors.red[400] : Colors.blue,
                      size: 32,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

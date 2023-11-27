import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/provider/specialities_provider.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';
import 'package:lettutor/widgets/stars.dart';
import 'package:lettutor/widgets/video_player.dart';
import 'package:provider/provider.dart';

class TeacherInformationWidget extends StatefulWidget {
  String? bio;
  User? user;
  double? rating;
  bool isFavorite;
  String? videoUrl;
  String? education;
  String? languages;
  String? specialties;
  List<Course> courses;
  String? interests;
  String? experience;

  TeacherInformationWidget(
      {super.key,
      this.bio,
      this.user,
      this.rating,
      this.isFavorite = false,
      this.videoUrl,
      this.education,
      this.languages,
      this.specialties,
      required this.courses,
      this.interests,
      this.experience});

  @override
  State<TeacherInformationWidget> createState() =>
      _TeacherInformationWidgetState();
}

class _TeacherInformationWidgetState extends State<TeacherInformationWidget> {
  @override
  Widget build(BuildContext context) {
    SpecialtiesProvider specialtiesProvider =
        context.watch<SpecialtiesProvider>();

    List<String> educations = widget.education.toString().split(",");
    List<String> languages = widget.languages.toString().split(",");
    List<String> specialties = widget.specialties.toString().split(",");

    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    widget.user?.avatar ?? "https://picsum.photos/200/300"),
                radius: 56,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.user?.name ?? "",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                StarsWidget(rating: widget.rating ?? 0),
                SizedBox(
                  height: 12,
                ),
                Text(
                  widget.user?.country ?? "",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.bio ?? "",
              style: TextStyle(fontSize: 16),
            )),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.isFavorite
                    ? Icon(Icons.favorite, color: Colors.red[400])
                    : Icon(Icons.favorite_border, color: Colors.blue),
                Text(
                  "Favorite",
                  style: TextStyle(
                      color: widget.isFavorite
                          ? Colors.red[400]
                          : Colors.blue[500],
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: Colors.blue),
                Text(
                  "Report",
                  style: TextStyle(
                      color: Colors.blue[500], fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 300,
          child: VideoPlayerWidget(
            videoUrl: widget.videoUrl ??
                "https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4",
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Học vấn",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: educations.isNotEmpty
                  ? Wrap(
                      runSpacing: 8,
                      spacing: 4,
                      children: educations.map((item) {
                        return FilterItem(
                          name: item,
                          active: false,
                          onPressed: () {},
                        );
                      }).toList())
                  : Container(),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Ngôn ngữ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: languages.isNotEmpty
                  ? Wrap(
                      runSpacing: 8,
                      spacing: 4,
                      children: languages.map((item) {
                        return FilterItem(
                          name: item,
                          active: true,
                          onPressed: () {},
                        );
                      }).toList())
                  : Container(),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Chuyên ngành",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.03),
              child: specialties.isNotEmpty
                  ? Wrap(
                      runSpacing: 8,
                      spacing: 4,
                      children: specialties.map((item) {
                        return FilterItem(
                          name: specialtiesProvider.getSpecialtyName(item),
                          active: true,
                          onPressed: () {},
                        );
                      }).toList())
                  : Container(),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Khóa học tham khảo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: widget.courses.isNotEmpty
                    ? Column(
                        children: widget.courses
                            .map((course) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        course.name ?? "",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Tìm hiểu",
                                      style: TextStyle(
                                          color: Colors.blue[500],
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ))
                            .toList())
                    : Container()),
            SizedBox(
              height: 24,
            ),
            Text(
              "Sở thích",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: Text(
                  widget.interests ?? "",
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 24,
            ),
            Text(
              "Kinh nghiệm giảng dạy",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: Text(
                  widget.experience ?? "",
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 24,
            ),
          ]),
        )
      ],
    );
  }
}

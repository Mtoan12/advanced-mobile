import 'package:flutter/material.dart';
import 'package:lettutor/api/search_tutor_api.dart';
import 'package:lettutor/api/tutor_api.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/speciality.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/stars.dart';
import 'package:lettutor/widgets/video_player.dart';

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
  String? id;

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
      this.experience,
      this.id});

  @override
  State<TeacherInformationWidget> createState() =>
      _TeacherInformationWidgetState();
}

class _TeacherInformationWidgetState extends State<TeacherInformationWidget> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  List<Specialty> specialtiesList = [];
  bool isFavorite = false;

  @override
  void didUpdateWidget(covariant TeacherInformationWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    setState(() {
      isFavorite = widget.isFavorite;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SearchTutorApi.getSpecialties().then((data) {
      setState(() {
        specialtiesList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.user?.name ?? "",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                StarsWidget(rating: widget.rating ?? 0),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  widget.user?.country ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.bio ?? "",
              style: const TextStyle(fontSize: 16),
            )),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => {
                TutorApi.like(widget.id!).then((value) {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                })
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isFavorite
                      ? Icon(Icons.favorite, color: Colors.red[400])
                      : const Icon(Icons.favorite_border, color: Colors.blue),
                  Text(
                    "Favorite",
                    style: TextStyle(
                        color: isFavorite ? Colors.red[400] : Colors.blue[500],
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 360,
                      width: screenWidth,
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Report ${widget.user?.name ?? ""}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "Help us understand what's happening",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Column(
                              children: [
                                CheckboxListTile(
                                  title:
                                      const Text("This tutor is annoying me"),
                                  value: value1,
                                  onChanged: (newValue) {
                                    setState(() {
                                      value1 = newValue!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity
                                      .leading, //  <-- leading Checkbox
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      "This profile is pretending be someone or is fake"),
                                  value: value2,
                                  onChanged: (newValue) {
                                    setState(() {
                                      value2 = newValue!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity
                                      .leading, //  <-- leading Checkbox
                                ),
                                CheckboxListTile(
                                  title:
                                      const Text("Inappropriate profile photo"),
                                  value: value3,
                                  onChanged: (newValue) {
                                    setState(() {
                                      value3 = newValue!;
                                    });
                                  },
                                  controlAffinity: ListTileControlAffinity
                                      .leading, //  <-- leading Checkbox
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.blue[500],
                                      side:
                                          const BorderSide(color: Colors.blue),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Text('Cancel'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue[500],
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    child: const Text('Submit'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.blue),
                  Text(
                    "Report",
                    style: TextStyle(
                        color: Colors.blue[500], fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 300,
          child: VideoPlayerWidget(
            videoUrl: widget.videoUrl ??
                "https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4",
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Học vấn",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
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
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Ngôn ngữ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
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
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Chuyên ngành",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
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
                          name: Utils.getSpecialtyName(specialtiesList, item),
                          active: true,
                          onPressed: () {},
                        );
                      }).toList())
                  : Container(),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Khóa học tham khảo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
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
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(
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
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Sở thích",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: Text(
                  widget.interests ?? "",
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Kinh nghiệm giảng dạy",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.03),
                child: Text(
                  widget.experience ?? "",
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 24,
            ),
          ]),
        )
      ],
    );
  }
}

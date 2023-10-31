import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/comment.dart';
import 'package:lettutor/screens/teachers_list_screen/filter_item.dart';
import 'package:lettutor/widgets/video_player.dart';
import 'package:number_paginator/number_paginator.dart';

class TeacherDetailScreen extends StatefulWidget {
  const TeacherDetailScreen({super.key});

  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenHeight * 0.05,
          ),
          child: Container(
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/teacher.jpg"),
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
                          "Keegan",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
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
                              color: Colors.grey[200],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Tunisia",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.",
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
                        Icon(Icons.favorite_border, color: Colors.blue),
                        Text(
                          "Favorite",
                          style: TextStyle(
                              color: Colors.blue[500],
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
                              color: Colors.blue[500],
                              fontWeight: FontWeight.w500),
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
                    videoUrl:
                        "https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4",
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Học vấn",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.03),
                          child: Wrap(runSpacing: 8, spacing: 8, children: [
                            FilterItem(name: "BA", active: false)
                          ]),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Ngôn ngữ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.03),
                          child: Wrap(runSpacing: 8, spacing: 8, children: [
                            FilterItem(name: "English", active: true)
                          ]),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Chuyên ngành",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.03),
                          child: Wrap(runSpacing: 8, spacing: 4, children: [
                            FilterItem(
                                name: "englishForBusiness".tr, active: true),
                            FilterItem(name: "conversational".tr, active: true),
                            FilterItem(name: "englishForKids".tr, active: true),
                            FilterItem(name: "IELTS", active: true),
                            FilterItem(name: "STARTERS", active: true),
                            FilterItem(name: "MOVERS", active: true),
                            FilterItem(name: "FLYERS", active: true),
                            FilterItem(name: "KET", active: true),
                            FilterItem(name: "PET", active: true),
                            FilterItem(name: "TOEFL", active: true),
                            FilterItem(name: "TOEIC", active: true),
                          ]),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Khóa học tham khảo",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.03),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Basic Conservation Topics: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Tìm hiểu",
                                    style: TextStyle(
                                        color: Colors.blue[500],
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Life in the Internet Age: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Tìm hiểu",
                                    style: TextStyle(
                                        color: Colors.blue[500],
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Sở thích",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03),
                            child: Text(
                              "I loved the weather, the scenery amd the laid back filestyle of the locals.",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Kinh nghiệm giảng dạy",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.03),
                            child: Text(
                              "I have more than 10 years of teaching english experience",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Người khác đánh giá",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            CommentWidget(
                              imgUrl:
                                  "https://sandbox.api.lettutor.com/avatar/cb9e7deb-3382-48db-b07c-90acf52f541cavatar1686550060378.jpg",
                              username: "Hưng Flutter God",
                              stars: 5,
                              content:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              date: '3 ngày trước',
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            CommentWidget(
                              imgUrl:
                                  "https://sandbox.api.lettutor.com/avatar/cb9e7deb-3382-48db-b07c-90acf52f541cavatar1686550060378.jpg",
                              username: "Hưng Flutter God",
                              stars: 5,
                              content:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              date: '3 ngày trước',
                            )
                          ],
                        )
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                NumberPaginator(numberPages: 1),
                SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

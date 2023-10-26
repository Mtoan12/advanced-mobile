import 'package:flutter/material.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/video_player.dart';

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
                Text(
                  "Học vấn",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                
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

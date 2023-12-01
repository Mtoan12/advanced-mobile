import 'package:flutter/material.dart';
import 'package:lettutor/screens/video_call_screen/video_call_controller.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: const Stack(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg"),
                radius: 64,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: VideoCallControllerWidget(),
            ),
          ],
        ));
  }
}

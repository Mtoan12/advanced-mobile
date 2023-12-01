import 'package:flutter/material.dart';

class VideoCallControllerWidget extends StatefulWidget {
  const VideoCallControllerWidget({super.key});

  @override
  State<VideoCallControllerWidget> createState() =>
      _VideoCallControllerWidgetState();
}

class _VideoCallControllerWidgetState extends State<VideoCallControllerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.minPositive,
      height: 40,
      color: Colors.black.withOpacity(0.8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.mic,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.videocam_off_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.screen_share_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.mode_comment_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.front_hand_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.crop_free_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.more_horiz_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(7.5),
                child: Icon(
                  Icons.call_end_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
    );
  }
}

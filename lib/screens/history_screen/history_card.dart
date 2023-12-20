import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/utils/utils.dart';

class HistoryCardWidget extends StatefulWidget {
  final String date;
  final String updateTime;
  final String imgUrl;
  final String name;
  final String national;
  final String lessonTime;
  final String request;
  final String review;
  final int rating;
  final String createdAt;

  const HistoryCardWidget({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.national,
    required this.lessonTime,
    required this.date,
    required this.updateTime,
    required this.request,
    required this.review,
    required this.rating,
    required this.createdAt,
  });

  @override
  State<HistoryCardWidget> createState() => HistoryCardWidgetState();
}

class HistoryCardWidgetState extends State<HistoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime createTime = DateTime.parse(widget.createdAt);
    DateTime now = DateTime.now();

    Duration difference = now.difference(createTime);
    int minutesDifference = difference.inMinutes;
    String timeDiff = Utils.formatTimeDifference(minutesDifference);
    List<Widget> starsWidget = [];
    for (var i = 0; i < widget.rating; i++) {
      starsWidget.add(Icon(
        Icons.star,
        color: Colors.yellow[600],
        size: 20,
      ));
    }
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.date,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(timeDiff),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imgUrl != ''
                        ? widget.imgUrl
                        : "https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg"),
                    radius: 32,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.name != '' ? widget.name : "Keegan",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.national != '' ? widget.national : "TN",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_outlined,
                            color: Colors.blue[500],
                            size: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Direct Message".tr,
                            style: TextStyle(
                                fontSize: 12, color: Colors.blue[500]),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "${"Lesson Time".tr} ${widget.lessonTime}",
                  style: const TextStyle(fontSize: 16),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.request.isEmpty
                          ? "No request for lesson".tr
                          : "Request for lesson".tr,
                      style: const TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: widget.request.isEmpty ? 0 : 20,
                    ),
                    Text(
                      widget.request,
                      style:
                          TextStyle(fontSize: widget.request.isEmpty ? 0 : 12),
                    ),
                    SizedBox(
                      height: widget.request.isEmpty ? 0 : 20,
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 1,
          ),
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.review.isEmpty
                          ? "Tutor haven't reviewed yet".tr
                          : "Review from tutor".tr,
                      style: const TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: widget.review.isEmpty ? 0 : 20,
                    ),
                    Text(
                      widget.review,
                      style:
                          TextStyle(fontSize: widget.review.isEmpty ? 0 : 12),
                    ),
                    SizedBox(
                      height: widget.review.isEmpty ? 0 : 20,
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 1,
          ),
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.rating == 0 ? "Add a Rating".tr : "Rating",
                          style:
                              TextStyle(fontSize: 12, color: Colors.blue[500]),
                        ),
                        SizedBox(
                          width: widget.rating == 0 ? 0 : 8,
                        ),
                        Row(
                          children: starsWidget,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.rating != 0 ? "Edit".tr : "",
                          style: TextStyle(
                              fontSize: widget.rating == 0 ? 12 : 0,
                              color: Colors.blue[500]),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Report".tr,
                          style:
                              TextStyle(fontSize: 12, color: Colors.blue[500]),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  });

  @override
  State<HistoryCardWidget> createState() => HistoryCardWidgetState();
}

class HistoryCardWidgetState extends State<HistoryCardWidget> {
  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.date,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Text(widget.updateTime),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imgUrl),
                    radius: 32,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.national,
                            style: TextStyle(fontSize: 12),
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
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "directMessage".tr,
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
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "${"lessonTime".tr} ${widget.lessonTime}",
                  style: TextStyle(fontSize: 16),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.request.length == 0 ? "NoRequestForLesson".tr : "requestForLesson".tr}",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: widget.request.length == 0 ? 0 : 20,
                    ),
                    Text(
                      "${widget.request}",
                      style: TextStyle(
                          fontSize: widget.request.length == 0 ? 0 : 12),
                    ),
                    SizedBox(
                      height: widget.request.length == 0 ? 0 : 20,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.review.length == 0 ? "tutorNotReview".tr : "reviewFromTutor".tr}",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: widget.review.length == 0 ? 0 : 20,
                    ),
                    Text(
                      "${widget.review}",
                      style: TextStyle(
                          fontSize: widget.review.length == 0 ? 0 : 12),
                    ),
                    SizedBox(
                      height: widget.review.length == 0 ? 0 : 20,
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.rating == 0 ? "addARating".tr : "Rating"}",
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
                          "${widget.rating != 0 ? "edit".tr : ""}",
                          style: TextStyle(
                              fontSize: widget.rating == 0 ? 12 : 0,
                              color: Colors.blue[500]),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "report".tr,
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
